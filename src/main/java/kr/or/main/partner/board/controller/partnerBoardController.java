package kr.or.main.partner.board.controller;

import com.google.gson.Gson;
import common.FileRename;
import kr.or.main.partner.board.model.service.PartnerBoardService;
import kr.or.main.partner.board.model.vo.PartnerBoard;
import kr.or.main.partner.board.model.vo.PartnerBoardFileVO;
import kr.or.main.partner.board.model.vo.PartnerBoardOption;
import kr.or.member.model.vo.Member;
import kr.or.pet.model.service.PetService;
import kr.or.pet.model.vo.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class partnerBoardController {
    @Autowired
    private PartnerBoardService service;
    @Autowired
    private PetService pService;
    @Autowired
    private FileRename fileRename;

    @ResponseBody
    @RequestMapping(value = "/petSitterBoardRegist.do")
    public String insertPetsitterBoard(PartnerBoard pb, PartnerBoardOption pbo, MultipartHttpServletRequest multipartReq, HttpServletRequest request) {
        
        ArrayList<PartnerBoardFileVO> list = new ArrayList<PartnerBoardFileVO>();
        List<MultipartFile> partnerFile = multipartReq.getFiles("partnerFile");
        if(!partnerFile.get(0).isEmpty()) {
            String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/partner/petsitterFiles/");
            for(MultipartFile file : partnerFile) {
                String filename = file.getOriginalFilename();
                String filepath = fileRename.fileRename(savePath, filename);

                try {
                    FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    byte[] bytes = file.getBytes();
                    bos.write(bytes);
                    bos.close();

                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                PartnerBoardFileVO partnerBoardFileVo = new PartnerBoardFileVO();
                partnerBoardFileVo.setFilename(filename);
                partnerBoardFileVo.setFilepath(filepath);
                list.add(partnerBoardFileVo);
            }
        }
        int[] resultArr = service.insertPartnerBoard(pb, pbo, list);
        return String.valueOf(resultArr[0]);

    }


    @RequestMapping(value = "/petSitterBoardList.do")
    public String selectPetSitterBoardList(@RequestParam HashMap<String, Object> param, Model model) {
        //String pageNavi = service.getPageNavi(param);

        List<Map<String, Object>> list = service.selectPetSitterBoardList(param);

        model.addAttribute("param", param);
        model.addAttribute("list", list);
//        model.addAttribute("pageNavi", pageNavi);

        return "main/partner/board/petSitterBoardList";
    }
    @ResponseBody
    @RequestMapping(value = "/getSitterBoardList.do", produces="application/json;charset=utf-8")
    public String getSitterBoardList(@RequestParam HashMap<String, Object> param) {

        List<Map<String, Object>> list = service.selectPetSitterBoardList(param);
        return new Gson().toJson(list);
    }
    @RequestMapping(value = "petSitterBoardDetail.do" )
    public String viewBoardDetail(@RequestParam HashMap<String, Object> param, HttpServletRequest request,  Model model) {

        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("m");
        Map<String, Object> detailContent = service.selectPetSitterBoard(param);

        if(member != null) {
            ArrayList<Pet> petList = pService.selectMyPet(member.getMemberNo());
            model.addAttribute("pList", petList);
        }
        model.addAttribute("detail", detailContent);
        model.addAttribute("param", param);
        return "main/partner/board/petSitterBoardDetail";
    }

}
