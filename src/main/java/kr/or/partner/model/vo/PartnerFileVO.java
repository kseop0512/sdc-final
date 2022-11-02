package kr.or.partner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PartnerFileVO {
	private String fileNo;
	private String tBoardNo;
	private String imgName;
	private String imgPath;
}
