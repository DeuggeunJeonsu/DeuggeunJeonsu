package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.dto.*;
import com.jeonsu.deuggeun.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.jeonsu.deuggeun.board.model.service.MarketService;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board")
public class MarketController {
// 요청주소 -> http://localhost:8080/board/5/list
	private final MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}

	// 마켓 리스트 가져오기
	@RequestMapping(value = "/{boardCode}/list")
	public String selectmarketList(
			@PathVariable(value = "boardCode") int boardCode,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			@RequestParam(value="sort", required=false, defaultValue="n") String sort,
			Model model,
			@RequestParam Map<String, Object> paramMap) {

		if(boardCode == 5){

		if(paramMap.get("keyword") == null) {

			Map<String, Object> map = service.selectMarketList(boardCode, cp, sort);
			model.addAttribute("map", map);

		}else{
			paramMap.put("boardCode", boardCode);
			paramMap.put("keyword", paramMap.get("keyword"));
			Map<String, Object> map = service.selectMarketList(paramMap, cp);

			model.addAttribute("map", map);
		}

		return "board/market/marketList";

		}else{
			return "/common/main";
		}
	}

	// 장바구니 페이지 이동
	@GetMapping("/cartList")
	public String cartList(Model model,
						   RedirectAttributes ra,
						   @SessionAttribute(value = "loginMember", required = false) Member loginMember) {

		int memberNo = loginMember.getMemberNo();
		int boardCode = 5;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("boardCode", boardCode);

		List<Cart> cartList = service.selectCart(map);

		model.addAttribute("cartList", cartList);

		return "/board/market/marketCart";
	}

	// 주문하기 페이지로 이동
	@GetMapping("/marketOrder")
	public String orderPage( @SessionAttribute(value = "loginMember", required = false) Member loginMember,
							 Model model,
							 RedirectAttributes ra
	){
		int memberNo = loginMember.getMemberNo();
		int boardCode = 5;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberNo", memberNo);
		map.put("boardCode", boardCode);

		List<Cart> cartList = service.selectCart(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("cartList", cartList);
		model.addAttribute("map2", map2);

		return "/board/market/marketOrder";
	}

	// 결제 성공 페이지
	@GetMapping("/success/{result}")
	public String successPage(@SessionAttribute(value = "loginMember", required = false) Member loginMember,
							  @PathVariable("result") int orderNo,
							  Model model){
		int memberNo = loginMember.getMemberNo();

		List<Order> orderList = service.selectOrderList(orderNo);

		model.addAttribute("orderList", orderList);
		return "/board/market/Success";
	}

	// 게시글 상세조회
	@GetMapping("/{boardCode}/detail/{productNo}")
	public String marketDetail(@PathVariable("boardCode") int boardCode
				  , @PathVariable("productNo") int productNo
				  , Model model // 데이터 전달용 객체
				  , RedirectAttributes ra // 리다이렉트 시 데이터 전달용 객체
			, @SessionAttribute(value="loginMember", required=false) Member loginMember
	) throws ParseException{


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

		}else{
			path = "redirect:/board/" + boardCode + "/list";
			ra.addFlashAttribute("message", "해당 상품이 존재하지 않습니다.");
		}

		return path;
	}

	// 리뷰 리스트 가져오기
	@GetMapping("/{boardCode}/review/{productNo}")
	public String reviewList(@PathVariable("boardCode") int boardCode
					, @RequestParam(value="cp", required=false, defaultValue="1") int cp
					, @PathVariable("productNo") int productNo
					, Model model
					, RedirectAttributes ra ){

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("boardCode", boardCode);
		map.put("productNo", productNo);

		Product product = service.selectProduct(map);

		Map<String, Object> map2 = service.selectReview(boardCode, cp, productNo);

		List<ProductImage> productImageList = service.selectImageList(productNo);

		String path = null;

		if(product != null){

			path = "board/market/marketReview";

			model.addAttribute("map2", map2);
			model.addAttribute("productImageList", productImageList);
			model.addAttribute("product", product);

		}else{
			path = "redirect:/board/" + boardCode + "/list";
			ra.addFlashAttribute("message", "해당 상품이 존재하지 않습니다.");
		}
		return path;
	}

	// 리뷰 작성 페이지로 이동
	@GetMapping("/{boardCode}/review/{productNo}/insert")
	public String boardInsert(@PathVariable("boardCode") int boardCode
							  ,@PathVariable("productNo") int productNo
							  ,@SessionAttribute("loginMember") Member loginMember
							  ,RedirectAttributes ra
	) {
		int memberNo = loginMember.getMemberNo();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("boardCode", 5);
		map.put("memberNo", memberNo);

		// 회원의 구매 여부 확인
		List<Cart> memberCart = service.checkPurchase(map);

		String path = null;
		String message = null;

		if(memberCart.isEmpty()){
			message = "구매하지 않은 상품입니다";
			path =  "redirect:/board/" + boardCode + "/review/" + productNo;
		}else{
			path = "board/reviewWrite";
		}
		ra.addFlashAttribute("message", message);
		return path;
	}

	// 리뷰 게시글 작성
	@PostMapping("/{boardCode}/review/{productNo}/insert")
	public String reviewInsert(@PathVariable("boardCode") int boardCode,
							   @PathVariable("productNo") int productNo,
							   Review review,
							   @RequestParam("reviewImage") MultipartFile image, // 업로드 파일
							   @SessionAttribute("loginMember") Member loginMember,
							   RedirectAttributes ra,
							   HttpSession session) throws IOException {

		// 세션에서 사용자 닉네임과 회원 번호 가져오기
		String memberNickname = (String) session.getAttribute("memberNickname");
		int memberNo = loginMember.getMemberNo();

		// Review 객체에 사용자 닉네임과 회원 번호 설정
		review.setMemberNickname(memberNickname);
		review.setMemberNo(memberNo);

		// 리뷰 정보 저장 및 이미지 업로드 처리
		String webPath = "/resources/images/review/"; // 이미지 저장 경로
		String filePath = session.getServletContext().getRealPath(webPath); // 서버 경로

		int reviewNo = service.reviewInsert(boardCode, productNo, review, image, webPath, filePath);

		String message = null;
		String path = "";

		if (reviewNo > 0) {

			message = "게시글이 등록 되었습니다.";
			path = "redirect:/board/" + boardCode + "/review/" + reviewNo + "/detail";

		} else {
			message = "게시글 등록 실패 ㅠㅠ";
			path = "redirect:/board/" + boardCode + "/detail/" + productNo;
		}

		ra.addFlashAttribute("message", message);

		return path;
	}
	// 리뷰 게시글 상세조회 + 조회수 증가 처리 연결
	@RequestMapping("/{boardCode}/review/{reviewNo}/detail")
	public String reviewDetail(@PathVariable("boardCode") int boardCode,
							   @PathVariable("reviewNo") int reviewNo,
							   Model model,
							   @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							   RedirectAttributes ra,
							   @SessionAttribute(value = "loginMember", required = false) Member loginMember,
							   HttpServletRequest req,
							   HttpServletResponse resp) throws ParseException {

		Map<String, Object> readMap = new HashMap<String, Object>();

		int memberNo = -1; // 기본값
		if (loginMember != null) {
			memberNo = loginMember.getMemberNo();
			readMap.put("memberNo", memberNo);
			readMap.put("reviewNo", reviewNo);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("reviewNo", reviewNo);
		map.put("cp", cp);

		Review review = service.selectReviewDetail(map);

		if (review != null) {
			// 로그인한 회원이 리뷰 작성자와 다를 때 조회수 증가
			if (loginMember != null && review.getMemberNo() != memberNo) {
				service.updateReadCount(readMap);
				// 조회수 증가 후 다시 상세 정보를 가져옴
				review = service.selectReviewDetail(map);
			}

			model.addAttribute("review", review);
			model.addAttribute("cp", cp);
			return "board/market/reviewDetail";
		} else {
			return "redirect:/board/" + boardCode + "/list";
		}
	}



	// 리뷰 게시글 수정 화면 전환
	@GetMapping("/{reviewNo}/update")
	public String reviewUpdate(@PathVariable("reviewNo") int reviewNo
							, Model model) {

		Map<String, Object> map = new HashMap<>();

		map.put("boardCode", 5);
		map.put("reviewNo", reviewNo);

		Review review = service.selectReviewDetail(map);

		model.addAttribute("review", review);

		return "board/market/reviewUpdate";
	}

	// 리뷰 게시글 수정
	@PostMapping("/{reviewNo}/update")
	public String reviewUpdate(Review review,
							   @RequestParam(value="cp", required = false, defaultValue = "1") int cp,
//							   @RequestParam("reviewImage") MultipartFile image,
							   @RequestParam(value="reviewImage", required=false) MultipartFile image,
							   @PathVariable("reviewNo") int reviewNo,
							   @RequestParam(value="imageDeleted", defaultValue="false") String imageDeleted,
							   HttpSession session,
							   RedirectAttributes ra) throws IllegalStateException, IOException {

		review.setBoardCode(5);
		review.setReviewNo(reviewNo);

		String webPath = "/resources/images/review/";
		String filePath = session.getServletContext().getRealPath(webPath);

		int rowCount = 0;

		if ("true".equals(imageDeleted)) {
			review.setUploadImage("null");
			rowCount = service.reviewUpdate(review, null, webPath, filePath); // null을 이미지로 전달
		} else {
			rowCount = service.reviewUpdate(review, image, webPath, filePath); // 이미지를 전달
		}

		String message = null;
		String path = "redirect:";

		if(rowCount > 0) {
			message = "게시글이 수정되었습니다.";
			path = "redirect:/board/5/review/" + reviewNo + "/detail";
		} else {
			message = "게시글 수정에 실패했습니다.";
			path += "/" + reviewNo + "/update";
		}

		ra.addFlashAttribute("message", message);
		return path;
	}
	// 리뷰 게시글 삭제
	@GetMapping("/{reviewNo}/delete/{productNo}")
	public String reviewDelete(@PathVariable("reviewNo") int reviewNo,
		    @PathVariable("productNo") int productNo,
			RedirectAttributes ra,
			@RequestHeader("referer") String referer){

		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", 5);
		map.put("reviewNo", reviewNo);
		map.put("productNo", productNo);

		int result = service.reviewDelete(map);

		String path = "";
		String message = null;

		if(result > 0){
			message = "게시글이 삭제되었습니다.";
			path = "redirect:/board/5/review/" + productNo;
		}else{
			message = "게시글 삭제에 실패했습니다";
			path += "/board/5/review/" + reviewNo + "/detail";
		}
		ra.addFlashAttribute("message", message);
		return path;
	}


	// 상품문의 게시판 목록
	@GetMapping("/{boardCode}/inquire/{productNo}")
	public String marketInquire(@PathVariable("boardCode") int boardCode
			, @PathVariable("productNo") int productNo
			, @RequestParam(value="cp", required=false, defaultValue="1") int cp
			,@SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, RedirectAttributes ra ) {

		int loginMemberNo = 0;

		if(loginMember != null){
			loginMemberNo = loginMember.getMemberNo();
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("boardCode", boardCode);
		map.put("productNo", productNo);

		Product product = service.selectProduct(map);

		Map<String, Object> map2 = service.selectInquiry(boardCode, cp, productNo);
		List<ProductImage> productImageList = service.selectImageList(productNo);

		map2.put("loginMemberNo", loginMemberNo);

		String path = null;

		if(product != null){

			model.addAttribute("map2", map2);
			model.addAttribute("productImageList", productImageList);
			model.addAttribute("product", product);

			path = "board/market/marketInquire";


		}else{
			path = "redirect:/board/" + boardCode + "/list";
			ra.addFlashAttribute("message", "해당 상품이 존재하지 않습니다.");
		}

		return path;
	}

	// 상품문의 상세페이지
	@GetMapping("{boardCode}/inquiry/{inquiryNo}/detail")
	public String inquiryDetail(@PathVariable("boardCode") int boardCode,
								@PathVariable("inquiryNo") int inquiryNo,
								Model model,
								@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
								RedirectAttributes ra,
								@SessionAttribute(value = "loginMember", required = false) Member loginMember){

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("inquiryNo", inquiryNo);
		map.put("cp", cp);  // cp 값을 추가

		Inquiry inquiry = service.selectInquiryDetail(map);

		String path = null;

		if(inquiry != null){

			path = "board/market/inquiryDetail";
			model.addAttribute("inquiry", inquiry);
			model.addAttribute("cp", cp);

		}else{
			path = "board/market/marketInquire";
		}

		return path;
	}

	// 상품문의 작성 페이지로 이동
	@GetMapping("/{boardCode}/inquiry/{productNo}/insert")
	public String inquiryInsert(@PathVariable("boardCode") int boardCode
								,@PathVariable("productNo") int productNo
	) {
		// @PathVariable : 주소 값 가져오기 + request scope에 값 올리기
		return "board/inquireWrite";
	}


	// 상품문의 게시글 작성
	@PostMapping("/{boardCode}/inquiry/{productNo}/insert")
	public String reviewInsert(@PathVariable("boardCode") int boardCode,
							   @PathVariable("productNo") int productNo,
							   Inquiry inquiry,
							   @RequestParam("inquiryImage") MultipartFile image, // 업로드 파일
							   @SessionAttribute("loginMember") Member loginMember,
							   RedirectAttributes ra,
							   HttpSession session) throws IOException {

		// 세션에서 사용자 닉네임과 회원 번호 가져오기
		String memberNickname = (String) session.getAttribute("memberNickname");
		int memberNo = loginMember.getMemberNo();
		// Review 객체에 사용자 닉네임과 회원 번호 설정
		inquiry.setMemberNickname(memberNickname);
		inquiry.setMemberNo(memberNo);

		// 리뷰 정보 저장 및 이미지 업로드 처리
		String webPath = "/resources/images/inquiry/"; // 이미지 저장 경로
		String filePath = session.getServletContext().getRealPath(webPath); // 서버 경로

		int inquiryNo = service.inquiryInsert(boardCode, productNo, inquiry, image, webPath, filePath);

		String message = null;
		String path = "";

		if (inquiryNo > 0) {

			message = "게시글이 등록 되었습니다.";
			path = "redirect:/board/" + boardCode + "/inquiry/" +  inquiryNo + "/detail";

		} else {
			message = "게시글 등록 실패 ㅠㅠ";
			path = "redirect:/board/" + boardCode + "/detail/" + productNo;
		}

		ra.addFlashAttribute("message", message);

		return path;
	}

	// 상품문의 게시글 삭제
	@GetMapping("/inquiry/{inquiryNo}/delete/{productNo}")
	public String inquiryDelete(@PathVariable("inquiryNo") int inquiryNo,
								@PathVariable("productNo") int productNo,
								RedirectAttributes ra,
								@RequestHeader("referer") String referer){

		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", 5);
		map.put("inquiryNo", inquiryNo);
		map.put("productNo", productNo);

		int result = service.inquiryDelete(map);

		String path = "";
		String message = null;

		if(result > 0){
			message = "게시글이 삭제되었습니다.";
			path = "redirect:/board/5/inquire/" + productNo;
		}else{
			message = "게시글 삭제에 실패했습니다";
			path += "/board/5/inquire/" + inquiryNo + "/detail";
		}
		ra.addFlashAttribute("message", message);
		return path;
	}
	// 상품문의 수정 페이지 이동
	@GetMapping("/update/{inquiryNo}")
	public String inquiryUpdate(@PathVariable("inquiryNo") int inquiryNo,
								Model model){

		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", 5);
		map.put("inquiryNo", inquiryNo);

		Inquiry inquiry = service.selectInquiryDetail(map);

		model.addAttribute("inquiry", inquiry);

		return "/board/market/inquiryUpdate";

	}

	// 상품문의 수정
	@PostMapping("/update/{inquiryNo}")
	public String inquiryUpdate(Inquiry inquiry,
								@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
								//@RequestParam("inquiryImage") MultipartFile image,
								@RequestParam(value="inquiryImage", required=false) MultipartFile image,
								@PathVariable("inquiryNo") int inquiryNo,
								@RequestParam(value="imageDeleted", defaultValue="false") String imageDeleted,
								HttpSession session,
								RedirectAttributes ra)throws IllegalStateException, IOException{

		inquiry.setBoardCode(5);
		inquiry.setInquiryNo(inquiryNo);

		String webPath = "/resources/images/inquiry/";
		String filePath = session.getServletContext().getRealPath(webPath);

		int rowCount = 0;

		if ("true".equals(imageDeleted)) {
			inquiry.setUploadImage("null");
			rowCount = service.inquiryUpdate(inquiry, null, webPath, filePath); // null을 이미지로 전달
		} else {
			rowCount = service.inquiryUpdate(inquiry, image, webPath, filePath); // 이미지를 전달
		}
		String message = null;
		String path = "redirect:";
		if(rowCount > 0) {
			message = "게시글이 수정되었습니다.";
			path = "redirect:/board/5/inquiry/" + inquiryNo + "/detail";
		} else {
			message = "게시글 수정에 실패했습니다.";
			path += "/" + inquiryNo + "/update";
		}
		ra.addFlashAttribute("message", message);
		return path;
	}

	// 자동완성 기능
	@RequestMapping(value = "/market/autocomplete")
	public @ResponseBody Map<String, Object> autocomplete(@RequestParam Map<String, Object> paramMap) throws Exception{

		List<Map<String, Object>> resultList = service.autocomplete(paramMap);
		paramMap.put("resultList", resultList);

		return paramMap;
	}

	@RequestMapping(value = "/checkReview")
	@ResponseBody
	public int checkReview(@RequestParam("productNo") int productNo,
						   @RequestParam("memberNo") int memberNo) {

		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("productNo", productNo);
		reviewMap.put("memberNo", memberNo);

		int result = service.checkReview(reviewMap);

		return result;
	}

}

