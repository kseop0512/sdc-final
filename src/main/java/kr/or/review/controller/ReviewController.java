package kr.or.review.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.member.model.vo.Member;
import kr.or.review.model.service.ReviewService;
import kr.or.review.model.vo.Review;
import kr.or.review.model.vo.ReviewFileVO;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	@Autowired
	private FileRename fileRename;
	
	// 유저 마이페이지 - 이용내역 - 후기 평점 출력
	@ResponseBody
	@RequestMapping(value = "/getReviewRate.do")
	public int getReviewRate(String bookingNo) {
		int reviewRate = service.getReviewRate(bookingNo);
		return reviewRate;
	}
	
	// 유저 마이페이지 - 이용내역 - 후기작성
	@RequestMapping(value="/writeReview.do")
	public String writeReview(Review r, MultipartFile[] reviewFile, HttpServletRequest request, Model model, Member m) {
		System.out.println(reviewFile);
		System.out.println(reviewFile.length);
		ArrayList<ReviewFileVO> fileList = new ArrayList<ReviewFileVO>();
		if(!reviewFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
			for(MultipartFile file:reviewFile) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[]bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ReviewFileVO rv = new ReviewFileVO();
				rv.setImgName(filename);
				rv.setImgPath(filepath);
				fileList.add(rv);
			}
		}
		r.setFileList(fileList);
		int result = service.writeReview(r);
		if (result>0) {
			model.addAttribute("title", "후기작성 완료");
			model.addAttribute("msg", "입력하신 내용으로 작성을 완료했습니다.");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "후기작성 실패");
			model.addAttribute("msg", "후기작성 중 오류가 발생했습니다.");
			model.addAttribute("icon", "error");
		}
		model.addAttribute("loc", "/mypageService.do?memberId="+m.getMemberId());
		return "common/msg";
	}
	
	//유저 마이페이지 - 이용내역 - 작성한 후기 상세보기
	@ResponseBody
	@RequestMapping(value="/selectOneReview.do")
	public Review selectOneReview(String bookingNo) {
		Review r = service.selectOneReview(bookingNo);
		return r;
	}
	
	//유저 마이페이지 - 이용내역 - 작성한 후기 수정
	@RequestMapping(value = "/updateReview.do")
	public String updateReview(Review r, Model model, Member m) {
		int result = service.updateReview(r);
		if (result>0) {
			model.addAttribute("title", "후기수정 완료");
			model.addAttribute("msg", "입력하신 내용으로 후기를 수정했습니다.");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "후기수정 실패");
			model.addAttribute("msg", "후기수정 중 오류가 발생했습니다.");
			model.addAttribute("icon", "error");
		}
		model.addAttribute("loc", "/mypageService.do?memberId="+m.getMemberId());
		return "common/msg";
	}
}
