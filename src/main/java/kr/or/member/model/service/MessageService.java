package kr.or.member.model.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {
	String api_key = "NCSMTTQ4FCRBKKN9";
    String api_secret = "ICW2VA8P8JJLZDBWMSASXMRWEDIEJ0JH";
	 
	 public void sendMessage(String receiver, String randomNumber) {
		Message coolsms = new Message(api_key, api_secret);
		
	    HashMap<String, String> params = new HashMap<String, String>();
	    System.out.println("re : "+receiver);
	    params.put("to", receiver);
	    params.put("from", "01027850281");
	    params.put("type", "SMS");
	    params.put("text", "[똑독캣] 인증번호 ["+randomNumber+"]를 입력하세요.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      // System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      // System.out.println(e.getMessage());
	      // System.out.println(e.getCode());
	    }
	 }
}
