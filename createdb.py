from pathlib import Path

import mysql.connector


def run_database_script():
  database = mysql.connector.connect(
    host="localhost",
    user="khoitran",
    password="khoitranpassword",
    database="ecomm",
  )

  script_path = Path(__file__).with_name("database-insert.sql")
  script = script_path.read_text(encoding="utf-8")

  try:
    with database.cursor() as cursor:
      for statement in script.split(";"):
        statement = statement.strip()
        if statement:
          cursor.execute(statement)
    database.commit()
  finally:
    database.close()


if __name__ == "__main__":
  run_database_script()