// gcc demo.c -lpq -I/usr/include/postgresql/ -o demo

#include <stdlib.h>
#include <libpq-fe.h>

int main(void)
{
    // Open a connection to the database.
    const char *connection_parameters[] = {"host", "dbname", "user", "password", 0};
    const char *connection_values[] = {"localhost", "pagila", "postgres", "SuperSecret", 0};

    PGconn *connection = PQconnectdbParams(connection_parameters, connection_values, 0);

    if (PQstatus(connection) != CONNECTION_OK)
    {
        printf("ERROR: Could not connect to the database.\n");

        PQfinish(connection);
        return EXIT_FAILURE;
    }

    printf("Connected to the database.\n\n");

    // Execute query.
    PGresult *result = PQexec(connection, "select title, rental_rate from film");

    if (PQresultStatus(result) != PGRES_TUPLES_OK)
    {
        printf("ERROR: Error executing the query.\n");

        PQclear(result);
        PQfinish(connection);
        return EXIT_FAILURE;
    }

    // Retrieve meta information about the result set.
    int n_rows = PQntuples(result);
    int n_columns = PQnfields(result);

    if (n_columns != 2)
    {
        printf("ERROR: Incorrect number of columns in result.\n");

        PQclear(result);
        PQfinish(connection);
        return EXIT_FAILURE;
    }

    // Print table header.
    printf("Title                       | Rental Rate\n");
    printf("-----------------------------------------\n");

    // Print result table and calculate total sum.
    double sum = .0;

    for (int i = 0; i < n_rows; i++)
    {
        char *title = PQgetvalue(result, i, 0);
        char *rental_rate = PQgetvalue(result, i, 1);

        printf("%-27s | %+11s\n", title, rental_rate);

        sum += atof(rental_rate);
    }

    printf("\nTotal rental rate: %.2f", sum);

    // Done.
    PQclear(result);
    PQfinish(connection);
    return EXIT_SUCCESS;
}
