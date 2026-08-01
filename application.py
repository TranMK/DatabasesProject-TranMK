import mysql.connector
import sqlite3
dataBase = mysql.connector.connect(
  host ="localhost",                # Localhost for local connection
  user ="khoitran",
  passwd ="khoitranpassword"
)
# preparing a cursor object
cursorObject = dataBase.cursor()

# creating database
cursorObject.execute("CREATE DATABASE gfg")
print(dataBase)
dataBase.close()