package kr.or.main.partner.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class PartnerBoardOption {
    private int petsitterBoardNo;
    private char noPet;
    private char pickup;
    private char largePet;
    private char yard;
    private char oldPet;

    public PartnerBoardOption() {
        super();
    }

    public PartnerBoardOption(int petsitterBoardNo, char noPet, char pickup, char largePet, char yard, char oldPet) {
        this.petsitterBoardNo = petsitterBoardNo;
        this.noPet = noPet;
        this.pickup = pickup;
        this.largePet = largePet;
        this.yard = yard;
        this.oldPet = oldPet;
    }

    public int getPetsitterBoardNo() {
        return petsitterBoardNo;
    }

    public void setPetsitterBoardNo(int petsitterBoardNo) {
        this.petsitterBoardNo = petsitterBoardNo;
    }

    public char getNoPet() {
        if(noPet == 0) {
            return 'N';
        }
        return noPet;
    }

    public void setNoPet(char noPet) {
        this.noPet = noPet;
    }

    public char getPickup() {
        if(pickup == 0) {
            return 'N';
        }
        return pickup;
    }

    public void setPickup(char pickup) {
        this.pickup = pickup;
    }

    public char getLargePet() {
        if(largePet == 0) {
            return 'N';
        }
        return largePet;
    }

    public void setLargePet(char largePet) {
        this.largePet = largePet;
    }

    public char getYard() {
        if(yard == 0 ) {
            return 'N';
        }
        return yard;
    }

    public void setYard(char yard) {
        this.yard = yard;
    }

    public char getOldPet() {
        if(oldPet == 0) {
            return 'N';
        }
        return oldPet;
    }

    public void setOldPet(char oldPet) {
        this.oldPet = oldPet;
    }
}
