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
	private String dmType; 
}
