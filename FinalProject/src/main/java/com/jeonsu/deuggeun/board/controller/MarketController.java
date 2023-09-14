package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.dto.Product;
import com.jeonsu.deuggeun.board.model.dto.ProductImage;
import com.jeonsu.deuggeun.board.model.dto.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.text.ParseException;
import java.util.HashMap;
import com.jeonsu.deuggeun.board.model.service.MarketService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

//@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board")
public class MarketController {
// 요청주소 -> http://localhost:8080/board/5/list
	private final MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}

	@RequestMapping(value = "/{boardCode:[5]}/list")
	public String selectmarketList(
			@PathVariable(value = "boardCode") int boardCode
			, @RequestParam(value="cp", required=false, defaultValue="1") int cp
			//@RequestParam(value = "query", required = false) String query
			, Model model
			, @RequestParam Map<String, Object> paramMap
		) {

		if(paramMap.get("query") == null) {

				//System.out.println("쿼리 값 없음!!" + paramMap.get("query") );
				Map<String, Object> map = service.selectMarketList(boardCode, cp);
				model.addAttribute("map", map);

		}else{
				paramMap.put("boardCode", boardCode);
				System.out.println("쿼리 : " + paramMap.get("query"));
				Map<String, Object> map = service.selectMarketList(paramMap, cp);

				model.addAttribute("map", map);
		}

		return "board/market/marketList";
	}

	// 게시글 상세조회
	@GetMapping("/{boardCode}/detail/{productNo}")
	public String marketDetail(@PathVariable("boardCode") int boardCode
				  , @PathVariable("productNo") int productNo
				  , Model model // 데이터 전달용 객체
				  , RedirectAttributes ra // 리다이렉트 시 데이터 전달용 객체
				   //, @SessionAttribute(value="loginMember", required=false) Member loginMember
				   // 세션에서 loginMember를 얻어오는데 없으면 null, 있으면 회원정보 저장
	) throws ParseException{

		System.out.println("게시글 상세 조회 시작!");

		Map<String, Object> map = new HashMap<String, Object>();


		map.put("boardCode", boardCode);
		map.put("productNo", productNo);

		Product product = service.selectProduct(map);

		List<ProductImage> productImageList = service.selectImageList(productNo);

		String path = null;

		if(product != null){

			path = "board/market/marketDetail";
			model.addAttribute("productImageList", productImageList);
			model.addAttribute("product", product);
//			System.out.println("pro 이미지 리스트 : " + productImageList);
//			System.out.println("product의 값" + product);

		}else{
			path = "redirect:/board/" + boardCode + "/list";
			ra.addFlashAttribute("message", "해당 상품이 존재하지 않습니다.");
		}

		return path;
	}

	// 리뷰 리스트 가져오기
	@GetMapping("/{boardCode}/review/{productNo}")
	public String reviewList(@PathVariable("boardCode") int boardCode
			, @PathVariable("productNo") int productNo
			, Model model
			, RedirectAttributes ra ){

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("boardCode", boardCode);
		map.put("productNo", productNo);
	//
		Product product = service.selectProduct(map);

		List<Review> reviewList = service.selectReviewList(map);
		System.out.println("product의 값 : " + product);
		System.out.println("reviewList의 값 : " + reviewList);
		List<ProductImage> productImageList = service.selectImageList(productNo);

		String path = null;

		if(product != null){

			path = "board/market/marketReview";
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("productImageList", productImageList);
			model.addAttribute("product", product);

		}else{
			path = "redirect:/board/" + boardCode + "/list";
			ra.addFlashAttribute("message", "해당 상품이 존재하지 않습니다.");
		}
		return path;
	}


	//	@GetMapping("/review")
	//	public String marketReview() {
	//		return "board/market/marketReview";
	//	}
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
