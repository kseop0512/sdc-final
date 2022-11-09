package kr.or.main.partner.board.controller;

import common.FileRename;
import kr.or.main.partner.board.model.service.PartnerBoardService;
import kr.or.main.partner.board.model.vo.PartnerBoard;
import kr.or.main.partner.board.model.vo.PartnerBoardFileVO;
import kr.or.main.partner.board.model.vo.PartnerBoardOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
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
    private FileRename fileRename;

    @ResponseBody
    @RequestMapping(value = "/petSitterBoardRegist.do")
    public String insertPetsitterBoard(PartnerBoard pb, PartnerBoardOption pbo, MultipartHttpServletRequest multipartReq, HttpServletRequest request) {
        
        ArrayList<PartnerBoardFileVO> list = new ArrayList<PartnerBoardFileVO>();
        List<MultipartFile> partnerFile = multipartReq.getFiles("partnerFile");
        System.out.println(partnerFile.get(0));
        System.out.println(partnerFile.get(0).getOriginalFilename());
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

}
