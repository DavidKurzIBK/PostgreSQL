package postgres;

import java.util.Scanner;
import java.sql.*;
import java.time.LocalDate;

public class Postgresql {

    private String url;
    private Connection conn;
    private Scanner scanner = new Scanner(System.in);

    public Postgresql(String host, int port, String username, String password, String database) {
        this.url = "jdbc:postgresql://" + host + ":" + port + "/" + database + "?user=" + username + "&password="
                + password;
    }

    public void connect() {
        try {
            this.conn = DriverManager.getConnection(this.url);
        } catch (SQLException e) {
            System.out.println("ERROR: Could not connect to the database.\\n");
        }
    }

    public ResultSet queryDatabase(String query) throws SQLException {
        Statement st = this.conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        return rs;
    }

    public String getInput() {
        return scanner.nextLine();
    }

    public void rentalReport() {

    }

    public void rentalReportFunction() {

    }

    public static void main(String[] args) {

        Postgresql psql = new Postgresql("localhost", 5432, "postgres", "SuperSecret", "pagila");
        psql.connect();

        System.out.println("Welcome to Pagila Reports!\n\n");

        Boolean running = true;
        while (running) {
            System.out.print("(Pagila)> ");

            String userInput = psql.getInput();

            switch (userInput) {
                case "exit":
                    System.out.println("Bye!\n");
                    System.exit(0);
                    break;

                case "rental_report":
                    psql.rentalReport();
                    break;

                case "rental_report_function":
                    psql.rentalReportFunction();
                    break;

                default:
                    break;
            }
        }
    }
}