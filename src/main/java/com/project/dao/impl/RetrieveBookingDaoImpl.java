package com.project.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.project.dao.RetrieveBookingDao;
import com.project.db.DBConnect;
import com.project.model.BookedShows;
import com.project.model.Show;

public class RetrieveBookingDaoImpl implements RetrieveBookingDao {

	public List<BookedShows> retrieveBooking(int userId) {

		DBConnect dbcon = new DBConnect();
		List<BookedShows> bookedShowslist = new ArrayList<>();

		try {

			Connection con = dbcon.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select booking.bookingid , booking.showid,booking.bookingprice,shows.showdate,shows.starttime,shows.screenid,\r\n"
							+ "shows.movieid,screens.screenname,theatres.theatrename,movies.moviename\r\n"
							+ "from ((((booking join shows on booking.showid=shows.showid)join screens on shows.screenid = screens.screenid)\r\n"
							+ "join theatres on screens.theatreid = theatres.theatreid) join movies"
							+ " on shows.movieid = movies.movieid )where booking.userid = "+userId+";");

			while (rs.next()) {
				BookedShows bookedShows = new BookedShows();
				bookedShows.setBookingId(rs.getString("bookingid"));
				bookedShows.setPrice(rs.getInt("bookingprice"));
				bookedShows.setScreenName(rs.getString("screenname"));
				bookedShows.setMovieName(rs.getString("moviename"));
				Show show = new Show();
				show.setShowTime(rs.getString("starttime"));
				show.setShowDate(rs.getString("showdate"));
				bookedShows.setShow(show);
				bookedShows.setShowId(rs.getInt("showid"));
				bookedShows.setTheatreName(rs.getString("theatrename"));
				bookedShows.setUserid(userId);
				bookedShowslist.add(bookedShows);
			}

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return bookedShowslist;

	}

}
