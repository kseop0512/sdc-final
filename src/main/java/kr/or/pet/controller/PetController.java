package kr.or.pet.controller;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.or.booking.model.vo.Booking;
import kr.or.partner.model.vo.Partner;
import kr.or.pet.model.service.PetService;
import kr.or.pet.model.vo.PetCheckList;
import kr.or.pet.model.vo.PetForPartner;
import kr.or.pet.model.vo.SendPetToPartner;
import kr.or.pet.model.vo.Pet;
import kr.or.pet.model.vo.PetAvgStat;

@Controller
public class PetController {
	@Autowired
	private PetService service;
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value="/petDogAddFrm.do")
	public String petDogAddFrm() {
		return "pet/petDogAddFrm";
	}

	@RequestMapping(value="/petCatAddFrm.do")
	public String petCatAddFrm() {
		return "pet/petCatAddFrm";
	}
	
	@RequestMapping(value="/mypageMyPet.do")
	public String mypageMyPet(Model model, int memberNo) {
		ArrayList<Pet> petList = service.selectMyPet(memberNo);
		ArrayList<PetCheckList> chkList = service.selectMyPetChk(memberNo);
		ArrayList<PetAvgStat> avgStat = service.getAvgStat();
		model.addAttribute("petList", petList);
		model.addAttribute("petChkList", chkList);
		model.addAttribute("avgStat",avgStat);
		return "pet/mypageMyPet";
	}
	
	@RequestMapping(value="/petAdd.do")
	public String petAdd(Pet p, PetCheckList petChk, MultipartFile[] imageFile, HttpServletRequest request, HttpSession session) {
		if(!imageFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/pet/petProfile/");
			for(MultipartFile file : imageFile) {
				String petFilename = file.getOriginalFilename();
				String petFilepath = fileRename.fileRename(savePath, petFilename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + petFilepath));
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
				p.setPetFilename(petFilename);
				p.setPetFilepath(petFilepath);
			}
		}
		int result = service.insertPet(p, petChk);
		if(result>0) {
			return "redirect:/mypageMyPet.do";
		}else {
			return null;
		}
	}
	
	//유저 마이페이지 - 이용내역 - 펫 이름 가져오기
	@ResponseBody
	@RequestMapping(value="/getPetName.do",produces="application/text;charset=utf-8")
	public String getPetName(int petNo) {
		String petName = service.selectPetName(petNo);
		return petName;
	}
	
	//강아지 수정폼
		@RequestMapping(value="/petEditDogFrm.do")
		public String petEditDogFrm(int petNo) {
			return "pet/petEditDogFrm?petNo="+petNo;
		}
	//강아지 수정
	@RequestMapping(value="/petEditDog.do")
	public String petEditDog(Pet pet) {
		int result = service.petEditDog(pet);
		if(result>0) {
			return "redirect:/mypageMyPet.do";
		}else {
			return null;
		}
	}
	
	//고양이 수정폼
	@RequestMapping(value="/petEditCatFrm.do")
	public String petEditCatFrm(int petNo) {
		return "pet/petEditCatFrm?petNo="+petNo;
	}
	
	//고양이 수정
	@RequestMapping(value="/petEditCat.do")
	public String petEditCat(Pet pet) {
		int result = service.petEditCat(pet);
		if(result>0) {
			return "redirect:/mypageMyPet.do";
		}else {
			return null;
		}
	}
	
	// 혜규 on 11/15 - 펫 정보 불러오기
	@ResponseBody
	@RequestMapping(value="/getPetInfo.do", produces="application/text;charset=utf-8")
	public String getPetInfo(Pet p, String bookingNo) {
		PetForPartner pet = service.selectOnePet(p);
		String request = service.selectSpecialRequest(bookingNo);
		if(request == null) {
			pet.setSpecialRequest("");
		}else {
			pet.setSpecialRequest(request);
		}
		return new Gson().toJson(pet);
	}

}