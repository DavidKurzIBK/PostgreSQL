import psycopg2
from datetime import date, timedelta


# Connect to an existing database in a try and except block!!
# connection is successful, it returns the connection object.
# unable to connect, prints an error message, prints the specific error details (psycopg2.Error), 
# exits the program with code of 1.
def connect_to_db():
    try:
        conn = psycopg2.connect(
            "host=localhost dbname=pagila user=postgres password=#Gonuma35"
        )
        return conn
    except psycopg2.Error as e:
        print("Unable to connect to the database.")
        print(e)
        exit(1)



# rental_report function
def rental_report(conn):
    try:
        # User input for date range
        from_date_str = input("From: ")
        to_date_str = input("To: ")
        
        # convert input string format to a date object
        from_date = date.fromisoformat(from_date_str)
        to_date = date.fromisoformat(to_date_str)

        # SQL query to get rental report with f-string
        # calculates count of rentals each day of  week and total count for each movie category.
        query = f"""
            SELECT      category.name AS category_name,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 1) AS mon,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 2) AS tue,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 3) AS wed,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 4) AS thu,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 5) AS fri,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 6) AS sat,
                        COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM rental.rental_date) = 7) AS sun,
                        COUNT(*) AS total
            FROM        rental
            INNER JOIN  inventory
            ON          rental.inventory_id = inventory.inventory_id
            INNER JOIN  film_category
            ON          inventory.film_id = film_category.film_id
            INNER JOIN  category
            ON          film_category.category_id = category.category_id
            WHERE       rental.rental_date::date between %s and %s
            GROUP BY    category.name
            ORDER BY    category.name;
        """

        # Open a cursor to perform database operations 
        # executes the query using a cursor and fetches all the results
        with conn.cursor() as cur:
            cur.execute(query, (from_date, to_date))
            result = cur.fetchall()

            # Print table header
            print("|category_name| mon | tue | wed | thu | fri | sat | sun | total |")
            print("|-------------|-----|-----|-----|-----|-----|-----|-----|-------|")

            # Print query result
            for row in result:
                print("|", end="")
                for value in row:
                    print(f" {value} |", end="")
                print()
    
    # wie oben print einer vordefinierten psycopg2 Error message 
    except psycopg2.Error as e:
        print("Error executing rental_report query.")
        print(e)
        #exit(1)

# rental_report_function
def rental_report_function(conn):
    try:
        # User input for date range
        from_date_str = input("From: ")
        to_date_str = input("To: ")
        
        # conversation von user input string zu date object
        from_date = date.fromisoformat(from_date_str)
        to_date = date.fromisoformat(to_date_str)

        # SQL query to call the function 
        query = f"""SELECT * FROM report_function(%s, %s);"""

        # Open a cursor to perform database operations
        with conn.cursor() as cur:
            cur.execute(query, (from_date, to_date))
            result = cur.fetchall()

            # Print query result
            for row in result:
                print(row)

    except psycopg2.Error as e:
        print("Error executing rental_report_function query.")
        print(e)



def main():
    running = True
    conn = connect_to_db()
    print("Welcome to Pagila Reports!\n\n")

    while running:
        print("(Pagila)> ", end="")
        user_input = input()

        if user_input == "exit":
            print("Bye!\n")
            running = False
        elif user_input == "rental_report":
            rental_report(conn)
        elif user_input == "rental_report_function":
            rental_report_function(conn)
        else:
            pass

    conn.close()
    exit(0)


if __name__ == "__main__":
    main()
