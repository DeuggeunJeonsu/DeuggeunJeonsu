package com.jeonsu.deuggeun.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	// 회원 가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp() {

		return "member/signUp";
	}
	

}
