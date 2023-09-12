package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/* 공지사항 Controller */
@Controller
public class NotificationController {

	@RequestMapping("/test")
	public String boardList() {
		return "board/boardList";
	}
	
	@RequestMapping("/board/4")
	public String notificationList() {
		
		return "board/notification/notificationList";
	}
	
	@RequestMapping("/notificationWrite")
	public String notificationWrite() {
		
		return "board/notification/notificationWrite";
	}
	
	@RequestMapping("/notificationDetail")
	public String notificationDetail() {
		
		return "board/notification/notificationDetail";
	}
	// 리뷰작성 요청
	@RequestMapping("/reviewWrite")
	public String reivewWrite() {
		return "board/reviewWrite";
	}
	// 상품문의 요청
	@RequestMapping("/inquireWrite")
	public String inquireWrite() {
		return "board/inquireWrite";
	}
	// 회원 일반 문의
	@RequestMapping("/QnAWrite")
	public String QnAWrite() {
		return "board/QnAWrite";
	}
}
