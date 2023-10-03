package com.project.dao.impl;

import java.sql.Connection;
import java.sql.Statement;

import com.project.dao.BookingDao;
import com.project.db.DBConnect;
import com.project.model.BookShow;
import com.project.model.Seat;

public class BookingDaoImpl implements BookingDao{

	public int bookShow(BookShow bookShow) {

		DBConnect dbcon = new DBConnect();
		int rs1 = 1;
		int rs2 = 1;
		try {

			Connection con = dbcon.getConnection();

			Statement stmt1 = con.createStatement();
			String sq = "insert into booking values('" + bookShow.getBookingId() + "',"
					+ bookShow.getUserid() + "," + bookShow.getShowId() + "," + bookShow.getPrice() + ");";
			rs1 = stmt1.executeUpdate("insert into booking values('" + bookShow.getBookingId() + "',"
					+ bookShow.getUserid() + "," + bookShow.getShowId() + "," + bookShow.getPrice() + ");");

			for (Seat seat : bookShow.getSeats()) {
				Statement stmt = con.createStatement();
				String sql = "insert into seatsreserved (seatnumber , showid , bookingid,"
						+ "bookingstatus, seatid) values('" + seat.getSeatNumber() + "','" + bookShow.getShowId()
						+ "','" + bookShow.getBookingId() + "','" + "Reserved" + "'," + seat.getSeatId() + ");";
				rs2 = rs2 & stmt.executeUpdate(sql);
			}

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return rs1 & rs2;

	}

}
