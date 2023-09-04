package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InformationBoardController {
	
	@RequestMapping("/informationBoardList")
	public String informationBoardList() {
		return "/board/informationBoard/informationBoardList";
	}
	
	@RequestMapping("/informationBoardDetail")
	public String informationBoardDetail() {
		return "/board/informationBoard/informationBoardDetail";
	}
	
	@RequestMapping("/informationBoardWrite")
	public String informationBoardWrite() {
		return "/board/informationBoard/informationBoardWrite";
	}

}
