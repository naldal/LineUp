package message.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.bean.MemberDTO;
import message.sendMessage.Coolsms;

@Controller
public class MessageController {

	@RequestMapping(value = "/sendMessage/sendSms") //message/sendSms로 url보내기
	  public String sendSms(HttpServletRequest request, 
			  				@RequestParam String reserved_tel,
			  				@RequestParam String adminTel,
			  				@RequestParam String messagebody,
			  				HttpSession session) throws Exception {

		String phoneNumWithoutHypen = reserved_tel.replace("-",  "");
		
	    String api_key = "NCS9GCW4OUK3543L";
	    String api_secret = "FRSZCUJB5O9CNDQHFGGMM3LPICD7JIBY";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", phoneNumWithoutHypen); // 수신번호

	    set.put("from", adminTel); // 발신번호
	    set.put("text", messagebody); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }

	    return "redirect:/home/index";
	  }
	
}
