package kr.or.main.partner.controller;

import common.FileRename;
import kr.or.main.partner.model.service.PartnerMainService;
import kr.or.partner.model.service.PartnerService;
import kr.or.partner.model.vo.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

@Controller
public class PartnerMainController {

    @Autowired
    private PartnerMainService service;

    @Autowired
    private PartnerService partnerService;

    @Autowired
    private FileRename fileRename;
    @RequestMapping(value = "/joinPartner.do")
    public String joinPartner(Partner p, MultipartFile profile, HttpServletRequest request) {
        //if(!profile.isEmpty()) {
        String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/partner/profileImg/");
        String filename = profile.getOriginalFilename();
        String filepath = fileRename.fileRename(savePath, filename);

        try {
            FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            byte[] bytes = filename.getBytes();
            bos.write(bytes);
            bos.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        p.setProfileName(filename);
        p.setProfilePath(filepath);

        int result = service.insertPartner(p);
        if(result>0) {

        } else {

        }
        return "redirect:/";
    }

    @RequestMapping(value = "joinTrainerPartnerFrm.do")
    public String joinTrainerPartnerFrm() {
        return "main/partner/joinTrainerPartnerFrm";
    }

    @ResponseBody
    @RequestMapping(value = "validationPartnerId.do")
    public int validationPartnerId(Partner p) {
        Partner partner = partnerService.selectOnePartNer(p);

        if(partner != null){
            return 0;
        } else {
            return 1;
        }

    }

}
