package kr.or.booking.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.booking.model.vo.Booking;
import kr.or.partner.model.vo.Partner;

@Repository
public class BookingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertTrainerBooking(Booking b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("booking.insertTrainerBooking",b);
	}

	public ArrayList<String> selectBookingTime(Booking b) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("booking.selectBookingTime",b);
		return (ArrayList<String>)list;
	}

	// 혜규 on 11/13
	public ArrayList<Booking> selectOngoingBooking(Partner p) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("booking.selectOngoingBooking",p);
		return (ArrayList<Booking>)list;
	}

	public ArrayList<Booking> partnerCalendar(Partner p) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("booking.selectTrainerSchedule",p);
		return (ArrayList<Booking>)list;
	}
	// END 혜규 on 11/13

	public ArrayList<Booking> petSitterCalendar(Partner p) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("booking.selectSitterSchedule",p);
		return (ArrayList<Booking>)list;
	}


	public int insertPetSitterBooking(Booking b) {
		int result =  sqlSession.insert("booking.insertPetSitterBooking", b);
		/*String[] resultArr = new String[2];
		resultArr[0] = String.valueOf(result);
		resultArr[1] = b.getBookingNo();*/
		return result;
	}

	public int deleteFailPaymentBooking(String bookingNo) {
		return sqlSession.delete("booking.deleteBooking", bookingNo);
	}

	public int updatePartnerStatus(String bookingNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("booking.updatePartnerStatus",bookingNo);
	}

	public int updatePartnerPoint(String pNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("partner.updatePartnerPoint",pNo);

	}

	public ArrayList<String> getBookingAccept(String memberId) {
		List list = sqlSession.selectList("booking.getBookAccept",memberId);
		return (ArrayList<String>)list;
	}

	public int cancelService(String bookingNo) {
		return sqlSession.update("booking.cancelService", bookingNo);
	}

	public int cancelReserve(HashMap<String, String> map) {
		return sqlSession.update("booking.cancelReserve", map);
	}

	public void denyBooking(String bookingNo) {
		// TODO Auto-generated method stub
		sqlSession.update("booking.denyBookingRequest",bookingNo);
	}

	public ArrayList<Booking> selectOngoingBookingPetSitter(Partner p) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("booking.selectOngoingBookingPetSitter",p);
		return (ArrayList<Booking>)list;
	}
}