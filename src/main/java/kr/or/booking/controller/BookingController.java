package kr.or.booking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.booking.model.service.BookingService;
import kr.or.booking.model.vo.Booking;



@Controller
public class BookingController {
	@Autowired
	private BookingService service;
	
	@RequestMapping(value="/bookingMemberInfo.do")
	public String bookingMemberInfo(Booking b) {
		int result = service.insertBooking(b);
		if(result>0) {
			return "partner/trainerList";
		}else {
			return "partner/oneTrainer";
		}
	}
}
