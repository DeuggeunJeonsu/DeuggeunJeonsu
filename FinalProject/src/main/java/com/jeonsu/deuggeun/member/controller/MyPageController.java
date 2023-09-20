package com.jeonsu.deuggeun.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.service.MyPageService;

@RequestMapping("/myPage")
@Controller
@SessionAttributes({"loginMember"})
public class MyPageController {
	
	@Autowired
	private MyPageService service;

	// 마이페이지 내 뱃지 페이지 이동
	@GetMapping("/myBadge")
	public String myBadge() {
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

	// 마이페이지 해당 멤버 피드 페이지 이동
	@GetMapping("/memberFeed/{memberNo}")
	public String memberFeed(
			@PathVariable("memberNo") int memberNo
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember
			, Model model
			, @RequestParam Map<String, Object> paramMap
			) {
		
		int loginMemberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = service.selectFeedMember(loginMemberNo, memberNo);
		
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
	public String myPurchaseList() {
		return "member/myPage/myPurchaseList";
	}
	
	// 마이페이지 1:1문의 목록 조회
	@GetMapping("/myUpdate")
	public String myUpdate() {
		return "member/myPage/myUpdate";
	}
	
	@GetMapping("/mySecession")
	public String mySecession() {
		return "member/myPage/mySecession";
	}
	
	@GetMapping("/oneOnOneInquiry")
	public String myOneByOneInquiry() {
		return "member/myPage/myOneOnOneInquiry";
	}
}
