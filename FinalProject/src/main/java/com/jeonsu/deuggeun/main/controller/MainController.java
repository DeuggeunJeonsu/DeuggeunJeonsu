package com.jeonsu.deuggeun.main.controller;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.jeonsu.deuggeun.member.model.dto.MemberBMI;
import com.jeonsu.deuggeun.member.model.service.MemberService;

@Controller
@SessionAttributes({"loginMember"})
public class MainController {
	
	@Autowired
	MemberService service;
	
	// 메인페이지로 이동
	@RequestMapping("/")
	public String mainForward() {
		return "common/main";
	}
	
	// 운동루틴추천 페이지로 이동
	@RequestMapping("/survey")
	public String survey() {
		return "common/survey";
	}
	
	// BMI 페이지로 이동
	@RequestMapping("/bmi")
	public String bmi() {
		return "common/bmi";
	}
	
	// 내 BMI 히스토리 불러오기
	@ResponseBody
	@RequestMapping(value="/bmi/loadBMI", produces = "application/json; charset=UTF-8")
	public List<MemberBMI> loadBMI(@RequestBody Map<String, Object> paramMap) {
		return service.loadBMI(paramMap);
	}
	
	// 내 회원정보에 BMI 저장
	@ResponseBody
	@RequestMapping(value="/bmi/addBMI", produces = "application/json; charset=UTF-8")
	public int addBMI(@RequestBody Map<String, Object> paramMap) {
		return service.addBMI(paramMap);
	}

	// 장바구니 상품 카운트
	@ResponseBody
	@RequestMapping(value="/shoppingCount", produces = "text/plain; charset=UTF-8")
	public String shoppingCount(@SessionAttribute(value="loginMember", required=false) Member loginMember) {

		int memberNo = 0;

		if(loginMember != null){
			memberNo = loginMember.getMemberNo();
		}
		int count = service.shoppingCount(memberNo);
		System.out.println(count);
		return String.valueOf(count);
	}
}
