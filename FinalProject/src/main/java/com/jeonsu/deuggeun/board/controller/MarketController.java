package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/market")
public class MarketController {

//	@Autowired
//	private MarketService service;

	@GetMapping("/")
	public String MarketList() {
		return "board/market/marketList";
	}
	
	@GetMapping("/payment")
	public String payment() {
		return "board/market/payment";
	}
	
//	@GetMapping("/marketDetail")
//	public String marketDetail() {
//		
//		return "board/market/marketDetail";
//	}
}
