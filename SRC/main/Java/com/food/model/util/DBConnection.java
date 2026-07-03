package com.food.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection 
{
	 private static String url =
	            "jdbc:mysql://localhost:3306/fooddelivery";

	    private static String username =
	            "root";

	    private static String password =
	            "Root";

	    public static Connection getConnection() {

	        Connection con = null;

	        try {

	            Class.forName(
	                "com.mysql.cj.jdbc.Driver");

	            con =
	                DriverManager.getConnection(
	                url,
	                username,
	                password);

	        }
	        catch(Exception e) {
	            e.printStackTrace();
	        }

	        return con;
	    }
}
