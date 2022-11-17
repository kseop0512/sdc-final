package kr.or.manager.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;


import com.google.gson.Gson;

import kr.or.mail.controller.MailSender;
import kr.or.booking.model.vo.Booking;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.manager.model.service.ManagerService;
import kr.or.manager.model.vo.FileVOG;
import kr.or.manager.model.vo.Manager;
import kr.or.manager.model.vo.NoticeG;
import kr.or.manager.model.vo.NoticeGPageData;
import kr.or.member.model.service.MessageService3;
import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	@Autowired
	private FileRename fileRename;
	
	@Autowired//수진번호
	private MessageService3 msgService3;
	
	//관리자 로그인 폼 이동
	@RequestMapping(value="/loginManagerFrm.do")
	public String loginManagerFrm() {
		return "manager/loginManager";
	}
	
	//관리자 로그인 화면
	@RequestMapping(value="loginManager.do")
	public String loginManager(Manager manager, HttpSession session) {
		Manager g = service.selectOneManager(manager);
		if(g!=null) {
			session.setAttribute("g", g);
			return "redirect:/";
		}else {
			return "redirect:/loginManagerFrm.do";
		}
		
	}
	
	//관리자 로그아웃
	@RequestMapping(value="logoutManager.do")
	public String logoutManager(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	//유저리스트 회원 수 
	@RequestMapping(value="/selectUserList.do")
	public String selectUserList(Model model,Member m) {
		HashMap<String,Object> map = service.selectMemberPartnerList(m);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("memberCount",map.get("memberCount"));
		model.addAttribute("partnerCount",map.get("partnerCount"));
		model.addAttribute("totalCount",map.get("totalCount"));
		
		return "manager/adminMemberList";
	}
	
	@RequestMapping(value="/selectmember.do")
	public String selectmember(String membertab, Model model) {
		
		HashMap<String,Object> map  = service.selectmember(membertab);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("memberCount",map.get("memberCount"));
		model.addAttribute("partnerCount",map.get("partnerCount"));
		model.addAttribute("totalCount",map.get("totalCount"));
		
		return "manager/adminMemberList";
	}
	
	//관리자P 공지사항 이동
	@RequestMapping(value="/adminNotice.do")
	public String adminNotice(int reqPage, Model model) {
		NoticeGPageData ngpd = service.selectAdminNotice(reqPage);
		model.addAttribute("list",ngpd.getList());
		model.addAttribute("pageNavi",ngpd.getPagenavi());
		model.addAttribute("reqPage",ngpd.getReqPage());
		model.addAttribute("numPerPage", ngpd.getNumPerPage());
		model.addAttribute("totalNotice", ngpd.getTotalCount());
		return "manager/adminNotice";
	}
	
	//메인용 공지사항 이동
	@RequestMapping(value="/homeNoticeList.do")
	public String homeNoticeList(int reqPage, Model model) {
		NoticeGPageData ngpd = service.selectAdminNotice(reqPage);
		model.addAttribute("list",ngpd.getList());
		model.addAttribute("pageNavi",ngpd.getPagenavi());
		model.addAttribute("reqPage",ngpd.getReqPage());
		model.addAttribute("numPerPage", ngpd.getNumPerPage());
		model.addAttribute("totalNotice", ngpd.getTotalCount());
		return "manager/adminNotice";
	}
	
	
	//관리자 공지사항 상세보기
	@RequestMapping(value="/noticeGView.do")
	public String noticeGView2(int noticeGNo, Model model) {
		NoticeG ng = service.selectOneNoticeG(noticeGNo);
		System.out.println(ng);
		model.addAttribute("ng", ng);
		
		int read_g_count = 0;
		service.readGCountUpdate(noticeGNo);
		model.addAttribute("read_g_count",read_g_count);
		
		return "manager/noticeGView";
	}
	
	
	//관리자P 공지사항 글쓰기 Frm
	@RequestMapping(value="/adminNoticeWriteFrm.do")
	public String adminNoticeFrm() {
		return "manager/adminNoticeWrite";
	}
	
	//공지사항 파일 다운로드
	@RequestMapping(value="boardFileDown.do")
	public void boardFileDown(int fileGNo, HttpServletRequest request, HttpServletResponse response) {
		//fileNo : DB에서 filename, filepath를 조회하기위한 값
		FileVOG f = service.fileDown(fileGNo);
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/manager/notice/")+f.getFilepathG();
		//request : 파일이 위치하는 경로를 찾기위해서 필요
		FileInputStream fis;
		try {
			fis = new FileInputStream(path);
			BufferedInputStream bis = new BufferedInputStream(fis);
			//읽어온 파일을 사용자에게 내보내기위한 스트림생생성
			ServletOutputStream sos = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			//파일명처리
			String resFilename = new String(f.getFilenameG().getBytes("UTF-8"),"ISO-8859-1");
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
			//퍼일전송
			while(true) {
				int read = bis.read();
				if(read != -1) {
					bos.write(read);
				}else {
					break;
				}
			}
			bos.close();
			bis.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//response : 사용자에게 파일을 보내주기위해 필요
	}
	
	
	//관리자p 회원관리 검색
	@RequestMapping(value="/searcMember.do")
	public String searchMember(String memberType,String type, String keyword, Model model) {

		HashMap<String,Object> map = service.searchMember(memberType,type,keyword);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("memberCount",map.get("memberCount"));
		model.addAttribute("partnerCount",map.get("partnerCount"));
		model.addAttribute("totalCount",map.get("totalCount"));
		model.addAttribute("keyword",map.get("keyword"));
		return "manager/adminMemberList";
			
	}
	
	
	//유저리스트 회원 엑셀다운로드
	@RequestMapping(value="/excelDown.do")
	@ResponseBody
	public void excelDown(HttpServletResponse response, HttpServletRequest request) throws IOException{
		service.excelDown(response);
		
	}
	
	//1:1문의내역 P 이동
	@RequestMapping(value="/adminDmMessage.do")
	public String adminDmPage() {
		return "manager/adminDmMessage";
	}
	//관리자 index P이동
	@RequestMapping(value="/adminIndex.do")
	public String adminIndex(Model model) {
		ArrayList<Partner> list = service.pointPartner();
		model.addAttribute("list",list);
		return "manager/adminIndex";
	}
	//관리자 공지사항 글쓰기
	@RequestMapping(value="adminNoticeWrite.do")
	public String adminNoticeWrite(NoticeG ng, MultipartFile[] boardFileG, HttpServletRequest request) {
		ArrayList<FileVOG> fileList = new ArrayList<FileVOG>();
		System.out.println(ng);
		System.out.println(boardFileG);
		if(!boardFileG[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/manager/notice/");
			for(MultipartFile file : boardFileG) {
				String filenameG = file.getOriginalFilename();
				String filepathG = fileRename.fileRename(savePath, filenameG);
				
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepathG));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				FileVOG fvg = new FileVOG();
				fvg.setFilenameG(filenameG);
				fvg.setFilepathG(filepathG);
				fileList.add(fvg);
			}
		}
		ng.setFileList(fileList);
		System.out.println(ng.getFileList());
		int result = service.insertNoticeG(ng);
		return "redirect:/adminNotice.do?reqPage=1";
}
	//관리자 - 파트너 P로 이동  파트너승인
	@RequestMapping(value="/partnerList.do")
	public String partnerList(String type, String keyword, Model model) {
		ArrayList<Partner> list = service.partnerList(type,keyword);
		model.addAttribute("list",list);
		return "manager/partnerList";

	}
	
	@RequestMapping(value="/delete.do")
	public String delete(NoticeG noticeGNo, Model model) { 
		
		int result = service.deleteNotice(noticeGNo);
		if(result>0) {
			model.addAttribute("title", "삭제 완료");
			model.addAttribute("msg", "삭제 성공입니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/adminNotice.do?reqPage=1");
		}else {
			model.addAttribute("title", "삭제 실패");
			model.addAttribute("msg", "삭제 실패입니다");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/adminNotice.do?reqPage=1");
		}
		return "common/msg";
	}
	

	// 관리자 - 파트너 회원가입 중  순파트너인 사람 수
	@ResponseBody
	@RequestMapping(value="/partnerCount.do",produces="application/json;charset=utf-8")
	public String partnerCount() {
		int p = service.nPartner();
		return new Gson().toJson(p);
	}
	
	//관리자 - 파트너 등급이동 -> 파트너 승인 된 사람들 등급변경 해주는 곳(C,B,A 등급) 
	@RequestMapping(value="/getPartner.do")
	public String getPartner(String type, String keyword, Model model) {
		ArrayList<Partner> list = service.partnerGradeList(type,keyword);
		model.addAttribute("list",list);
		return "manager/partnerGradeList";
	}
	//관리자 - 파트너 승인
	@RequestMapping(value="/upgradeOk.do")
	public String upgradeOk(String pNo, String gradeType,String email,Model model) {
		int result = service.upgradeOk(pNo,gradeType,email);
		if(result>0) {
			model.addAttribute("title","파트너처리 완료");
			model.addAttribute("msg","처리 되었습니다.");
			model.addAttribute("icon","success");
		}else {
		     model.addAttribute("title","파트너 처리 실패");
	         model.addAttribute("msg","정보수정 중 오류가 발생했습니다.");
	         model.addAttribute("icon","error");
	}
		model.addAttribute("loc","/partnerList.do");
		return "common/msg";	
		
 }
	//파트너조회
	@ResponseBody
	@RequestMapping(value="/onePartner.do",produces="application/json;charset=utf-8")
	public String onePartner(String pNo) {
		Partner p = service.selectOnePartner(pNo);
		return new Gson().toJson(p);
	}

	@ResponseBody
	@RequestMapping(value="/partnerGradeCount.do",produces="application/json;charset=utf-8")
	public String partnerGradeCount(String pNo) {
		int p = service.gradePartner();
		return new Gson().toJson(p);
	}

	
	//메인화면 문의하기
	@RequestMapping(value="/mainQnaWrite.do")
	public String mainQnaWrite(DirectMessage dm, Model model) {
		System.out.println(dm);
		int result = service.mainQnaWrite(dm);
		System.out.println(result);
		
		if(result > 0) {
			model.addAttribute("title", "문의 완료");
			model.addAttribute("msg", "문의 성공입니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/");
			System.out.println("성공");
		}else {
			model.addAttribute("title", "문의 실패");
			model.addAttribute("msg", "문의 실패입니다");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/");
			System.out.println("실패");
		}
		return "common/msg";
	}
	

	@RequestMapping(value="/serviceInfo.do")
	public String serviceInfo() {
		return "main/common/serviceInfo";
	}

	//관리자 - 예약관리(방문)
//		@RequestMapping(value="/bangMoon.do")
//		public String bangMoon(String type, String keyword, Model model) {
//			ArrayList<Booking> list = service.bangMoonList(type,keyword);
//			model.addAttribute("list",list);
//			return "manager/bangMoonList";
//
//		}
//	관리자 - 위탁/훈련예약페이지
	@RequestMapping(value="/trainerBooking.do")
	public String trainerBooking(Model model) {
		ArrayList<Booking> list = service.trainerBooking();
		model.addAttribute("list",list);
		return "manager/trainerBooking";
	}
	
	//관리자 - 위탁/훈련 예약 취소
	@ResponseBody
	@RequestMapping(value="/bookingFail.do",produces="application/json;charset=utf-8")
	public String bookingFail(String bookingNo,String bookingPhone, Model model) {
		int result = service.bookingFail(bookingNo,bookingPhone);
		if(result>0) {
			msgService3.sendMessage(bookingPhone);
			return "1";
		}else {
			return "0";
		}
				
 }
	
	// 예약 상세
	@ResponseBody
	@RequestMapping(value="/bookingDetail.do",produces="application/json;charset=utf-8")
	public String bookingDetail(String bookingNo) {
		Booking b = service.bookingDetail(bookingNo);
		return new Gson().toJson(b);
	}
	//예약 검색
	@RequestMapping(value="/searchBooking.do")
	public String searchBooking(String type, String keyword,Model model) {
		ArrayList<Booking> list = service.searchBooking(type,keyword);
		model.addAttribute("list",list);
		return "manager/trainerBooking";
	}

	@ResponseBody
	@RequestMapping(value="/bookingCount.do",produces="application/json;charset=utf-8")
	public String bookingCount() {
		int b = service.bookingCount();
		return new Gson().toJson(b);
	}
	@ResponseBody
	@RequestMapping(value="/cancelCnt.do",produces="application/json;charset=utf-8")
	public String cancelCnt() {
		int b = service.cancelCnt();
		return new Gson().toJson(b);
		
	}
	@ResponseBody
	@RequestMapping(value="/cancelOkay.do",produces="application/json;charset=utf-8")
	public String cancelOkay() {
		int b = service.cancelOkay();
		return new Gson().toJson(b);
		
	}
	
	
}

