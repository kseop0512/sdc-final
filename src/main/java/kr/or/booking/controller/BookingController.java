package kr.or.booking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import kr.or.payment.toss.PaymentController;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.booking.model.service.BookingService;
import kr.or.booking.model.vo.Booking;
import kr.or.partner.model.vo.Partner;

import javax.servlet.http.HttpSession;


@Controller
public class BookingController {
	@Autowired
	private BookingService service;
	
	@RequestMapping(value="/bookingMemberInfo.do")
	public String bookingMemberInfo(Booking b, Model model) {
		int result = service.insertTrainerBooking(b);
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
		System.out.println(b.getStartDate());
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
			return new Gson().toJson(timeList);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/disabled-dates.do", produces="application/json;charset=utf-8")
	public String disabledDatesBookingTime() {
		ArrayList<String> dates = new ArrayList<String>();
		// ex) 11월 10일, 11월 20일 선택 못하게
		dates.add("2022-11-21");
		dates.add("2022-11-20");
		return new Gson().toJson(dates);
	}
	// 혜규 on 11/13
	// 파트너 예약 요청 리스트
	@RequestMapping(value="/appliedList.do")
	public String appliedList(Partner p, Model model) {
		ArrayList<Booking> lists = service.selectOngoingBooking(p);
		ArrayList<Booking> sitters = service.selectOngoingBookingPetSitter(p);
		model.addAttribute("lists",lists);
		model.addAttribute("sitter",sitters);
		return "partner/appliedList";
	}
	@RequestMapping(value="/scheduleCalendar.do")
	public String scheduleCalender() {
		return "partner/scheduleCalendar";
	}
	// 훈련사 예약 리스트
	@ResponseBody
	@RequestMapping(value="/getScheduleList.do", produces="application/json;charset=utf-8")
	public String getScheduleList(Partner p) {
		ArrayList<Booking> lists = service.partnerCalendar(p);
		return new Gson().toJson(lists);
	}
	// 위탁 펫시터 예약 리스트
	@ResponseBody
	@RequestMapping(value="/getSitterScheduleList.do", produces="application/json;charset=utf-8")
	public String getSitterScheduleList(Partner p) {
		ArrayList<Booking> lists = service.petSitterCalendar(p);
		return new Gson().toJson(lists);
	}


	/**
	 * 위탁 펫시터 예약
	 * @param b
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reservePetSitter.do")
	public String reservePetSitter(Booking b, HttpSession session) {

		//String[] resultArr = service.insertPetSitterBooking(b);
		if(b != null) {
			session.setAttribute("booking", b);
			return "1";
		}
		/*if(resultArr[1] != null) {
			session.setAttribute("bookingNo", resultArr[1]);
		}*/
		return "0";
	}

	// 예약 상태 업데이트 with 파트너 포인트 up
	   @RequestMapping(value="/acceptBooking.do")
	   public String acceptBooking(String bookingNo, String pNo, String bookingPhone) {
	      int result = service.updatePartnerStatus(bookingNo);
	      if(result>0) {
	         // 파트너 포인트 올리기
	         result += service.updatePartnerPoint(pNo);
	           String api_key = "NCSMTTQ4FCRBKKN9";
	           String api_secret = "ICW2VA8P8JJLZDBWMSASXMRWEDIEJ0JH";
	           Message coolsms = new Message(api_key, api_secret);
	           
	           String BookingMsg = "파트너님이 예약 요청을 수락 하셨습니다. 똑독캣 마이페이지에서 확인해주세요!.";
	           
	           HashMap<String, String> set = new HashMap<String, String>();
	           set.put("to", bookingPhone); // 수신번호

	           set.put("from", "01027850281"); // 발신번호
	           set.put("text", BookingMsg); // 문자내용
	           set.put("type", "sms"); // 문자 타입
	           set.put("app_version", "test app 1.2"); 

	           try {
	           JSONObject result2 = coolsms.send(set); // 보내기&전송결과받기

	           System.out.println(result2.toString());
	          } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	          }
	      }
	      return "redirect:/appliedList.do?pNo="+pNo;
	   }
	
	//회원탈퇴 전 예약내역 조회
	@ResponseBody
	@RequestMapping(value="/getBookingAccept.do", produces="application/json;charset=utf-8")
	public String getBookingAccept(String memberId) {
		ArrayList<String> bCatList = service.getBookingAccept(memberId);
		return new Gson().toJson(bCatList);
	}
	
	//예약대기 취소
	@ResponseBody
	@RequestMapping(value="/cancelService.do")
	public int cancelService(String bookingNo) {
		return service.cancelService(bookingNo);
	}
	
	//예약완료 취소
	@ResponseBody
	@RequestMapping(value="/cancelReserve.do")
	public int cancelService(String bookingNo, String comment) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bookingNo", bookingNo);
		map.put("comment", comment);
		System.out.println(bookingNo);
		System.out.println(comment);
		System.out.println(map);
		return service.cancelReserve(map);
	}
	
	// 파트너의 예약 신청 거부 (혜규)
	   @RequestMapping(value="/denyBooking.do")
	   public String denyBooking(String pNo, String bookingNo, String bookingPhone) {
	      service.denyBooking(bookingNo);
	      String api_key = "NCSMTTQ4FCRBKKN9";
	        String api_secret = "ICW2VA8P8JJLZDBWMSASXMRWEDIEJ0JH";
	        Message coolsms = new Message(api_key, api_secret);
	        String BookingMsg = "파트너님이 예약 요청을 거절하셨습니다. 똑독캣 마이페이지에서 확인해주세요.";
	        HashMap<String, String> set = new HashMap<String, String>();
	        set.put("to", bookingPhone); // 수신번호

	        set.put("from", "01027850281"); // 발신번호
	        set.put("text", BookingMsg); // 문자내용
	        set.put("type", "sms"); // 문자 타입
	        set.put("app_version", "test app 1.2"); 

	        try {
	        JSONObject result2 = coolsms.send(set); // 보내기&전송결과받기
	        System.out.println(result2.toString());
	        
	        } catch (CoolsmsException e) {
	         System.out.println(e.getMessage());
	         System.out.println(e.getCode());
	        }
	      
	      return "redirect:/appliedList.do?pNo="+pNo; 
	   }
	
}
