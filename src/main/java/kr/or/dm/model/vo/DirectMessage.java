package kr.or.dm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DirectMessage {
	private int dmNo;
	private String sender;
	private String senderCategory; //a: from 관리자,p : 파트너 ,m : 이용자
	private String receiver;
	private String dmContent;
	private String dmDate;
	private int readCheck;  // 읽지 않음 : 0, 읽음 : 1
	private int dmType; // 문의사항 -> 0 : 결제/취소, 1: 예약/취소  , 2: 기타문의   
	private int apply; // 관리자 - 몇번글에 대한 답변인지
}
