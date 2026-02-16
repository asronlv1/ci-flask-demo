FROM python:3.12-slim

WORKDIR /app

# Install deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY . .

EXPOSE 5000

# Production-ish server
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]

