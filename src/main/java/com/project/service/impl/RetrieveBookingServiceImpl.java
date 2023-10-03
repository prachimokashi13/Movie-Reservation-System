package com.project.service.impl;

import java.util.List;

import com.project.dao.impl.RetrieveBookingDaoImpl;
import com.project.model.BookedShows;

public class RetrieveBookingServiceImpl {

	public List<BookedShows> retrieveBooking(int userId) {
		RetrieveBookingDaoImpl retrieveBookingDaoImpl=new RetrieveBookingDaoImpl();
		return retrieveBookingDaoImpl.retrieveBooking( userId);
	}

}
