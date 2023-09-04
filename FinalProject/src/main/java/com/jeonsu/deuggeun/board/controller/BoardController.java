package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/test")
	public String boardList() {
		return "board/boardList";
	}
	
	@RequestMapping("/notificationList")
	public String notificationList() {
		
		return "board/notificationList";
	}
	
	@RequestMapping("/notificationWrite")
	public String notificationWrite() {
		
		return "board/notificationWrite";
	}
	
	@RequestMapping("/notificationDetail")
	public String notificationDetail() {
		
		return "board/notificationDetail";
	}
	
	@RequestMapping("/reviewWrite")
	public String reivewWrite() {
		return "board/reviewWrite";
	}
	@RequestMapping("/QnAWrite")
	public String QnAWrite() {
		return "board/QnAWrite";
	}
	@RequestMapping("/inquireWrite")
	public String inquireWrite() {
		return "board/inquireWrite";
	}
	
	
}
