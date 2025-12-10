from flask import Flask, render_template, render_template_string, redirect, request, url_for, Response
from werkzeug.utils import secure_filename

import pymysql
import os

app = Flask(__name__)


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
app.config["UPLOAD_FOLDER"] = os.path.join(BASE_DIR, "static", "actors")
ALLOWED_EXTENSIONS = {"png", "jpg", "jpeg", "gif", "webp"}

def allowed_file(filename: str) -> bool:
    return "." in filename and filename.rsplit(".", 1)[1].lower() in ALLOWED_EXTENSIONS


# Настройки подключения
DB_HOST = "yfedyakina.mysql.pythonanywhere-services.com"
DB_USER = "yfedyakina"
DB_PASS = "Zxcvbnm9"
DB_NAME = "yfedyakina$DroneShow"

# ----------------------------
# Функция конвертации SELECT → HTML
# ----------------------------
def query_to_html(cursor, query):
    cursor.execute(query)
    rows = cursor.fetchall()
    headers = [desc[0] for desc in cursor.description]

    html = "<table><tr>" + "".join(f"<th>{h}</th>" for h in headers) + "</tr>"
    for row in rows:
        html += "<tr>" + "".join(f"<td>{r}</td>" for r in row) + "</tr>"
    html += "</table>"
    return html

# ----------------------------
# ГЛАВНАЯ страница (index.html)
# ----------------------------
@app.route("/")
def index():
    connection = pymysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS,
        database=DB_NAME, charset="utf8mb4"
    )
    cursor = connection.cursor()

    queries = [
        """SELECT s.id AS ID, s.title AS Спектакль, e.full_name AS Режиссёр, d.name AS Дрон, d.model AS Модель
           FROM shows s JOIN employees e ON s.employee = e.id JOIN drones d ON s.drone = d.id;""",
        """SELECT o.id AS ID, c.organization AS Клиент, s.title AS Спектакль, o.event_date AS Дата, o.price AS Цена, o.status AS Статус
           FROM orders o JOIN clients c ON o.client_id = c.id JOIN shows s ON o.show_id = s.id;""",
        """SELECT s.title AS Спектакль, e.full_name AS Автор, sc.content AS Сценарий
           FROM scripts sc JOIN shows s ON sc.show_id = s.id JOIN employees e ON sc.author = e.id;""",
        """SELECT sh.title AS Спектакль, COUNT(o.id) AS Количество_заказов
           FROM shows sh LEFT JOIN orders o ON sh.id = o.show_id
           WHERE sh.status = 'active' GROUP BY sh.id;"""
    ]

    tables = [query_to_html(cursor, q) for q in queries]

    connection.close()

    return render_template("index.html", tables=tables)

# ----------------------------
# Страница спектаклей (performances.html)
# ----------------------------
@app.route("/performances")
def performances():
    connection = pymysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS,
        database=DB_NAME, charset="utf8mb4"
    )
    cursor = connection.cursor()

    query = """
        SELECT
            p.id AS ID,
            s.title AS Спектакль,
            h.name AS Зал,
            p.start_time AS Начало,
            p.end_time AS Конец,
            p.tickets_sold AS Продано,
            p.tickets_total AS Всего
        FROM performances p
        JOIN halls h ON p.hall_id = h.id
        JOIN shows s ON p.show_id = s.id
        ORDER BY p.start_time;
    """

    cursor.execute(query)
    rows = cursor.fetchall()
    headers = [desc[0] for desc in cursor.description]

    connection.close()

    return render_template("performances.html", headers=headers, rows=rows)

# ----------------------
# СТРАНИЦА ПОКУПКИ БИЛЕТА
# ----------------------
@app.route("/buy/<int:performance_id>")
def buy(performance_id):
    connection = pymysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS,
        database=DB_NAME, charset="utf8mb4"
    )
    cursor = connection.cursor()

    query = """
        SELECT
            t.id AS ticket_id,
            s.row_number AS Ряд,
            s.seat_number AS Место,
            t.price AS Цена
        FROM tickets t
        JOIN seats s ON t.seat_id = s.id
        WHERE t.performance_id = %s AND t.status = 'available'
        ORDER BY s.row_number, s.seat_number;
    """

    cursor.execute(query, (performance_id,))
    rows = cursor.fetchall()
    headers = [desc[0] for desc in cursor.description]

    connection.close()

    return render_template("buy.html", headers=headers, rows=rows, performance_id=performance_id)

