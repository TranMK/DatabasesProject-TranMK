import mysql.connector
 
dataBase = mysql.connector.connect(
  host ="localhost",                # Localhost for local connection
  user ="user",
  passwd ="password"
)

print(dataBase)
dataBase.close()