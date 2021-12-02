package com.nidas.app.etc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class SMSController {

	// 프로퍼티 로드
	@Value("${api.key}") private String apiKey;
	@Value("${api.secret}") private String apiSecret;
	
	
	@PostMapping("sendSMS.do")
	@ResponseBody
	public String SendSMS(HttpServletRequest req) throws IOException {
		
		HttpSession session = req.getSession();
		String targetNum = req.getParameter("hp");
		Random rand = new Random();
		// string 타입 4자 난수 생성
		String textCode = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			textCode += ran;
		}
		
		Message coolsms = new Message(apiKey, apiSecret);
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", targetNum);
		params.put("from", "01082017731");
		params.put("type", "SMS");
		params.put("text", "<nidas> 인증번호는 " + textCode + " 입니다. ");
		params.put("nidas", "v1.0"); // application name and version

		System.out.println(params.get("text"));

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		session.removeAttribute("textCode");
		session.setAttribute("textCode", textCode);
		// 문자 전송시 세션 시간 확인
		session.removeAttribute("sessionTime");
		session.setAttribute("sessionTime", System.currentTimeMillis());
		return null;
	}

	@RequestMapping("checkSMS.do")
	@ResponseBody
	public Boolean checkSMS(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String clientCode = request.getParameter("hpCode");
		String serverCode = (String) session.getAttribute("textCode");
		if (serverCode != null) {
			// 문자 전송 후 시간과 현재 시간 계산하여 3분의 유효 기간을 계산할 것
			Long sessiontime = (Long) session.getAttribute("sessionTime");
			Long realTime = System.currentTimeMillis();
			Long diffTime = (realTime - sessiontime) / 1000 / 60;
			
			if( diffTime <= 3 ) { // 세션 시간이 살아있고, 인증번호가 일치하면 return true;
				if ( clientCode.equals(serverCode) ) {
					session.removeAttribute("sessionTime");
					session.removeAttribute("textCode");
					session.setAttribute("isHpChecked", true);
					return true;
				}
			} else { // 세션 시간이 만료된 경우
				session.removeAttribute("sessionTime");
				session.removeAttribute("textCode");
			}
		}
		return false;
	}

}
