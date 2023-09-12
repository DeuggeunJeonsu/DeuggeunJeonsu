package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.service.MarketServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.jeonsu.deuggeun.board.model.service.MarketService;

import java.util.Map;

//@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/5")
public class MarketController {
// 요청주소 -> http://localhost:8080/board/5/list
	private final MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}

	@GetMapping("/list")
	public String selectmarketList(
			//@PathVariable("boardCode")
//			int boardCode
//								 , @RequestParam(value="cp", required=false, defaultValue="1") int cp
//								 , Model model
//								 , @RequestParam Map<String, Object> paramMap
		) {

//		if(paramMap.get("query") == null) {
//
//			Map<String, Object> map = service.selectMarketList(boardCode, cp);
//
//			model.addAttribute("map", map);
//
//		}else{
//			paramMap.put("boardCode", boardCode);
//
//			Map<String, Object> map = service.selectMarketList(paramMap, cp);
//
//			model.addAttribute("map", map);
//		}

		return "board/market/marketList";
	}
	@GetMapping("/detail")
	public String marketDetail() {
		return "board/market/marketDetail";
	}
	@GetMapping("/review")
	public String marketReview() {
		return "board/market/marketReview";
	}
	@GetMapping("/inquire")
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
