// compile using the following command, possibly that the path to libpq needs to be adapted
// gcc exercise1.c -lpq -I/usr/include/postgresql/ -o exercise1

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include <libpq-fe.h>

PGconn *open_connection()
{
}

char *read_input()
{
    // Read input line from stdin.
    char *input = NULL;
    size_t len = 0;
    size_t n_read = getline(&input, &len, stdin);

    if (n_read == -1)
    {
        printf("ERROR: Could not read user input.\n");
        exit(EXIT_FAILURE);
    }

    // Remove newline at the end.
    input[n_read - 1] = '\0';

    // Done.
    return input;
}

void run_rental_report(PGconn *connection)
{
}

void run_rental_report_function(PGconn *connection)
{
}

int main(void)
{
    // Open a connection to the database.
    PGconn *connection = open_connection();

    if (!connection)
    {
        printf("ERROR: Could not connect to the database.\n");

        PQfinish(connection);
        return EXIT_FAILURE;
    }

    // Provide the user with a command prompt and handle commands.
    printf("Welcome to Pagila Reports!\n\n");

    bool running = true;
    while (running)
    {
        // Print prompt.
        printf("(Pagila)> ");

        // Read user input.
        char *input = read_input();

        // Dispatch user commands.
        if (strcmp(input, "exit") == 0)
        {
            printf("Bye!\n");
            running = false;
        }
        else if (strcmp(input, "rental_report") == 0)
        {
            run_rental_report(connection);
        }
        else if (strcmp(input, "rental_report_function") == 0)
        {
            run_rental_report(connection);
        }

        // Free the input string.
        free(input);
    }

    // Done.
    PQfinish(connection);
    return EXIT_SUCCESS;
}