# ----------------------
# ПОКУПКА БИЛЕТА (POST)
# ----------------------
@app.route("/buy_ticket", methods=["POST"])
def buy_ticket():
    ticket_id = int(request.form.get("ticket_id"))

    connection = pymysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS,
        database=DB_NAME, charset="utf8mb4"
    )
    cursor = connection.cursor()

    query = """
        UPDATE tickets
        SET status='sold', sold_at=NOW(), buyer_email='test@example.com'
        WHERE id=%s
    """
    cursor.execute(query, (ticket_id,))
    connection.commit()

    connection.close()

    return redirect("/performances")

# ----------------------------
# Страница актеров (actors.html)
# ----------------------------
@app.route("/about/actors")
def actors():
    connection = pymysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS,
        database=DB_NAME, charset="utf8mb4"
    )
    cursor = connection.cursor(pymysql.cursors.DictCursor)

    query = """
        -- Люди-участники
        SELECT
            e.id AS db_id,
            e.id AS id,
            e.full_name AS name,
            e.position AS role,
            e.image AS image_path,
            COUNT(DISTINCT s.id) AS shows_count,
            GROUP_CONCAT(DISTINCT s.title SEPARATOR ', ') AS shows_list,
            'human' AS type
        FROM employees e
        LEFT JOIN shows s ON s.employee = e.id
        GROUP BY e.id, e.full_name, e.position, e.image

        UNION ALL

        -- Дроны-участники (равные члены труппы)
        SELECT
            d.id AS db_id,
            d.id + 10000 AS id,  -- смещаем ID, чтобы не пересекались с людьми
            d.name AS name,
            CONCAT('Drone model ', d.model) AS role,
            d.image AS image_path,
            COUNT(DISTINCT s2.id) AS shows_count,
            GROUP_CONCAT(DISTINCT s2.title SEPARATOR ', ') AS shows_list,
            'drone' AS type
        FROM drones d
        LEFT JOIN shows s2 ON s2.drone = d.id
        GROUP BY d.id, d.name, d.model, d.image

        ORDER BY name;
    """

    cursor.execute(query)
    actors = cursor.fetchall()
    connection.close()

    return render_template("actors.html", actors=actors)


@app.route("/upload_actor_image", methods=["POST"])
def upload_actor_image():
    actor_type = request.form.get("actor_type")   # 'human' или 'drone'
    actor_db_id = request.form.get("actor_db_id")

    if not actor_type or not actor_db_id:
        return redirect(url_for("actors"))

    try:
        actor_db_id = int(actor_db_id)
    except ValueError:
        return redirect(url_for("actors"))

    file = request.files.get("image")
    if not file or file.filename == "":
        return redirect(url_for("actors"))

    if not allowed_file(file.filename):
        # можно добавить флеш-сообщение, но пока просто редирект
        return redirect(url_for("actors"))

    # нормализуем имя файла
    filename = secure_filename(file.filename)
    ext = os.path.splitext(filename)[1].lower()  # .jpg, .png и т.п.

    # новое имя — по типу и id, чтобы не плодить мусор
    new_filename = f"{actor_type}_{actor_db_id}{ext}"
    save_path = os.path.join(app.config["UPLOAD_FOLDER"], new_filename)

    # создаём папку, если вдруг нет
    os.makedirs(app.config["UPLOAD_FOLDER"], exist_ok=True)

    file.save(save_path)

    # путь, который будет использовать сайт
    image_url = f"/static/actors/{new_filename}"

    # обновляем БД
    connection = pymysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS,
        database=DB_NAME, charset="utf8mb4"
    )
    cursor = connection.cursor()

    if actor_type == "human":
        update_query = "UPDATE employees SET image=%s WHERE id=%s"
    else:
        update_query = "UPDATE drones SET image=%s WHERE id=%s"

    cursor.execute(update_query, (image_url, actor_db_id))
    connection.commit()
    connection.close()

    return redirect(url_for("actors"))

# ----------------------------
# Запуск приложения
# ----------------------------
if __name__ == "__main__":
    app.run(debug=True)
