package kr.or.pet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pet {
	private int petNo;
	private int memberNo; //주인
	private int petType;   //1. 강아지  2. 고양이
	private String petName;
	private String petGender; //M, F
	private String petBdate;
	private String petKind; //품종
	private float petWeight;
	private String petNeut; //중성화여부 Y, N
	private String petHospital; //다니는 동물병원
	private String petNote; //기타 사항들
	private String petFilename; //펫 프로필사진이름
	private String petFilepath; //펫 프로필사진경로
}
