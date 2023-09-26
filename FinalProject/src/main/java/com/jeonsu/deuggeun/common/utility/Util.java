package com.jeonsu.deuggeun.common.utility;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class Util {
	
	public static JavaMailSender mailSender;
	
	
	// 개행문자를 "<br>"로 변경하는 메서드
	public static String newLineHandling(String content) {
		
		content = content.replaceAll("\r\n|\n|\r|\n\r", "<br>");
		content = content.replaceAll("&#10;", "<br>");

		return content;
	}
	
	
	@Autowired
	public void Util(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	// Cross Site Scripting(XSS) 방지 처리
	// - 웹 애플리케이션에서 발생하는 취약점
	// - 권한이 없는 사용자가 사이트에 스크립트를 작성하는 것
	public static String XSSHandling(String content) {
      
		// 스크립트나 마크업 언어에서 기호나 기능을 나타내는 문자를 변경 처리
      
		//   &  - &amp;
		//   <  - &lt;
		//   >  - &gt;
		//   "  - &quot;
      
		content = content.replaceAll("&", "&amp;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\"", "&quot;");
      
		return content;
	}
	
	// 파일명 변경 메소드
	public static String fileRename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}
	
	// sms전송 메소드
	@SuppressWarnings("unchecked")
	public static String sendMessage(String tel) {
        // 호스트 URL
        String hostNameUrl = "https://sens.apigw.ntruss.com";
        // 요청 URL
        String requestUrl= "/sms/v2/services/";
        // 프로젝트에 할당된 SMS 서비스 ID
        String serviceId = "ncp:sms:kr:314737765229:send";
        // 요청 URL Type
        String requestUrlType = "/messages";
        // 개인 인증키
        String accessKey = "VanXu3bDxGfHLg8D10l2";
        // 2차 인증을 위해 서비스마다 할당되는 service secret
        String secretKey = "an8dynHAmxbHEaRhRpBGfORyhMD9ET965ncjGZUy";
        
        // 요청 method
        String method = "POST";
        // current timestamp (epoch)
        String timestamp = Long.toString(System.currentTimeMillis());
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;

        // JSON 을 활용한 body data 생성
        // ObjectMapper mapper = new ObjectMapper();
        JSONObject bodyJson = new JSONObject();
        JSONObject toJson = new JSONObject();
        JSONArray  toArr = new JSONArray();
        
        //6자리 난수 인증번호 생성
        String authKey = createAuthKey();
        
        // 인증번호와 함께 전송
        toJson.put("content","[Deuggeun Jeonsu] 본인확인 \n인증번호는 "+authKey+" 입니다. \n\"타인 노출 금지\"");		
        toJson.put("to",tel);
        toArr.add(toJson);
	    
        // 메시지 Type (sms | lms)
        bodyJson.put("type","sms");
        bodyJson.put("contentType","COMM");
        bodyJson.put("countryCode","82");
        
        // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.
        bodyJson.put("from","01037204583");
        bodyJson.put("content","[Deuggeun Jeonsu] 본인확인 \n인증번호는 "+authKey+" 입니다. \n\"타인 노출 금지\"");
        bodyJson.put("messages", toArr);		
	    
        String body = bodyJson.toJSONString();
	    
        System.out.println(body);
	    
        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode"+" "+ responseCode);
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return authKey; // 인증번호
    }
	
	// sms전송 전처리 메소드
    public static String makeSignature(
        String url, 
        String timestamp, 
        String method, 
        String accessKey, 
        String secretKey
    ) throws NoSuchAlgorithmException, InvalidKeyException {
        
	    String space = " "; 
	    String newLine = "\n"; 
	    
	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
	    

	  return encodeBase64String;
	}
    
    // Email전송 메소드
    public static String sendEmail(String email){
        
    	String fromEmail = "dbstnrla1124@gmail.com";
        String fromUsername = "득근전수";
    	
        //6자리 난수 인증번호 생성
        String authKey = createAuthKey();
        
        try {
        	
            //인증메일 보내기
            MimeMessage mail = mailSender.createMimeMessage();
            
            // 제목
            String subject = "득근전수 본인확인 이메일 인증";
            
            // 문자 인코딩
            String charset = "UTF-8";
            
            // 메일 내용
            String mailContent 
                = "<p>[Deuggeun Jeonsu] 본인확인 인증번호입니다 </p>"
                + "<h3 style='color:blue'>" + authKey + "</h3>";
            
            
            // 송신자(보내는 사람) 지정
            mail.setFrom(new InternetAddress(fromEmail, fromUsername));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            // 수신자(받는사람) 지정
            
            // 이메일 제목 세팅
            mail.setSubject(subject, charset);
            
            // 내용 세팅
            mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨
            
            mailSender.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }

        return authKey;
    }
    
    // 6자리 난수 인증번호 생성 메서드
    public static String createAuthKey() {
        String key = "";
        for(int i=0 ; i< 6 ; i++) {
            int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
            
            if(sel1 == 0) {
                int num = (int)(Math.random() * 10); // 0~9
                key += num;
            }
            else {
                char ch = (char)(Math.random() * 26 + 65); // A~Z
                int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
                
                if(sel2 == 0) ch = (char)(ch + ('a' - 'A')); // 소문자로 변경
                key += ch;
            }
        }
        return key;
    }

	
}
