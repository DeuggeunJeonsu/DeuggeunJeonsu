package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/2")
public class ShareBoardController {
	
	@RequestMapping("/list")
	public String shareBoardList() {
		return "board/shareBoard/shareBoardList";
	}
	
	@RequestMapping("/write")
	public String shareBoardWrite() {
		return "board/shareBoard/shareBoardWrite";
	}
	@RequestMapping("/boardNo")
	public String shareBoardDetail() {
		return "board/shareBoard/shereBoardDetail";
	}
}
