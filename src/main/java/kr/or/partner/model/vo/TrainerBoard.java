package kr.or.partner.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainerBoard {
	private String tBoardNo;
	private String pNo;
	private String boardTitle;
	private String trainerName;
	private String topExp;
	private String profField;
	private String visitArea;
	private String aboutMe;
	private String hashTag;
	private String trainerImg;
	private ArrayList<PartnerFileVO> fileList;
	
	public String getAboutMeBr() {
		return aboutMe.replaceAll("\r\n", "<br>");
	}
}
