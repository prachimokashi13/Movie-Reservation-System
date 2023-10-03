package com.project.service.impl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import com.project.dao.impl.SeatDaoImpl;
import com.project.model.Seat;
import com.project.service.SeatService;

public class SeatServiceImpl implements SeatService{

	public Map<Integer, List<Seat>> getSeatDetails(Integer showId, Integer screenId, HttpServletRequest request) {
		SeatDaoImpl seatDao = new SeatDaoImpl();
		List<Seat> seatList = seatDao.getSeatDetails(showId, screenId);
		request.getSession().setAttribute("seatList", seatList);

		Map<Integer, List<Seat>> seatMap = new HashMap<>();
		for (Seat seat : seatList) {

			if (seatMap.containsKey(seat.getRownum())) {
				seatMap.get(seat.getRownum()).add(seat);
			} else {
				List<Seat> seatRowList = new ArrayList<Seat>();
				seatRowList.add(seat);
				seatMap.put(seat.getRownum(), seatRowList);
			}

		}
		for (Entry<Integer, List<Seat>> map : seatMap.entrySet()) {
			map.getValue().sort(Comparator.comparing(Seat::getSeatId));
		}
		
		return seatMap ;
	}

}
