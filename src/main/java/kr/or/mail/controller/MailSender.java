package kr.or.mail.controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class MailSender {

    public String sendIdCheckMail(String email) {

        boolean result = false;

        //인증용 랜덤코드 생성
        Random r = new Random();
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<8; i++) {
            //숫자, 영어소문자, 영어대문자 섞어서 8개 조합
            //0 : 0~9, 1 : A-Z, 2 : a-z
            int flag = r.nextInt(3);
            if(flag == 0) {
                //0~9
                int randomNum = r.nextInt(10);
                sb.append(randomNum);
            } else if( flag == 1 ) {
                //A-Z
                char randomChar = (char)(r.nextInt(26)+65);
                sb.append(randomChar);
            } else if( flag == 2 ) {
                //a-z
                char randomChar = (char)(r.nextInt(26)+97);
                sb.append(randomChar);
            }
        }
        System.out.println(sb);
        //이메일 통신설정
        //Properties prop = System.getProperties();
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        //prop.put("mail.smtp.user", "sdcmaster1");

        //인증정보설정(로그인)
        /*Session session = Session.getDefaultInstance(prop, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    PasswordAuthentication pa
                        = new PasswordAuthentication("sdcmaster1","zgzocugfmymqzofs");
                        //= new PasswordAuthentication("sdcmaster1" , "cafwtupovjiiubnn");
                    return pa;
                }
            }
        );*/
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("sdcmaster1", "zgzocugfmymqzofs");
            }
        });
        //이메일을 작성해서 전송하는 객체
        MimeMessage msg = new MimeMessage(session);

        //이메일 작성
        try {
            //메일 전송 날짜 설정
            msg.setSentDate(new Date());
            //보내는사람 정보
            msg.setFrom(new InternetAddress
                    ("testkimtest11@gmail.com", "SDC 관리자"));
            //받는사람정보
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
            //이메일 제목설정
            msg.setSubject("SDC 파트너 지원 인증메일입니다.","UTF-8");
            //이메일 본문설정
            msg.setContent("<h1>안녕하세요. SDC 관리자 입니다.</h1>"
                            + "<h3>인증번호는 [<span style='color:red'>"
                            + sb.toString() + "</span>] 입니다.</h3>"
                    ,"text/html;charset=utf-8");
            //이메일 전송
            Transport.send(msg);
            result = true;
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        /*if(result) {
            return sb.toString();
        } else {
            return null;
        }*/
        return sb.toString();
    }
    
    
//관지라 -> 파트너 승인, 거절시 메일발송 
	public void partnerEamil(String email) {
		
		  boolean result = false;
		  StringBuilder sb = new StringBuilder();
		  sb.append("승인");
		  
		    //이메일 통신설정
	        //Properties prop = System.getProperties();
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", 587); //변경
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", true); //추가
	        prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); //추가
//	        prop.put("mail.smtp.ssl.enable", "true"); 주석
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	        //prop.put("mail.smtp.user", "sdcmaster1");

	        //인증정보설정(로그인)
	        /*Session session = Session.getDefaultInstance(prop, new Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    PasswordAuthentication pa
	                        = new PasswordAuthentication("sdcmaster1","zgzocugfmymqzofs");
	                        //= new PasswordAuthentication("sdcmaster1" , "cafwtupovjiiubnn");
	                    return pa;
	                }
	            }
	        );*/
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("sdcmaster1", "epxgwfsfezzvgzcp");
	            }
	        });
	        //이메일을 작성해서 전송하는 객체
	        MimeMessage msg = new MimeMessage(session);

	        //이메일 작성
	        try {
	            //메일 전송 날짜 설정
	            msg.setSentDate(new Date());
	            //보내는사람 정보
	            msg.setFrom(new InternetAddress
	                    ("testkimtest11@gmail.com", "SDC 관리자"));
	            //받는사람정보
	            InternetAddress to = new InternetAddress(email);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            //이메일 제목설정
	            msg.setSubject("SDC 파트너 승인 결과메일입니다.","UTF-8");
	            //이메일 본문설정
	            msg.setContent("<h1>안녕하세요. SDC 관리자 입니다.</h1>"
	                            + "<h3>파트너 [<span style='color:red'>"
	                            + sb.toString() + "</span>] 되었습니다.</h3>"
	                    ,"text/html;charset=utf-8");
	            //이메일 전송
	            Transport.send(msg);
	            	System.out.println("이수진");
	            result = true;
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        /*if(result) {
	            return sb.toString();
	        } else {
	            return null;
	        }*/
	    
	}

//거절
	public void partnerCancel(String email) {
		  boolean result = false;
		  StringBuilder sb = new StringBuilder();
		  sb.append("거절");
		  
		    //이메일 통신설정
	        //Properties prop = System.getProperties();
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", 587); //변경
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", true); //추가
	        prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); //추가
//	        prop.put("mail.smtp.ssl.enable", "true"); 주석
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	        //prop.put("mail.smtp.user", "sdcmaster1");

	        //인증정보설정(로그인)
	        /*Session session = Session.getDefaultInstance(prop, new Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    PasswordAuthentication pa
	                        = new PasswordAuthentication("sdcmaster1","zgzocugfmymqzofs");
	                        //= new PasswordAuthentication("sdcmaster1" , "cafwtupovjiiubnn");
	                    return pa;
	                }
	            }
	        );*/
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("sdcmaster1", "epxgwfsfezzvgzcp");
	            }
	        });
	        //이메일을 작성해서 전송하는 객체
	        MimeMessage msg = new MimeMessage(session);

	        //이메일 작성
	        try {
	            //메일 전송 날짜 설정
	            msg.setSentDate(new Date());
	            //보내는사람 정보
	            msg.setFrom(new InternetAddress
	                    ("testkimtest11@gmail.com", "SDC 관리자"));
	            //받는사람정보
	            InternetAddress to = new InternetAddress(email);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            //이메일 제목설정
	            msg.setSubject("SDC 파트너 승인 결과메일입니다.","UTF-8");
	            //이메일 본문설정
	            msg.setContent("<h1>안녕하세요. SDC 관리자 입니다.</h1>"
	                            + "<h3>파트너 [<span style='color:red'>"
	                            + sb.toString() + "</span>] 되었습니다. 다시 지원해주세요.</h3>"
	                    ,"text/html;charset=utf-8");
	            //이메일 전송
	            Transport.send(msg);
	            	System.out.println("이수진");
	            result = true;
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        /*if(result) {
	            return sb.toString();
	        } else {
	            return null;
	        }*/
		
	}
	
}
