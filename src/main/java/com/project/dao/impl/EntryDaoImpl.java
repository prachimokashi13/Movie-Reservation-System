package com.project.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.project.dao.EntryDao;
import com.project.db.DBConnect;
import com.project.model.User;

public class EntryDaoImpl implements EntryDao {

	public User userLogin(String email) {

		DBConnect dbcon = new DBConnect();
		User loggedUser = new User();
		try {

			Connection con = dbcon.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user where email  = '" + email + "';");
			while (rs.next()) {
				loggedUser.setEmail(rs.getString("email"));
				loggedUser.setUserId(rs.getInt("userid"));
				loggedUser.setName(rs.getString("name"));
				loggedUser.setPassword(rs.getString("password"));
				loggedUser.setPhone(rs.getInt("phone"));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return loggedUser;

	}

	public int userSignUp(User user) {

		DBConnect dbcon = new DBConnect();
		int rs = 1;
		Connection con = dbcon.getConnection();
		int userid = 0;
		try {

			Statement stmt = con.createStatement();
			rs = stmt.executeUpdate("INSERT INTO user ( name, email,password ,phone)\r\n" + "VALUES ('" + user.getName()
					+ "', '" + user.getEmail() + "', '" + user.getPassword() + "', " + user.getPhone() + ")");

			if (rs == 1) {
				Statement stmt1 = con.createStatement();
				ResultSet rs1 = stmt1.executeQuery("select userid from user where email = '" + user.getEmail() + "'");

				while (rs1.next()) {
					userid = rs1.getInt("userid");
				}

			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return userid;

	}

}
