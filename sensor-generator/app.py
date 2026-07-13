import os
import time
import psycopg2

DB_HOST = os.getenv("DB_HOST", "timescaledb")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "postgres")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "postgres")

while True:
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
    )
    with conn.cursor() as cur:
        cur.execute(
            "CREATE TABLE IF NOT EXISTS sensor_data (id serial primary key, ts timestamptz default now(), temperature float, humidity float, pressure float)"
        )
        cur.execute(
            "INSERT INTO sensor_data (temperature, humidity, pressure) VALUES (%s, %s, %s)",
            (22.5, 45.1, 1012.3),
        )
        conn.commit()
    conn.close()
    time.sleep(1)
