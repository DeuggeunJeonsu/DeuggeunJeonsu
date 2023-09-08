package com.jeonsu.deuggeun.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeonsu.deuggeun.board.model.service.MarketService;


@Controller
@RequestMapping("/market")
public class MarketController {

//	@Autowired
//	private MarketService service;

	@GetMapping("/marketList")
	public String selectmarketList() {
		return "board/market/marketList";
	}
	
	@GetMapping("/marketDetail")
	public String marketDetail() {
		return "board/market/marketDetail";
	}
	
	@GetMapping("/marketReview")
	public String marketReview() {
		return "board/market/marketReview";
	}
	@GetMapping("/marketInquire")
	public String marketQnA() {
		return "board/market/marketInquire";
	}
	@GetMapping("/marketCart")
	public String marketCart() {
		return "board/market/marketCart";
	}
	@GetMapping("/marketOrder")
	public String Order() {
		return "board/market/marketOrder";
	}
	@GetMapping("/reviewDetail")
	public String reviewDetail() {
		return "board/market/reviewDetail";
	}
}
