package kr.or.partner.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Partner {
	private String pNo;
	private String category;
	private String pId;
	private String pPw;
	private String pName;
	private String pDob;
	private String pPhone;
	private String pGender;
	private String pEmail;
	private String pAddr;
	private String pGrade;
	private int pPoint;
	private String profileName;
	private String profilePath;
	private String applyMotiv;
	private String applyDate;
	private String approveDate;
	private String license;
	private String workExp;
	private ArrayList<String> licenceArr;
	
	public String getApplyMotivBr() {
		return applyMotiv.replaceAll("\r\n", "<br>");
	}
	public String getLicenseBr() {
		return license.replaceAll("\r\n", "<br>");
	}
	public String getWorkExpBr() {
		return workExp.replaceAll("\r\n", "<br>");
	}
}
