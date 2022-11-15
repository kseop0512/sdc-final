package kr.or.member.model.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService2 {
	String api_key = "NCSFVKPMCPZOKMGN";
	String api_secret = "GZ4O0EFQMVPYV3IISRXVHLETWGIRTRTY";
	 
	public void sendMessage(String pNum, String randomNumber) {
		Message coolsms = new Message(api_key, api_secret);
		 
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", pNum);
	    params.put("from", "01062379953");
	    params.put("type", "SMS");
	    params.put("text", "[똑독캣] 회원가입 인증번호는 ["+randomNumber+"]입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	    } catch (CoolsmsException e) {
	    }
	}
}
