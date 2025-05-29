package com.hotel.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";  // your DB username
    private static final String PASSWORD = "your_password";  // your DB password

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
