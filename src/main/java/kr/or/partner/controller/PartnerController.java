package kr.or.partner.controller;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;

import kr.or.member.model.vo.Member;

import kr.or.member.model.service.MessageService;
import kr.or.partner.model.service.MessagePService;

import kr.or.partner.model.service.PartnerService;
import kr.or.partner.model.vo.Partner;
import kr.or.partner.model.vo.PartnerFileVO;
import kr.or.partner.model.vo.TrainerBoard;
import kr.or.pet.model.vo.Pet;

@Controller
public class PartnerController {
	@Autowired
	private PartnerService service;
	@Autowired
	private FileRename fileRename;
	@Autowired
	private MessagePService msgPService;

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
	public String updateProfile(Partner p, MultipartFile[] profileFile, HttpServletRequest request, Model model, HttpSession session) {
		if(!profileFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/partner/profileImg/");
			for(MultipartFile file : profileFile) {
				String profileName =file.getOriginalFilename();
				String profilePath = fileRename.fileRename(savePath, profileName);
				
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + profilePath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
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
		}
		int result = service.updateProfile(p);
		if(result>0) {
			// trainer_board의 trainer_img컬럼도 변경
			service.updateTrainerImg(p);
			// 프로필 변경 시 기존 사진 삭제
			Partner partner = (Partner)session.getAttribute("p");
			if(!profileFile[0].isEmpty()) {
				String rout = request.getSession().getServletContext().getRealPath("/");
				String deleteFile = rout+"resources/upload/partner/profileImg/"+partner.getProfilePath();
				File delFile = new File(deleteFile);
				delFile.delete();
				partner.setProfileName(p.getProfileName());
				partner.setProfilePath(p.getProfilePath());
			}
			// 변경된 정보 세션에 넣어주기
			partner.setPAddr(p.getPAddr());
			partner.setPPhone(p.getPPhone());
			partner.setPEmail(p.getPEmail());
			partner.setLicense(p.getLicense());
			partner.setWorkExp(p.getWorkExpBr());
			partner.setProfilePath(p.getProfilePath());
			partner.setProfileName(p.getProfileName());
			session.setAttribute("p", partner);
			model.addAttribute("title","프로필 변경 완료");
			model.addAttribute("msg","프로필 내용이 업데이트 되었습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","showProfile.do");
			return "common/msg";
		}else {
			model.addAttribute("title","프로필 변경 실패");
			model.addAttribute("msg","프로필 내용이 업데이트 중 문제가 생겼습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","updateProfileFrm.do");
			return "common/msg";
		}
	}

	// 훈련사 리스트 페이지 이동
	@RequestMapping(value="/trainerList.do")
	public String trainerList(Model model) {
		ArrayList<TrainerBoard> boardList = service.selectAllBoard();
		model.addAttribute("boardList",boardList);
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
			return "redirect:/";
		}else {
			return "redirect:/loginPartnerFrm.do";
		}
		
	}
	
