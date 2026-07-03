package com.food.util;

public class testConnection 
{
	public static void main(String[] args) 
	{
		if(DBConnection.getConnection() != null) {
			System.out.println("Connection successful!");
		} else {
			System.out.println("Connection failed.");
		}
	}

}
