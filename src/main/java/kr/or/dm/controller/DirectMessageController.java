package kr.or.dm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.dm.model.service.DirectMessageService;
import kr.or.dm.model.vo.DirectMessage;

@Controller
public class DirectMessageController {
	@Autowired
	private DirectMessageService service;
	
	@ResponseBody
	@RequestMapping (value="/myDmList.do", produces="application/json;charset=utf-8")
	public String myDmList(DirectMessage dm) {
		System.out.println(dm);
		ArrayList<DirectMessage> list = service.myDmList(dm);
		return new Gson().toJson(list);
	}
	
}
