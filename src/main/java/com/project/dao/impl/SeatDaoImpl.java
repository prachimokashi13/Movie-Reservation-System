package com.project.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.dao.SeatDao;
import com.project.db.DBConnect;
import com.project.model.Seat;

public class SeatDaoImpl implements SeatDao{

	public List<Seat> getSeatDetails(Integer showId, Integer screenId) {

		DBConnect dbcon = new DBConnect();
		List<Seat> seatList = new ArrayList<Seat>();
		try {

			Connection con = dbcon.getConnection();

			Statement stmt1 = con.createStatement();
			ResultSet priceResultSet = stmt1
					.executeQuery(" select seatcategorytype,price from seatprice where screenid =" + screenId + ";");

			Statement stmt2 = con.createStatement();
			ResultSet seatResultSet = stmt2
					.executeQuery("select seats.seatid , seats.seatnumber,seats.categorytype,seats.screenid ,"
							+ " seats.rownum,seatsreserved.bookingstatus\r\n"
							+ "from seats left join seatsreserved   on seats.seatid = seatsreserved.seatid and  "
							+ "seatsreserved.showid = " + showId + " where seats.screenid = " + screenId + " ;\r\n"
							+ "");
		
			Map<String, Integer> priceMap = new HashMap<String, Integer>();
			while (priceResultSet.next()) {
				priceMap.put(priceResultSet.getString("seatcategorytype"), priceResultSet.getInt("price"));
			}

			while (seatResultSet.next()) {
				Seat seat = new Seat();
				seat.setSeatId(seatResultSet.getInt("seatid"));
				seat.setSeatNumber(seatResultSet.getString("seatnumber"));
				seat.setCategoryType(seatResultSet.getString("categorytype"));
				seat.setRownum(seatResultSet.getInt("rownum"));
				seat.setPrice(priceMap.get(seatResultSet.getString("categorytype")));
				seat.setStatus(
						seatResultSet.getString("bookingstatus") != null ? seatResultSet.getString("bookingstatus")
								: "Available");
				seatList.add(seat);
			}

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return seatList;

	}

}
