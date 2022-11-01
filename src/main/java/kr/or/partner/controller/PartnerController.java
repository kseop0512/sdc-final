package kr.or.partner.controller;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import common.FileRename;

import kr.or.member.model.vo.Member;
import kr.or.partner.model.service.PartnerService;
import kr.or.partner.model.vo.Partner;

@Controller
public class PartnerController {
	@Autowired
	private PartnerService service;
	@Autowired
	private FileRename fileRename;

	public PartnerController() {
		super();
		// TODO Auto-generated constructor stub
	}
	// 파트너 메인페이지 이동
	@RequestMapping(value="/partnerMain.do")
	public String partnerMain() {
		return "partner/myPage";
	}
	// 파트너 비밀번호 변경 - 현재 비밀번호 입력 페이지 이동
	@RequestMapping(value="/chkPwFrm.do")
	public String changePwFrm() {
		return "partner/chkPwFrm";
	}
	// 파트너 현재비밀번호 확인(암호화) - 성공: 새 비밀번호 페이지 이동 / 실패: sweetalert으로 메시지 띄워주기
	@RequestMapping(value="/chkPw.do")
	public String chkPw(Partner p, Model model) {
		Partner partner = service.selectOnePartNer(p); // *PartNer : 암호화
		if(partner == null) {
			// 비밀번호 틀림 -> sweetalert창
			model.addAttribute("title","비밀번호 불일치");
			model.addAttribute("msg","현재 비밀번호와 일치하지 않습니다");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/chkPwFrm.do");
			return "common/msg";
		}else {
			// 현재비밀번호 일치 -> resetPassword 페이지 이동
			return "partner/resetPwFrm";
		}
	}
	// 파트너 비밀번호 변경
	@RequestMapping(value="/changePw.do")
	public String changePw(Partner p, Model model) {
		int result = service.changePwPartNer(p); // *PartNer : 암호화
		if(result>0) {
			model.addAttribute("title","비밀번호 변경 완료");
			model.addAttribute("msg","새 비밀번호로 변경되었습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/partnerMain.do");
			return "common/msg";
		}else {
			model.addAttribute("title","비밀번호 변경 실패");
			model.addAttribute("msg","비밀번호 변경 중 문제가 생겼습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/chkPw.do");
			return "common/msg";
		}
	}

	@RequestMapping(value = "/joinPetSitterPartnerFrm.do")
	public String joinPartnerFrm() {
		return "main/partner/joinPetSitterPartnerFrm";
	}
	// 파트너 프로필 이동
	@RequestMapping(value="/showProfile.do")
	public String showProfile() {
		return "partner/showProfile";
	}
	// 파트너 프로필변경 이동
	@RequestMapping(value="/updateProfileFrm.do")
	public String updateProfileFrm() {
		return "partner/updateProfileFrm";
	}
	
	// 파트너 프로필 변경
	@RequestMapping(value="/updateProfile.do")
	public String updateProfile(Partner p, MultipartFile profileFile, HttpServletRequest request, Model model) {
		if(!profileFile.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/partner/profileImg");
			String profileName = profileFile.getOriginalFilename();
			String profilePath = fileRename.fileRename(savePath, profileName);
			
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + profilePath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = profileFile.getBytes();
				bos.write(bytes);
				bos.close();
			} catch ( FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			p.setProfileName(profileName);
			p.setProfilePath(profilePath);
		}
		int result = service.updateProfile(p);
		if(result>0) {
			model.addAttribute("title","프로필 변경 완료");
			model.addAttribute("msg","프로필 내용이 업데이트 되었습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/partnerMain.do");
			return "common/msg";
		}else {
			model.addAttribute("title","프로필 변경 실패");
			model.addAttribute("msg","프로필 내용이 업데이트 중 문제가 생겼습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/updateProfileFrm.do");
			return "common/msg";
		}
	}

	// 훈련사 리스트 페이지 이동
	@RequestMapping(value="/trainerList.do")
	public String trainerList(Model model) {
		ArrayList<Partner> list = service.selectTrainers() ;
		model.addAttribute("list",list);
		return "main/partner/trainerList";
	}
	
	// 훈련사 게시글 작성 페이지 이동
	@RequestMapping(value="/trainerBoardFrm.do")
	public String trainerBoardFrm() {
		return "partner/trainerBoardFrm";
	}

	//파트너용 로그인 기능
		//로그인 폼 이동
		@RequestMapping(value="/loginPartnerFrm.do")
		public String loginUserFrm(){
			return "main/common/loginPartner";
		}
		
		//파트너 로그인 화면
		@RequestMapping(value="/loginPartner.do")
		public String loginpartner(Partner partner, HttpSession session) {
			Partner p = service.selectOnePartNer(partner);
			if(p!=null) {
				session.setAttribute("p", p);
				System.out.println(session);
			}else {
				System.out.println("값이 없어요");
			}
			return "redirect:/";
		}
		
		//파트너 로그아웃
		@RequestMapping(value="logoutPartner.do")
		public String logoutpartner(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}

}
