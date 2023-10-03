package com.project.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.project.dao.MovieDao;
import com.project.db.DBConnect;
import com.project.model.Movie;

public class MovieDaoImpl implements MovieDao{

	public Movie getMovieDetails(int movieId) {

		DBConnect dbcon = new DBConnect();
		Movie movie = new Movie();
		try {

			Connection con = dbcon.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from movies where movieid = " + movieId + ";");

			while (rs.next()) {
				movie.setMovieId(rs.getInt("movieid"));
				movie.setMovieName(rs.getString("moviename"));
				movie.setDescription(rs.getString("description"));
				movie.setDuration(rs.getInt("duration"));
				movie.setLanguage(rs.getString("language"));
				movie.setGenre(rs.getString("genre"));
				movie.setReleaseDate(rs.getDate("releasedate"));
				movie.setRating(rs.getFloat("rating"));
			}
			

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return movie;

	}

}
