package kr.or.booking.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.booking.model.dao.BookingDao;
import kr.or.booking.model.vo.Booking;

@Service
public class BookingService {
	@Autowired
	private BookingDao dao;

	public int insertBooking(Booking b) {
		// TODO Auto-generated method stub
		return dao.insertBooking(b);
	}

	public ArrayList<String> selectBookingTime(Booking b) {
		// TODO Auto-generated method stub
		return dao.selectBookingTime(b);
	}

	
}
