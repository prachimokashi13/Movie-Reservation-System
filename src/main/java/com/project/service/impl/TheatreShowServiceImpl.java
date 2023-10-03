package com.project.service.impl;

import java.util.List;

import com.project.dao.impl.TheatreShowsDaoImpl;
import com.project.model.Movie;
import com.project.model.Show;
import com.project.model.Theatre;
import com.project.service.TheatreShowService;

public class TheatreShowServiceImpl implements TheatreShowService{

	public List<Theatre> getTheatreShowsByDate(Movie movie, String showDate) {
		TheatreShowsDaoImpl theatreShowsDao = new TheatreShowsDaoImpl();
		List<Theatre> theatres = theatreShowsDao.getTheatreShowsByDate(movie.getMovieId(), showDate);
		if (!theatres.isEmpty()) {
			for (Theatre theatre : theatres) {
				if (!theatre.getShows().isEmpty()) {
					for (Show show : theatre.getShows()) {
						show.setMovieId(movie.getMovieId());
						show.setMovieName(movie.getMovieName());
					}

				}

			}

		}

		return theatres;

	}

}
