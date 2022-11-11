package kr.or.review.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.review.model.service.ReviewService;
import kr.or.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	// 유저 마이페이지 - 이용내역 - 후기작성
	@RequestMapping(value = "/writeReview.do")
	public String writeReview(Review r, Model model) {
		int result = service.insertReview(r);
		if (result>0) {
			model.addAttribute("title", "후기작성 완료");
			model.addAttribute("msg", "입력하신 내용으로 작성을 완료했습니다.");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "후기작성 실패");
			model.addAttribute("msg", "후기작성 중 오류가 발생했습니다.");
			model.addAttribute("icon", "error");
		}
		model.addAttribute("loc", "/mypageService.do");
		return "common/msg";
	}
}
