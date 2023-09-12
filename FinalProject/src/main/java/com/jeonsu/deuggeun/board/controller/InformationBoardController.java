package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/1") /* 건강/운동정보 게시판 */
public class InformationBoardController {
	
	@GetMapping("/list")
	public String informationBoardList() {
		return "board/informationBoard/informationBoardList";
	}
	
	@GetMapping("/write")
	public String informationBoardWrite() {
		return "board/informationBoard/informationBoardWrite";
	}
	
	@GetMapping("/detail")
	public String informationBoardDetail() {
		return "board/informationBoard/informationBoardDetail";
	}
	
}
