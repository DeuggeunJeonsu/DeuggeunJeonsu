package com.jeonsu.deuggeun.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping("/myPage/myBadge")
	public String myBadge() {
		return "member/myPage/myBadge";
	}
	
}
