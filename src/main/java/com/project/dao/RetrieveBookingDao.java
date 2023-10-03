package com.project.dao;

import java.util.List;

import com.project.model.BookedShows;

public interface RetrieveBookingDao {
	public List<BookedShows> retrieveBooking(int userId);
}
