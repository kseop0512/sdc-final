package kr.or.pet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetForPartner {
	String petName;
	String petGender;
	String petNeut;
	String petBdate;
	String petKind;
	String petHospital;
	String petNote;
	String petFilepath;
	String character2;
	String health1;
	String health2;
	String specialRequest;
}