	//파트너 로그아웃
	@RequestMapping(value="/logoutPartner.do")
	public String logoutpartner(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 훈련사 게시글 upload
	@RequestMapping(value="/uploadTrainerBoard.do")
	public String uploadTrainerBoard(TrainerBoard tb, MultipartFile[] boardFile, HttpServletRequest request, Model model) {
		ArrayList<PartnerFileVO> list = new ArrayList<PartnerFileVO>();
		if(!boardFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/partner/trainerFiles/");
			for(MultipartFile file : boardFile) {
				String filename = file.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				PartnerFileVO fileVO = new PartnerFileVO();
				fileVO.setImgName(filename);
				fileVO.setImgPath(filepath);
				list.add(fileVO);
			}
		}
		tb.setFileList(list);
		int result = service.uploadTrainerBoard(tb);
		if(result>0) {
			model.addAttribute("title","게시글 등록 완료");
			model.addAttribute("msg","훈련사 찾기 글이 등록되었습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/trainerList.do");
			return "common/msg";
		}else {
			model.addAttribute("title","게시글 등록 실패");
			model.addAttribute("msg","등록 중 문제가 발생했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/trainerBoardFrm.do");
			return "common/msg";
		}
	}
	// 훈련사 상세 페이지 이동
	@RequestMapping(value="/oneTrainer.do")
	public String oneTrainer(String tBoardNo, Model model) {
		TrainerBoard tb = service.selectOneTrainerBoard(tBoardNo);
		String pNo = tb.getPNo();
		Partner p = service.selectOnePartner(pNo);
		model.addAttribute("tb",tb);
		model.addAttribute("p",p);
		return "partner/oneTrainer";
	}
	// 훈련사 예약페이지 이동
	@RequestMapping(value="/bookTrainerFrm.do")
	public String bookingFrm(String pNo, Member m, Model model) {
		Partner trainer = service.selectOnePartner(pNo);
		ArrayList<Pet> pets = service.selectAllPets(m);
		model.addAttribute("trainer",trainer);
		model.addAttribute("petList",pets);
		System.out.println(trainer);
		return "partner/trainerBookingPage";
	}
	
	/* 아이디 비밀번호 찾기*/
	@RequestMapping(value="/findIdPartnerFrm.do")
	public String searchInfo() {
		return "partner/findIdPartnerFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/findIdPartner.do",produces="application/json;charset=utf-8")
	public String findIdPartner(Partner partner) {
		Partner p = service.findIdPartner(partner);
		String text = "";
		if(p != null) {
			text = p.getPId() + "/" + p.getPGrade();
		}else {
			text = "아이디가 존재하지 않습니다";
		}
		return new Gson().toJson(text);
	}
	
	@RequestMapping(value="/findPwPartnerFrm.do")
	public String findPwPartnerFrm() {
		return "partner/findPwPartnerFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/findPwPartner.do", produces="application/json;charset=utf-8")
	public String findPwPartner(Partner partner, HttpSession session) {
		Partner p =service.selectOnePartnerEnc(partner);
		String text = "";
		if(p != null ) {
			session.setAttribute("updatePwP", p);
			text = "find";
		}else {
			text = "일치하는 회원정보가 없습니다.";
		}
		return new Gson().toJson(text);
	}
	
	@ResponseBody
	@RequestMapping(value="/sendMsgP.do")
	public String sendMsg(String pPhone) {
		// 6자리 랜덤숫자 생성
		Random r = new Random();
		int rdNum = 0;
		String rdCode = "";
		String resultCode = "";
				
		for(int i=0; i<6; i++) {
			rdNum = r.nextInt(9);
			rdCode = Integer.toString(rdNum);
			resultCode += rdCode;
		}
		
		msgPService.sendMessage(pPhone, resultCode);
		return resultCode;
	}
	
	@RequestMapping(value="/updatePwPFrm.do")
	public String updatePwPFrm() {
		return "partner/updatePwPFrm";
	}
	
	@RequestMapping(value="updatePwP.do")
	public String updatePwP(String updatePwP, HttpSession session, Model model) {
		Partner p = (Partner)session.getAttribute("p");
		if(p == null) {
			p = (Partner)session.getAttribute("updatePwP");
			p.setPPw(updatePwP);
			int result = service.updatePwEncPartNer(p);
			if(result>0) {
				return "partner/updatePwPSuccess";
			}else {
				return "redirect:/";
			}
		}else {
			p.setPPw(updatePwP);
			int result = service.updatePwEncPartNer(p);
			if(result>0) {
				model.addAttribute("title", "변경 완료");
				model.addAttribute("msg", "비밀번호가 변경되었습니다.");
				model.addAttribute("icon", "success");
				model.addAttribute("loc", "/myPage.do");
				return "common/msg";	
			}else {
				return "redirect:/updatePwPFrm.do";
			}
		}
	}
	
	//유저 마이페이지 - 이용내역 - 파트너번호로 파트너이름 조회하기
	@ResponseBody
	@RequestMapping(value="/getPartnerName.do",produces="application/text;charset=utf-8")
	public String getPetName(String pNo) {
		String pName = service.selectPartnerName(pNo);
		return pName;
	}
}
