from flask import flask

app = Flask(__name__)

@app.route("/")
def print_roll_no():
  return 2303
