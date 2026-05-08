package com.example.projectfxv5;
import java.io.IOException;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Database configuration and connection management class.
 * Provides centralized database connection handling.
 */
public class DatabaseConfig {
    private static final String DEFAULT_DB_URL
            = "jdbc:mysql://localhost:3306/automotive_inventory"
            + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DEFAULT_DB_USERNAME = "root";
    private static final String DEFAULT_DB_PASSWORD = "password";
    private static final String CONFIG_FILE = "config.properties";
    private static String dbUrl;
    private static String dbUsername;
    private static String dbPassword;
    static {
        // Load configuration from properties file if available
        try (InputStream input = DatabaseConfig.class.getClassLoader().getResourceAsStream(CONFIG_FILE)) {
            Properties prop = new Properties();
            if (input != null) {
                prop.load(input);
            }
            dbUrl = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : prop.getProperty("db.url", DEFAULT_DB_URL).trim();
            dbUsername = System.getenv("DB_USERNAME") != null ? System.getenv("DB_USERNAME") : prop.getProperty("db.username", DEFAULT_DB_USERNAME).trim();
            dbPassword = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : prop.getProperty("db.password", DEFAULT_DB_PASSWORD);
        } catch (IOException ex) {
            System.err.println("Could not load configuration file. Using default MySQL settings.");
            dbUrl = DEFAULT_DB_URL;
            dbUsername = DEFAULT_DB_USERNAME;
            dbPassword = DEFAULT_DB_PASSWORD;
        }
    }
    /**
     * Get a connection to the database.
     *
     * @return A Connection object or null if connection fails
     * @throws SQLException if a database access error occurs
     * @throws ClassNotFoundException if the database driver cannot be loaded
     */
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    }
    
    /**
     * Safely close a database connection.
     *
     * @param connection The connection to close
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing database connection: " + e.getMessage());
            }
        }
    }
}