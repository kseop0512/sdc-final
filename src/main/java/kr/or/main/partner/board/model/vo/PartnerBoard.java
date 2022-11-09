package kr.or.main.partner.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PartnerBoard {
    private int petsitterBoardNo;
    private String petsitterBoardTitle;
    private String petsitterAboutMe;
    private String petsitterAddr;
    private String petsitterAddrDetail;
    private String lat;
    private String lng;
    private String startDate;
    private String endDate;
    private String pNo;
}
