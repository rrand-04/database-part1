package com.example.vanillacoffeesystem;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/vanilla_db",
                    "root",
                    "Rand@2004"
            );

            System.out.println("Connected Successfully");

            return con;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}