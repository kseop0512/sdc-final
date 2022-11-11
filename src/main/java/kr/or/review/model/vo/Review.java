package kr.or.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private String reviewNo;
	private String bookingNo;
	private int memberNo;
	private String pNo;
	private int petNo;
	private int reviewRate;
	private String reviewContent;
	private String reviewDate;
	private String reviewFilename;
	private String reviewFilepath;
}
