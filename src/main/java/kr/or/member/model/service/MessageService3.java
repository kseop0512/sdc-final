package kr.or.member.model.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService3 {
	String api_key = "NCSEDMWJIPZGQ5KY";
	String api_secret = "BUUIYOGIOHFVKJVYNNNRN9N0FFUOJ0HU";
	 
	public void sendMessage(String bookingPhone) {
		Message coolsms = new Message(api_key, api_secret);
		 
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", bookingPhone);
	    params.put("from", "01087128451");
	    params.put("type", "SMS");
	    params.put("text", "[똑독캣] 예약 취소완료됐다됐다꿍~♡");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	    } catch (CoolsmsException e) {
	    }
	}
}
