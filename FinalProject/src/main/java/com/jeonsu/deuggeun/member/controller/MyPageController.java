package com.jeonsu.deuggeun.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Cart;
import com.jeonsu.deuggeun.board.model.dto.Inquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.service.MyPageService;

import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/myPage")
@Controller
@SessionAttributes({"loginMember"})
public class MyPageController {

	@Autowired
	private MyPageService service;

	// 마이페이지 내 뱃지 페이지 이동 + 뱃지 목록 조회
	@GetMapping("/myBadge")
	public String myBadge(
			@SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {

		int memberNo = loginMember.getMemberNo();

		// 뱃지 목록 조회
		Map<String, Object> map = service.selectBadgeList(memberNo);

		model.addAttribute("map", map);

		return "member/myPage/myBadge";
	}

	// 마이페이지 팔로잉/팔로워 페이지 이동 + 팔로잉 목록 조회
	@GetMapping("/followingFollower")
	public String followingFollower(
			@SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {

		int memberNo = loginMember.getMemberNo();

		// 팔로잉 목록 조회
		Map<String, Object> map = service.selectFollowingList(memberNo);

		model.addAttribute("map", map);

		return "member/myPage/followingFollower";
	}

	// 마이페이지 팔로잉/팔로워 - 팔로잉 목록 조회 (비동기)
	@PostMapping(value = "/followingFollower/following", produces = "application/json")
	@ResponseBody
	public Map<String, Object> selectFollowingList(
			@SessionAttribute(value = "loginMember") Member loginMember
			) {

		int memberNo = loginMember.getMemberNo();

		return service.selectFollowingList(memberNo);
	}

	// 마이페이지 팔로잉/팔로워 - 팔로워 목록 조회 (비동기)
	@PostMapping(value = "/followingFollower/follower", produces = "application/json")
	@ResponseBody
	public Map<String, Object> selectFollowerList(
			@SessionAttribute(value = "loginMember") Member loginMember
			) {

		int memberNo = loginMember.getMemberNo();

		return service.selectFollowerList(memberNo);
	}

	// 마이페이지 언팔로우
	@PostMapping(value = "/followingFollower/unfollow", produces = "application/json")
	@ResponseBody
	public int unfollow(@RequestBody Map<String, Object> paramMap){

		return service.unfollow(paramMap);
	}

	// 마이페이지 팔로우
	@PostMapping(value = "/followingFollower/follow", produces = "application/json")
	@ResponseBody
	public int follow(@RequestBody Map<String, Object> paramMap){

		return service.follow(paramMap);
	}

	// 마이페이지 팔로우 수 조회
	@PostMapping(value = "/followingFollower/selectFollowCount", produces = "application/json")
	@ResponseBody
	public Map<String, Object> selectFollowCount(@RequestBody Map<String, Object> paramMap){

		return service.selectFollowCount(paramMap);
	}

	// 마이페이지 해당 멤버 피드 페이지 이동
	@GetMapping("/memberFeed/{memberNo}")
	public String memberFeed(
			@PathVariable("memberNo") int memberNo
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {

		int loginMemberNo = loginMember.getMemberNo();

		Map<String, Object> map = service.selectFeedMember(loginMemberNo, memberNo, cp);

		model.addAttribute("map", map);

		return "member/myPage/memberFeed";
	}

	// 마이페이지 멤버 피드 - 팔로워 목록 조회
	@PostMapping(value = "/memberFeed/{memberNo}/follower", produces = "application/json")
	@ResponseBody
	public Map<String, Object> memberFeedFollowerList(
			@PathVariable("memberNo") int memberNo
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {

		return service.selectFollowerList(memberNo);
	}

	// 마이페이지 멤버 피드 - 팔로잉 목록 조회
	@PostMapping(value = "/memberFeed/{memberNo}/following", produces = "application/json")
	@ResponseBody
	public Map<String, Object> memberFeedFollowingList(
			@PathVariable("memberNo") int memberNo
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {

		return service.selectFollowingList(memberNo);
	}

	// 마이페이지 멤버 피드 - 언팔로우
	@PostMapping(value = "/memberFeed/{memberNo}/unfollow", produces = "application/json")
	@ResponseBody
	public int feedUnfollow(
			@RequestBody Map<String, Object> paramMap
			, @PathVariable("memberNo") int memberNo
			){

		System.out.println(paramMap.get("loginMemberNo"));
		System.out.println(paramMap.get("memberNo"));

		return service.unfollow(paramMap);
	}

	// 마이페이지 멤버 피드 - 팔로우
	@PostMapping(value = "/memberFeed/{memberNo}/follow", produces = "application/json")
	@ResponseBody
	public int feedFollow(
			@RequestBody Map<String, Object> paramMap
			, @PathVariable("memberNo") int memberNo
			){

		return service.follow(paramMap);
	}


	// 마이페이지 내 게시글 목록 조회
	@GetMapping("/myBoardList")
	public String myBoardList(
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap) {

		int memberNo = loginMember.getMemberNo();

		Map<String, Object> map = service.selectMyBoardList(memberNo, cp);

		model.addAttribute("map", map);

		return "member/myPage/myBoardList";
	}

	// 마이페이지 구매 내역 목록 조회
	@GetMapping("/myPurchaseList")
	public String myPurchaseList(
			@SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {

		int memberNo = loginMember.getMemberNo();

		List<Cart> purchaseList = new ArrayList<Cart>();

		if(paramMap.get("key") == null) {
			purchaseList = service.selectPurchaseList(memberNo);
			System.out.println("구매내역의 값 : " + purchaseList);

		} else {

			System.out.println("이것이 키다:"+paramMap.get("key"));

			purchaseList = service.selectPurchaseList(memberNo, paramMap);

		}

		model.addAttribute("purchaseList", purchaseList);

		return "member/myPage/myPurchaseList";
	}


	// 내 정보수정 페이지
	@GetMapping("/myUpdate")
	public String myUpdate() {
		return "member/myPage/myUpdate";
	}

	// 회원탈퇴
	@PostMapping("/secession")
	public String secession(@SessionAttribute("loginMember") Member loginMember
			,@RequestHeader(value="referer") String referer
			,String memberPw
			,RedirectAttributes ra
			,SessionStatus status
			,HttpServletResponse resp) {

		int result = service.secession(loginMember.getMemberNo() , memberPw);

		String path = "redirect:";
		String message = null;

		if(result > 0) {
			message = "탈퇴 되었습니다.";
			ra.addFlashAttribute("message", message);

			path += "/";

			status.setComplete();

			Cookie cookie = new Cookie("saveId", "");

			cookie.setMaxAge(0);
			cookie.setPath("/");
			resp.addCookie(cookie);
		}else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			ra.addFlashAttribute("message", message);

			path += referer;
		}


		return path;
	}



	@GetMapping("/mySecession")
	public String mySecession() {
		return "member/myPage/mySecession";
	}

	// 마이페이지 1:1문의 목록 조회
	@GetMapping("/oneOnOneInquiry")
	public String myOneByOneInquiry(@SessionAttribute("loginMember") Member loginMember,
			Model model) {

		Map<String, Object> map = service.selectMyUpdateList(loginMember);

		if(map.get("boardList") != null) {

			model.addAttribute("map", map);
		}
		return "member/myPage/myOneOnOneInquiry";
	}

	// 마이페이지 1:1 문의 답변 조회
	@RequestMapping("/inquiryAnswer")
	@ResponseBody
	public Board inquiryAnswer(@RequestParam int boardNo) {



		return service.inquiryAnswer(boardNo);
	}

	// 마이페이지 상품문의 답변 조회
	@RequestMapping("/inquiryMarketAnswer")
	@ResponseBody
	public Board inquiryMarketAnswer(@RequestParam String marketTitle) {



		return service.inquiryMarketAnswer(marketTitle);
	}
	
	// 회원프로필 수정
	@ResponseBody
	@PostMapping("/changeProfile")
	public int changeProfile(
			@RequestParam("profileImage") MultipartFile profileImage // 업로드한 파일 정보
			, @SessionAttribute("loginMember") Member loginMember 

			, HttpSession session
			) throws IllegalStateException, IOException{

		// System.out.println("profileImage File Name : " + profileImage.getOriginalFilename());
		// System.out.println("profileImage File Size : " +profileImage.getSize());

		String webPath = "/resources/images/member/";

		// 실제 파일 저장 경로 
		String filePath = session.getServletContext().getRealPath(webPath);

		// 프로필 이미지 수정 서비스 호출 
		return  service.updateProfile(profileImage, webPath, filePath, loginMember);


	}


	// 회원정보 수정 & 비밀번호 변경
	@PostMapping("/info")
	public String info(Member updateMember, String[] memberAddress
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			, String newPw
			) {

		// 주소
		String addr = String.join("^^^", memberAddress);
		updateMember.setMemberAddress(addr);

		// 로그인한 회원번호 추가 
		updateMember.setMemberNo( loginMember.getMemberNo());

		// DB에 회원 정보 수정 Update 서비스 호출
		int result = service.updateInfo(updateMember);

		String message = null; 
		if(result > 0 ) {
			message = "회원정보가 수정되었습니다.";

			//Session에 로그인된  회원 정보도 수정(동기화)
			loginMember.setMemberNickname(updateMember.getMemberNickname());
			loginMember.setMemberTel(updateMember.getMemberTel());
			loginMember.setMemberAddress(updateMember.getMemberAddress());

		}else {
			message= "회원 정보 수정 실패.";
		}

		//----------------------------------------------------
		// 비밀번호 변경 
		if( newPw != null ) {
			int memberNo = loginMember.getMemberNo();

			// 비밀번호 변경 Service 호출
			int result2 = service.changePw(newPw, memberNo);
			
		}	
		ra.addFlashAttribute("message", message);
		return"redirect:myUpdate"; 
	}
}
