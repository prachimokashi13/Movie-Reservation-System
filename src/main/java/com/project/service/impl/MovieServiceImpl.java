package com.project.service.impl;

import com.project.dao.impl.MovieDaoImpl;
import com.project.model.Movie;
import com.project.service.MovieService;

public class MovieServiceImpl implements MovieService {

	public Movie getMovieDetails(int movieId){
		MovieDaoImpl movieDao = new MovieDaoImpl();
		return movieDao.getMovieDetails(movieId);
	}
}
