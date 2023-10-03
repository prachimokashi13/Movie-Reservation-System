package com.project.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	Connection conn = null;
	String username = "root";
	String pwd = "root";
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/moviereservation";

	public Connection getConnection() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, username, pwd);

		} catch (ClassNotFoundException | SQLException exc1) {
			exc1.printStackTrace();
		}
		return conn;
	}

}
