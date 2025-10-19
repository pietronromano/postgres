
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresTest {
    public static void main(String[] args) {
        // Database credentials
        String url = "jdbc:postgresql://localhost:5432/postgres"; // Update as needed
        String user = "postgres"; // Replace with your username
        String password = "12345"; // Replace with your password

        // Test connection
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            if (connection != null) {
                System.out.println("Connected to the PostgreSQL server successfully!");
            } else {
                System.out.println("Failed to connect to the PostgreSQL server.");
            }
        } catch (SQLException e) {
            System.out.println("An error occurred while connecting to PostgreSQL:");
            e.printStackTrace();
        }
    }
}

