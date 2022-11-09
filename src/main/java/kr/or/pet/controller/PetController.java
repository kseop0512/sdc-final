package kr.or.pet.controller;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.partner.model.vo.Partner;
import kr.or.pet.model.service.PetService;
import kr.or.pet.model.vo.DogCheckList;
import kr.or.pet.model.vo.Pet;

@Controller
public class PetController {
	@Autowired
	private PetService service;
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value="/petAddFrm.do")
	public String petAddFrm() {
		return "pet/petAddFrm";
	}
	
	@RequestMapping(value="/petDogAddFrm.do")
	public String petDogAddFrm() {
		return "pet/petDogAddFrm";
	}

	@RequestMapping(value="/petCatAddFrm.do")
	public String petCatAddFrm() {
		return "pet/petCatAddFrm";
	}
	
	@RequestMapping(value="/mypageMyPet.do")
	public String mypageMyPet() {
		return "pet/mypageMyPet";
	}
	
	@RequestMapping(value="/petDogAdd.do")
	public String petDogAdd(Pet p, DogCheckList dogChk, MultipartFile[] imageFile, HttpServletRequest request, HttpSession session) {
		System.out.println(p);
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
				System.out.println(petFilename);
				System.out.println(petFilepath);
			}
		}
		int result = service.insertPetDog(p, dogChk);
		if(result>0) {
			return "pet/mypageMyPet";
		}else {
			System.out.println("실패");
			return null;
		}
	}
}
