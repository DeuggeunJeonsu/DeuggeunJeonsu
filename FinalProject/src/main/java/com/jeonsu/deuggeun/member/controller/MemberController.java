package com.jeonsu.deuggeun.member.controller;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonsu.deuggeun.common.utility.Util;

@Controller 
@RequestMapping("/member")
public class MemberController {
	
	// 로그인 전용 화면 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 아이디, 비미번호 찾기 화면 이동
	@GetMapping("/findInfo")
	public String findInfo() {
		return "member/findInfo";
	}
	
	// 아이디 찾기 (sms 인증) ajax
	@ResponseBody
	@PostMapping(value="/findId", produces = "application/json; charset=UTF-8")
	public String findId(@RequestBody Map<String, Object> paramMap) {
		//System.out.println(String.valueOf(paramMap.get("memberPhone")));
		return "sms 문자전송 기능 제한중"; //Util.sendMessage(String.valueOf(paramMap.get("memberPhone")));
	}
	
	// 회원 가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp() {

		return "member/signUp";
	}
	

}
