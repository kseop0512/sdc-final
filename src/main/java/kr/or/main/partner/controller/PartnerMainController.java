package kr.or.main.partner.controller;

import common.FileRename;
import jdk.nashorn.internal.parser.JSONParser;
import kr.or.main.partner.model.service.PartnerMainService;
import kr.or.partner.model.service.PartnerService;
import kr.or.partner.model.vo.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

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

    @RequestMapping(value = "/petSitterList.do")
    public String petSitterList() {
        return "main/partner/petSitterList";
    }

    @RequestMapping(value = "/petSitterFrm.do")
    public String petSitterFrm() {
        return "main/partner/petSitterFrm";
    }

    private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query=";
    private static String GEOCODE_USER_INFO="KakaoAK 9438a9cb718e9c47deea17d5deb352a2";


    @RequestMapping(value = "/kakaoTest.do")
    public String kakaoTest() throws Exception{
        URL obj;

        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
            String address = URLEncoder.encode("청라", "UTF-8");

            obj = new URL(GEOCODE_URL+address);

            HttpURLConnection con = (HttpURLConnection)obj.openConnection();

            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization",GEOCODE_USER_INFO);
            con.setRequestProperty("content-type", "application/json");
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);

            Charset charset = Charset.forName("UTF-8");
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));

            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            //response 객체를 출력해보자
            System.out.println(response.toString());

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "main/partner/kakaoTest";
    }

}
