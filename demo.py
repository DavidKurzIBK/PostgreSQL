import psycopg2

from datetime import date, timedelta

# Connect to an existing database
conn = psycopg2.connect(
    "host=localhost dbname=pagila user=postgres password=#Gonuma35"
)

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a command: Select the sales
cur.execute("select title, rental_rate from film")

# Print table header.
print("Title                       | Rental Rate")
print("-----------------------------------------")

# To Calculate sum of sales
total_amount = 0

# Loop over all records, print them and sum up
for film in cur:
    title = film[0]
    rental_rate = film[1]

    # print(title, "|", rental_rate)
    print(f"{title: <27} | {rental_rate: >11}")

    total_amount += rental_rate

print("\nTotal rental Rate: ", total_amount)
