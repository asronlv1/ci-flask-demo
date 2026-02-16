from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify(status="ok", message="hello from flask")

if __name__ == "__main__":
    # For local dev only (CI/Docker will run via gunicorn)
    app.run(host="0.0.0.0", port=5000)

