package kr.or.pet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetCheckList {
	private int petNo;
	private String character1;
	private String character2;
	private String character3;
	private String character4;
	private String character5;
	private String character6;
	private String character7;
	private String character8;
	private String health1;
	private String health2;
	private String health3;
	private int social;
	private int sense;
	private int active;
	private int inde;
}
