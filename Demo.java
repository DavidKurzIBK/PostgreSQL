import java.sql.*;

public class Demo {

    public static ResultSet queryExecution(Connection conn, String query) {

        Statement st;
        ResultSet rs = null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException e) {
            System.out.println("Error when executing query.");
        }
        return rs;
    }

    public static void main(String[] args) {

        String url = "jdbc:postgresql://localhost:5432/pagila?user=postgres&password=SuperSecret";
        String query = "select title, rental_rate from film";

        try {
            Connection conn = DriverManager.getConnection(url);
            System.out.println("Welcome to Pagila Reports!\n\n");

            System.out.println("Tile                      | Rental Rate");
            System.out.println("---------------------------------------");
            ResultSet rs = queryExecution(conn, query);

            float sum = 0.0f;
            try {
                while (rs.next()) {
                    float rental_rate = Float.parseFloat(rs.getString(2));
                    String output = String.format("%-25s : %11.2f", rs.getString(1), rental_rate);
                    sum += rental_rate;
                    System.out.println(output);
                }
            } catch (NumberFormatException e) {
                System.out.println("Unexpected values in result set.");
            } catch (SQLException e) {
                System.out.println("Error processing result set");
            }
            System.out.println("---------------------------------------");
            System.out.println(String.format("%-25s : %11.2f", "Total", sum));
        } catch (SQLException e) {
            System.out.println("ERROR: Could not connect to the database.\\n");
        }
    }
}