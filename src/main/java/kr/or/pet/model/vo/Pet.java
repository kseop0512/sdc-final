package kr.or.pet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pet {
	private int petNo;
	private int petType;   //1. 강아지  2. 고양이
	private String petName;
	private char petGender; //M, F
	private String petKind; //품종
	private String petBdate;
	private float petWeight;
	private char petNeut; //중성화여부 Y, N
	private String petHospital; //다니는 동물병원
	private String petFilename; //펫 프로필사진이름
	private String petFilepath; //펫 프로필사진경로
	private String petNotes; //기타 사항들
}
