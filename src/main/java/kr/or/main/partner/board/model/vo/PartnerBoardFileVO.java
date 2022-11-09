package kr.or.main.partner.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PartnerBoardFileVO {
    private int fileNo;
    private int petsitterBoardNo;
    private String filename;
    private String filepath;
}