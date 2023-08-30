package com.jeonsu.deuggeun.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/myPage")
@Controller
public class MyPageController {

	@GetMapping("/myBadge")
	public String myBadge() {
		return "member/myPage/myBadge";
	}
	
	@GetMapping("/followingFollower")
	public String followingFollower() {
		return "member/myPage/followingFollower";
	}

	@GetMapping("/memberFeed")
	public String memberFeed() {
		return "member/myPage/memberFeed";
	}
}
