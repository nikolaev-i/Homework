import mysql.connector
from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello, World!"

@app.route("/message", methods=["GET"])
def get_message():
    id = request.args.get("id")
    if not id:
        return "Error: No id specified"
    try:
        db = mysql.connector.connect(
            host="192.168.7.102",
            user="simple_app",
            password="Tamane12345",
            database="my_simple_app"
        )
        cursor = db.cursor()
        cursor.execute(f"SELECT message FROM my_data WHERE id = {id}")
        result = cursor.fetchone()
        if not result:
            return "Error: Invalid id"
        return result[0]
    except Exception as e:
        return str(e)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
