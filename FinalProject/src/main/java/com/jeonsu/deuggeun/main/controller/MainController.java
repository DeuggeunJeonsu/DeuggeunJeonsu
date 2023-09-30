package com.jeonsu.deuggeun.main.controller;

import java.util.List;


import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.jeonsu.deuggeun.member.model.dto.MemberBMI;
import com.jeonsu.deuggeun.member.model.service.MemberService;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

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
	
	// 추천 루틴 투두리스트에 삽입
	@RequestMapping("/survey/todoList")
	@ResponseBody
	public int surveyTodo(String routine, @SessionAttribute("loginMember") Member loginMember) {
		
		System.out.println(routine + "엥?");
		TodoList todoList = new TodoList();
		System.out.println("왜 널이냐");
		todoList.setListContent(routine);
		todoList.setMemberNo(loginMember.getMemberNo());
		System.out.println(todoList.getListContent());
		
		return service.surveyTodo(todoList);
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
	
	// 안읽은 채팅 카운트
	@ResponseBody
	@RequestMapping(value="/chattingCount", produces = "text/plain; charset=UTF-8")
	public String chattingCount(@SessionAttribute(value="loginMember", required=false) Member loginMember) {

		int memberNo = 0;
		if(loginMember != null) memberNo = loginMember.getMemberNo();
		
		return String.valueOf(service.chattingCount(memberNo));
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
		//System.out.println(count);
		return String.valueOf(count);
	}
	
	// 메인페이지 전체 게시판 인기글 조회
	@ResponseBody
	@GetMapping(value = "/trendingAll", produces = "application/json; charset=UTF-8")
	public String trendingAll() throws Exception {
		return new ObjectMapper().writeValueAsString(service.trendingAll());
	}
	
	// 정보 공유 게시판 인기글 조회
	@ResponseBody
	@GetMapping(value = "/trendingInfo", produces = "application/json; charset=UTF-8")
	public String trendingInfo() throws Exception {
		return new ObjectMapper().writeValueAsString(service.trendingInfo());
	}
	
	// 루틴 공유 게시판 인기글 조회
	@ResponseBody
	@GetMapping(value = "/trendingRoutine", produces = "application/json; charset=UTF-8")
	public String trendingRoutine() throws Exception {
		return new ObjectMapper().writeValueAsString(service.trendingRoutine());
	}
	
	// 자유 게시판 인기글 조회
	@ResponseBody
	@GetMapping(value = "/trendingFree", produces = "application/json; charset=UTF-8")
	public String trendingFree() throws Exception {
		return new ObjectMapper().writeValueAsString(service.trendingFree());
	}
	
	// 메인페이지 랭킹 맴버 리스트 조회
	
	
}
