package com.jeonsu.deuggeun.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}

}
