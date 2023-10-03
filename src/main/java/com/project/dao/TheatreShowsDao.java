package com.project.dao;

import java.util.List;

import com.project.model.Theatre;

public interface TheatreShowsDao {

	public List<Theatre> getTheatreShowsByDate(int movieId, String showDate) ;

}
