package com.jeonsu.deuggeun.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.service.MyPageService;

@RequestMapping("/myPage")
@Controller
@SessionAttributes({"loginMember"})
public class MyPageController {
	
	@Autowired
	private MyPageService service;

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

	@GetMapping("/myBoardList")
	public String myBoardList(
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap) {
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = service.selectMyBoardList(memberNo, cp);
		
		model.addAttribute("map", map);
		
		return "member/myPage/myBoardList";
	}

	@GetMapping("/myPurchaseList")
	public String myPurchaseList() {
		return "member/myPage/myPurchaseList";
	}
	
	@GetMapping("/myUpdate")
	public String myUpdate() {
		return "member/myPage/myUpdate";
	}
	
	@GetMapping("/mySecession")
	public String mySecession() {
		return "member/myPage/mySecession";
	}
	
	@GetMapping("/oneOnOneInquiry")
	public String myOneByOneInquiry() {
		return "member/myPage/myOneOnOneInquiry";
	}
}
