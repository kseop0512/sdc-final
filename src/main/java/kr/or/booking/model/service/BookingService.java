package kr.or.booking.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.booking.model.dao.BookingDao;
import kr.or.booking.model.vo.Booking;
import kr.or.partner.model.vo.Partner;

@Service
public class BookingService {
	@Autowired
	private BookingDao dao;

	public int insertTrainerBooking(Booking b) {
		// TODO Auto-generated method stub
		return dao.insertTrainerBooking(b);
	}

	public ArrayList<String> selectBookingTime(Booking b) {
		// TODO Auto-generated method stub
		return dao.selectBookingTime(b);
	}

	// 혜규 on 11/13
	public ArrayList<Booking> selectOngoingBooking(Partner p) {
		// TODO Auto-generated method stub
		return dao.selectOngoingBooking(p);
	}

	public ArrayList<Booking> partnerCalendar(Partner p) {
		// TODO Auto-generated method stub
		return dao.partnerCalendar(p);
	}

	public ArrayList<Booking> petSitterCalendar(Partner p) {
		// TODO Auto-generated method stub
		return dao.petSitterCalendar(p);
	}

	public int updatePartnerStatus(String bookingNo) {
		// TODO Auto-generated method stub
		return dao.updatePartnerStatus(bookingNo);
	}

	public int updatePartnerPoint(String pNo) {
		// TODO Auto-generated method stub
		return dao.updatePartnerPoint(pNo);
	}
	
	// END 혜규 on 11/13
}
