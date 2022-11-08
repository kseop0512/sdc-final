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
	private String partnerAccept;
	
	public String getSpecialRequestBr() {
		return specialRequest.replaceAll("\r\n", "<br>");
	}
}
