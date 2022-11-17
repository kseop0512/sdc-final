package kr.or.member.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.booking.model.vo.Booking;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.main.partner.board.model.vo.PartnerBoardOption;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;
import kr.or.review.model.vo.Review;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public int selectOneMemberId(String memberId) {
		return dao.selectOneMemberId(memberId);
	}
	
	//유저 회원가입
	@Transactional
	public int insertMember(Member m) {
		return dao.insertMember(m);
	}
	
	//유저용 로그인 화면
	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}
	
	//유저 마이페이지 정보수정
	@Transactional
	public Member updateMember(Member m) {
		int result = dao.updateMember(m);
		if(result>0) {
			Member updateM = dao.selectOneMember(m);
			return updateM;
		}else {
			return null;
		}
	}

	@Transactional
	public ArrayList<Booking> selectBookingList(Member m) {
		ArrayList<Booking> dList = dao.selectDoneBookingList(m);
		int result = 0;
		for(int i=0; i<dList.size(); i++) {
			String bookingNo = dList.get(i).getBookingNo();
			result = dao.updateBookingState(bookingNo);
			if(result>0) {
				System.out.println(bookingNo+" update완료");
			}
		}
		return dao.selectBookingList(m);
	}


	public Member findIdUser(Member member) {
		return dao.findIdUser(member);
	}


	public Member selectOneMemberEnc(Member member) {
		return dao.selectOneMember(member);
	}


	public int updatePwEncMember(Member m) {
		return dao.updatePwMember(m);
	}

	@Transactional
	public int deleteMember(String memberId) {
		return dao.deleteMember(memberId);
	}

	public Booking selectOneBooking(String bookingNo) {
		return dao.selectOneBooking(bookingNo);
	}

	public ArrayList<Review> selectReviewList(Member m) {
		return dao.selectReviewList(m);
	}

	public Partner selectOnePartnerInfo(String pNo) {
		return dao.selectOnePartnerInfo(pNo);
	}

	public int selectOnePartnerBoardNo(String pNo) {
		return dao.selectOnePartnerBoardNo(pNo);
	}

	public PartnerBoardOption selectPetsitterOption(int petsitterBoardNo) {
		return dao.selectPetsitterOption(petsitterBoardNo);
	}
	
	
}
