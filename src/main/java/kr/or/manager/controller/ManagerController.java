package kr.or.manager.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;


import org.springframework.web.multipart.MultipartFile;


import common.FileRename;

import com.google.gson.Gson;

import kr.or.mail.controller.MailSender;

import kr.or.manager.model.service.ManagerService;
import kr.or.manager.model.vo.FileVOG;
import kr.or.manager.model.vo.Manager;
import kr.or.manager.model.vo.NoticeG;
import kr.or.manager.model.vo.NoticeGPageData;
import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	@Autowired
	private FileRename fileRename;
	
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
	
	//관리자 페이지 확인용
	@RequestMapping(value="/adminMemberList.do")
	public String adminMemberList() {
		return "manager/adminMemberList";
	}
		
	//유저리스트 회원 수 
	@RequestMapping(value="/selectUserList.do")
	public String selectUserList(Model model,Member m) {
		int result = service.selectMemberList();
		int result2 = service.selectPartnerList();
		int result3 = service.selectTotalMember();
		model.addAttribute("memberCount", result);
		model.addAttribute("partnerCount", result2);
		model.addAttribute("totalCount",result3);
			
		ArrayList<Member> list = service.selectMemberPartnerList(m);
		model.addAttribute("list",list);
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
	public String noticeGView(int noticeGNo, Model model) {
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
	

	//관리자p 회원관리 검색
	@RequestMapping(value="/searcMember.do")
	public String searchMember(String memberType,String type, String keyword, Model model) {
		int result = service.selectMemberList();
		int result2 = service.selectPartnerList();
		int result3 = service.selectTotalMember();
		model.addAttribute("memberCount", result);
		model.addAttribute("partnerCount", result2);
		model.addAttribute("totalCount",result3);
		
		ArrayList<Member> list = service.searchMember(memberType,type,keyword);
		model.addAttribute("list",list);
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
	public String adminIndex() {
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
	
}











