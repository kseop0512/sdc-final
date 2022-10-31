package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPw;
	private String memberBdate;
	private String memberPhone;
	private String memberAddr;
	private String memberGender;
	private String memberEnrollDate;
}
