package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.dto.Product;
import com.jeonsu.deuggeun.board.model.dto.ProductImage;
import com.jeonsu.deuggeun.board.model.dto.Review;
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
				  ,@SessionAttribute("loginMember") Member loginMember
				   //, @SessionAttribute(value="loginMember", required=false) Member loginMember
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
	) {
		// @PathVariable : 주소 값 가져오기 + request scope에 값 올리기
		return "board/reviewWrite";
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

		System.out.println("이미지 이름 : " + image);
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
							   RedirectAttributes ra,
							   @SessionAttribute(value = "loginMember", required = false) Member loginMember,
							   HttpServletRequest req,
							   HttpServletResponse resp) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("reviewNo", reviewNo);

		Review review = service.selectReviewDetail(map);

		String path = null;

//		if (loginMember == null || loginMember.getMemberNo() != review.getMemberNo()) {
//
//			Cookie c = null;
//
//			Cookie[] cookies = req.getCookies();
//
//			if (cookies != null) { // 쿠키가 존재할 경우
//
//				// 쿠키 중 "readBoardNo"라는 쿠키를 찾아서 c에 대입
//				for (Cookie cookie : cookies) {
//					if (cookie.getName().equals("readReviewNo")) {
//						c = cookie;
//						break;
//					}
//				}
//			}
//			int result = 0;
//
//			if (c == null) {
//
//				c = new Cookie("readReviewNo", "|" + reviewNo + "|");
//
//				result = service.updateReadCount(reviewNo);
//
//			} else {
//
//				if (c.getValue().indexOf("|" + reviewNo + "|") == -1) {
//					// 쿠키에 현재 게시글 번호가 없다면
//
//					// 기존 값에 게시글 번호 추가해서 다시 세팅
//					c.setValue(c.getValue() + "|" + reviewNo + "|");
//
//					// 조회 수 증가 서비스 호출
//					result = service.updateReadCount(reviewNo);
//				}
//			}
//
//			if (result > 0) {
//
//				review.setReadCount(review.getReadCount() + 1);
//
//				c.setPath("/"); // "/" 이하 경로 요청 시 쿠키 서버로 전달
//
//				Calendar cal = Calendar.getInstance(); // 싱글톤 패턴
//				cal.add(cal.DATE, 1);
//
//				// 날짜 표기법 변경 객체 (DB의 TO_CHAR()와 비슷)
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//				Date a = new Date(); // 현재 시간
//
//				Date temp = new Date(cal.getTimeInMillis()); // 내일 (24시간 후)
//				// 2023-08-24 12:17:40
//
//				Date b = sdf.parse(sdf.format(temp));
//
//				long diff = (b.getTime() - a.getTime()) / 1000;
//
//				c.setMaxAge((int) diff);
//
//				resp.addCookie(c);
//
//			}

			path = "board/market/reviewDetail";
			model.addAttribute("review", review);
//		} else {
//
//			path = "board/market/marketReview";
//			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
//		}

		return path;
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
}
