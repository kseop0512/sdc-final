package kr.or.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {

    @ResponseBody
    @RequestMapping(value="/sendIdCheckMail.do")
    public String sendIdCheckMail(String email) {
        MailSender sender = new MailSender();
        return sender.sendIdCheckMail(email);
    }

}
