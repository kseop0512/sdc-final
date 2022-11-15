package kr.or.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewFileVO {
	private String fileNo;
	private String reviewNo;
	private String imgName;
	private String imgPath;
}
