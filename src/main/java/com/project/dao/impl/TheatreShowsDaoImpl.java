package com.project.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.project.dao.TheatreShowsDao;
import com.project.db.DBConnect;
import com.project.model.Screen;
import com.project.model.Show;
import com.project.model.Theatre;

public class TheatreShowsDaoImpl implements TheatreShowsDao {

	public List<Theatre> getTheatreShowsByDate(int movieId, String showDate) {

		DBConnect dbcon = new DBConnect();
		Map<Integer, Theatre> theatreMap = new HashMap<>();

		try {

			Connection con = dbcon.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select shows.showid , shows.showdate,shows.starttime,shows.screenid ,\r\n"
					+ "screens.screenname, theatres.theatreid,theatres.theatrename,theatres.address\r\n"
					+ " from(( shows inner join screens\r\n" + " ON shows.showdate='" + showDate
					+ "' and shows.movieid = " + movieId + " and shows.screenid = screens.screenid)\r\n"
					+ "inner join theatres on screens.theatreid = theatres.theatreid);");

			while (rs.next()) {
				if (theatreMap.containsKey(rs.getInt("theatreid"))) {
					Theatre theatre = theatreMap.get(rs.getInt("theatreid"));
					Show show = new Show();
					show.setShowId(rs.getInt("showid"));
					show.setShowTime(rs.getString("starttime"));
					show.setShowDate(rs.getString("showdate"));
					Screen screen = new Screen();
					screen.setScreenId(rs.getInt("screenid"));
					screen.setScreenName(rs.getString("screenname"));
					show.setScreen(screen);
					theatre.getShows().add(show);
				} else {
					Theatre theatre = new Theatre();
					theatre.setTheatreId(rs.getInt("theatreid"));
					theatre.setTheatreName(rs.getString("theatrename"));
					theatre.setAddress(rs.getString("address"));
					List<Show> shows = new ArrayList<Show>();
					Show show = new Show();
					show.setShowId(rs.getInt("showid"));
					show.setShowTime(rs.getString("starttime"));
					show.setShowDate(rs.getString("showdate"));
					Screen screen = new Screen();
					screen.setScreenId(rs.getInt("screenid"));
					screen.setScreenName(rs.getString("screenname"));
					show.setScreen(screen);
					shows.add(show);
					theatre.setShows(shows);
					theatreMap.put(rs.getInt("theatreid"), theatre);
				}
			}

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		List<Theatre> theatreList = new ArrayList<Theatre>();
		for (Entry<Integer, Theatre> entry : theatreMap.entrySet()) {
			theatreList.add(entry.getValue());

		}
		return theatreList;

	}

}
