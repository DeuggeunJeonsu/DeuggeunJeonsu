package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	@GetMapping("/list")
	public String FreeBoardList() {
		return "board/freeBoard/freeBoardList";
	}

	@GetMapping("/write")
	public String FreeBoardWrite() {
		return "board/freeBoard/freeBoardWrite";
	}

	@GetMapping("/detail")
	public String FreeBoardDetail() {
		return "board/freeBoard/freeBoardDetail";
	}
	
	
}
