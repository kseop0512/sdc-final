package kr.or.booking.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.booking.model.service.BookingService;
import kr.or.booking.model.vo.Booking;



@Controller
public class BookingController {
	@Autowired
	private BookingService service;
	
	@RequestMapping(value="/bookingMemberInfo.do")
	public String bookingMemberInfo(Booking b, Model model) {
		int result = service.insertBooking(b);
		if(result>0) {
			model.addAttribute("title","예약 요청 성공");
			model.addAttribute("msg","훈련사님께 예약 요청이 성공적으로 이루어졌습니다. 훈련사님으로부터 회신을 기다립니다");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/trainerList.do");
			return "common/msg";
		}else {
			model.addAttribute("title","예약 요청 실패");
			model.addAttribute("msg","예약 요청 중 문제가 발생했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/trainerList.do");
			return "common/msg";
		}
	}
	@ResponseBody
	@RequestMapping(value="/selectBookingTime.do", produces="application/json;charset=utf-8")
	public String selectBookingTime(Booking b) {
		ArrayList<String> times = service.selectBookingTime(b);
		// System.out.println(times);
		if(times.isEmpty()) {
			return "0";
		}else {
			ArrayList<String> timeList = new ArrayList<String>();
			for(int i=0; i<times.size();i++) {
				StringTokenizer sT = new StringTokenizer(times.get(i),",");
				while(sT.hasMoreTokens()) {
					timeList.add(sT.nextToken());
				}
			}
			
			System.out.println(timeList);
			return new Gson().toJson(timeList);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/disabled-dates.do", produces="application/json;charset=utf-8")
	public String disabledDatesBookingTime() {
		ArrayList<String> dates = new ArrayList<String>();
		// ex) 11월 10일, 11월 20일 선택 못하게
		dates.add("2022-11-10");
		dates.add("2022-11-20");
		return new Gson().toJson(dates);
	}
	
}
