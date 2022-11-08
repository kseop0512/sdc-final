package kr.or.booking.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.booking.model.vo.Booking;

@Repository
public class BookingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBooking(Booking b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("booking.insertBooking",b);
	}

	public String selectBookingTime(Booking b) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("booking.selectBookingTime",b);
	}
}