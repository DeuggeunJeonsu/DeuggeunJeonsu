package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.service.MarketServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.jeonsu.deuggeun.board.model.service.MarketService;

import java.util.Map;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/market")
public class MarketController {

	private final MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}

	@GetMapping("/marketList")
	public String selectmarketList(@PathVariable("boardCode") int boardCode
								 , @RequestParam(value="cp", required=false, defaultValue="1") int cp
								 , Model model
								 , @RequestParam Map<String, Object> paramMap
	) {

		if(paramMap.get("key") == null) {

			Map<String, Object> map = service.selectMarketList(boardCode, cp);

			model.addAttribute("map", map);

		}else{
			paramMap.put("boardCode", boardCode);

			Map<String, Object> map = service.selectMarketList(paramMap, cp);

			model.addAttribute("map", map);
		}

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
