package kr.or.pet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetAvgStat {
	private int social;
	private int sense;
	private int active;
	private int inde;
}
