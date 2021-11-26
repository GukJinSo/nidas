package com.nidas.app.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class SMSController {
	
	@PostMapping("sendSMS.do")
	@ResponseBody
	public String SendSMS(HttpServletRequest req) throws IOException {
		/*
		HttpSession session = req.getSession();
		String targetNum = req.getParameter("hp");
		Random rand = new Random();
		// string 타입 4자 난수 생성
		String textCode = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			textCode += ran;
		}
		
		String api_key = "NCS1ZIUBA33Z7UZB";
		String api_secret = "TV6YEYJSUQYTQY7XGE5LVAMU6TT6WOUC";
		Message coolsms = new Message(api_key, api_secret);
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

		session.setAttribute("textCode", textCode);
		// 문자 전송시 세션 시간 확인
		session.setAttribute("sessiontime", System.currentTimeMillis());
		*/
		return null;
	}

	@RequestMapping("checkSMS.do")
	@ResponseBody
	public Boolean checkSMS(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String insertCode = request.getParameter("hpCode");
		// 인증번호 입력값
		String Code = (String) session.getAttribute("textCode");
		// 인증번호 세션값
		Long sessiontime = (Long) session.getAttribute("sessiontime");
		Long realtime = System.currentTimeMillis();
		// 문자 전송 후 시간과 현재 시간 계산하여 3분의 유효 기간
		Long difftime = (realtime - sessiontime) / 1000 / 60;

		boolean YorN = false;
		if (difftime > 3) {
			// 세션에서 인증번호 삭제
			session.removeAttribute("textCode");
		} else {
			if(insertCode.equals(Code)) {
				YorN = true;
			}
		}
		return YorN;
	}

}
