package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareBoard {
	
	@RequestMapping("/shareBoard")
	public String shareBoardList() {
		return "board/shareBoard/shareBoardList";
	}
	
	@RequestMapping("/shareBoard/write")
	public String shareBoardWrite() {
		return "board/shareBoard/shareBoardWrite";
	}
	@RequestMapping("/shareBoard/boardNo")
	public String shareBoardDetail() {
		return "board/shareBoard/shereBoardDetail";
	}
}
