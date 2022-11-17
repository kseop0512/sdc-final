package kr.or.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.member.model.dao.KakaoDao;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Kakao;
import kr.or.member.model.vo.KakaoResult;
import kr.or.member.model.vo.KakaoToken;

@Service
public class KakaoService {
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private KakaoDao kakaodao;
	
	@Autowired
	private KakaoToken KakaoToken;
	
	@Autowired
	private KakaoResult KakaoResult;
	
	
	
	
	
	public KakaoToken requestToken(String code){

        String strUrl = "https://kauth.kakao.com/oauth/token"; //request를 보낼 주소
        KakaoToken kakaoToken = new KakaoToken(); //response를 받을 객체

        try{
            URL url = new URL(strUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //url Http 연결 생성

            //POST 요청
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);//outputStreamm으로 post 데이터를 넘김

            //파라미터 세팅
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            //0번 파라미터 grant_type 입니다 authorization_code로 고정이라니 고정등록해줍니다
            sb.append("grant_type=authorization_code");

            //1번 파라미터 client_id입니다. ***자신의 앱 REST API KEY로 변경해주세요***
            sb.append("&client_id=69285f0370d2e1d257039e34be83fc90");

            //2번 파라미터 redirect_uri입니다. ***자신의 redirect uri로 변경해주세요***
            sb.append("&redirect_uri=http://192.168.10.20/kakaoLogin1.do");

            //3번 파라미터 code입니다. 인자로 받아온 인증코드입니다.
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();//실제 요청을 보내는 부분

            //실제 요청을 보내는 부분, 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            System.out.println("response body : " + result);


            //Jackson으로 json 파싱할 것임
            ObjectMapper mapper = new ObjectMapper();
            //kakaoToken에 result를 KakaoToken.class 형식으로 변환하여 저장
            kakaoToken = mapper.readValue(result, KakaoToken.class);

            //api호출용 access token
            String access_Token = kakaoToken.getAccess_token();
            //access 토큰 만료되면 refresh token사용(유효기간 더 김)
            String refresh_Token=kakaoToken.getRefresh_token();


            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        }catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("카카오토큰생성완료>>>" + kakaoToken);
        return kakaoToken;
	}
	
	/*
	//인증코드로 token요청하기
	public KakaoResult requestUser(String accessToken){
		System.out.println("requestUser 시작");
	    String strUrl = "https://kapi.kakao.com/v2/user/me"; //request를 보낼 주소
	    KakaoResult user = new KakaoResult(); //response를 받을 객체

	    try{
	        URL url = new URL(strUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //url Http 연결 생성

	        //POST 요청
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);//outputStreamm으로 post 데이터를 넘김

	        //전송할 header 작성, 인자로 받은 access_token전송
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);


	        //실제 요청을 보내는 부분, 결과 코드가 200이라면 성공
	        int responseCode = conn.getResponseCode();
	        System.out.println("requestUser의 responsecode(200이면성공): " + responseCode);

	        //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";

	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        br.close();

	        System.out.println("response body : " + result);


	        //Jackson으로 json 파싱할 것임
	        ObjectMapper mapper = new ObjectMapper();
	        //결과 json을 HashMap 형태로 변환하여 resultMap에 담음
	        HashMap<String,Object> resultMap = mapper.readValue(result, HashMap.class);
	        //json 파싱하여 id 가져오기
	        Long id = Long.valueOf(String.valueOf(resultMap.get("id")));

	        //결과json 안에 properties key는 json Object를 value로 가짐
	        HashMap<String,Object> properties = (HashMap<String, Object>) resultMap.get("properties");
	        String nickname = (String)properties.get("nickname");

	        //결과json 안에 kakao_account key는 json Object를 value로 가짐
	        HashMap<String,Object> kakao_account = (HashMap<String, Object>) resultMap.get("kakao_account");
	        String email=null;//이메일은 동의해야 알 수 있음
	        if(kakao_account.containsKey("email")){//동의하면 email이 kakao_account에 key로 존재함
	            email=(String)kakao_account.get("email");
	        }
	        
	        //유저정보 세팅
	        user.setEmail(email);
	        user.setId(id);
	        user.setNickname(nickname);
	        
	        System.out.println("resultMap= " + resultMap);
	        System.out.println("properties= " + properties);
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    return user;
	}
	*/
	
	
public Kakao getuserinfo(String access_Token) {
        
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        
        String requestURL = "https://kapi.kakao.com/v2/user/me";
        
        try {
            URL url = new URL(requestURL); //1.url 객체만들기
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //2.url 에서 url connection 만들기
            conn.setRequestMethod("GET"); // 3.URL 연결구성
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            //키값, 속성 적용
            int responseCode = conn.getResponseCode(); //서버에서 보낸 http 상태코드 반환
            System.out.println("responseCode :" + responseCode+ "여긴가");
            BufferedReader buffer = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            // 버퍼를 사용하여 일근ㄴ것
            String line = "";
            String result = "";
            while ((line = buffer.readLine()) != null) {
                result +=line;
            }
            //readLine()) ==> 입력 String 값으로 리턴값 고정 
            
            System.out.println("response body :" +result);
            
            // 읽엇으니깐 데이터꺼내오기
          JsonParser parser = new JsonParser();
          JsonElement element = parser.parse(result); //Json element 문자열변경
          JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
          JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
          
          
          String nickname = properties.getAsJsonObject().get("nickname").getAsString();
          String email = kakao_account.getAsJsonObject().get("email").getAsString();
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
                    
            
        } catch (Exception e) {
           e.printStackTrace();
        }
        
        Kakao result = kakaodao.findkakao(userInfo); 
        // 저장되어있는지 확인
        System.out.println("S :" + result);
        
        if(result ==null) {
            //result null 이면 정보가 저장 안되어있는거라서 저보를 저장.
            kakaodao.kakaoinsert(userInfo);
            //저장하기위해 repository 로 이동
            return kakaodao.findkakao(userInfo);
            // 정보 저장후 컨트롤러에 정보를 보냄
            //result 를 리턴으로 보내면 null 이 리턴되므로 위코드를 사용.
        }else {
            return result;
            //정보가 있으므로 result 를 리턴함
        }
        
    }
    
 
	
	
	
	
}
