package com.project.dao;

import java.util.List;

import com.project.model.Seat;

public interface SeatDao {

	public List<Seat> getSeatDetails(Integer showId, Integer screenId) ;

}
