import re

import mysql.connector


DATABASE_CONFIG = {
	"host": "localhost",
	"user": "khoitran",
	"password": "khoitranpassword",
	"database": "ecomm",
}


def prompt_customer_id(database):
	while True:
		customer_id = input("Customer ID: ").strip()
		if not customer_id.isdigit() or not 1 <= int(customer_id) <= 2147483647:
			print("Customer ID must be a positive whole number.")
			continue

		with database.cursor() as cursor:
			cursor.execute(
				"SELECT 1 FROM customers WHERE id = %s LIMIT 1",
				(int(customer_id),),
			)
			if cursor.fetchone() is not None:
				print("That customer ID already exists. Please choose another one.")
				continue
		return int(customer_id)


def prompt_customer_name():
	while True:
		name = input("Customer name: ").strip()
		if 1 <= len(name) <= 100 and re.fullmatch(r"[A-Za-z][A-Za-z .'-]*", name):
			return name
		print("Name must be 1-100 characters and contain letters, spaces, or punctuation.")


def prompt_nonempty_value(label, maximum_length):
	while True:
		value = input(f"{label}: ").strip()
		if 1 <= len(value) <= maximum_length:
			return value
		print(f"{label} must be between 1 and {maximum_length} characters.")


def prompt_phone_number():
	while True:
		phone_number = input("Phone number: ").strip()
		if phone_number.isdigit() and 7 <= len(phone_number) <= 15:
			return int(phone_number)
		print("Phone number must contain 7-15 digits.")


def prompt_email():
	while True:
		email = input("Email: ").strip()
		if len(email) <= 255 and re.fullmatch(r"[^@\s]+@[^@\s]+\.[^@\s]+", email):
			return email
		print("Enter a valid email address.")


def add_customer():
	database = mysql.connector.connect(**DATABASE_CONFIG)
	try:
		customer = (
			prompt_customer_id(database),
			prompt_customer_name(),
			prompt_nonempty_value("Shipping address", 255),
			prompt_phone_number(),
			prompt_email(),
		)

		with database.cursor() as cursor:
			cursor.execute(
				"""
				INSERT INTO customers (id, name, shipaddress, phonenum, email)
				VALUES (%s, %s, %s, %s, %s)
				""",
				customer,
			)
		database.commit()
		print(f"Customer '{customer[1]}' was added.")
	except mysql.connector.IntegrityError:
		database.rollback()
		print("That customer ID already exists or the customer could not be added.")
	finally:
		database.close()


if __name__ == "__main__":
	add_customer()
