package kr.or.booking.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
	private String bookingNo;
	private String memberId;
	private String pNo;
	private int petNo;
	private String bookingDate;
	private String bookingPhone;
	private String startDate;
	private String endDate;
	private String bookingTime;
	private String specialRequest;
	private String reviewState;
	private String partnerAccept; // R Y C N D 
	private String category; // V: 방문 / L: 위탁 / T: 훈련
	private int price; // 서비스요금
	private String cancleComment; // 취소 신청 시 취소 사유
	
	public String getSpecialRequestBr() {
		return specialRequest.replaceAll("\r\n", "<br>");
	}
}
