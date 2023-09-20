package com.jeonsu.deuggeun.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonsu.deuggeun.board.model.dao.ashBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.member.model.dao.MyPageDAO;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;

	// 마이페이지 내 게시글 목록 조회
	@Override
	public Map<String, Object> selectMyBoardList(int memberNo, int cp) {
		
		int listCount = dao.getListCount(memberNo);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> boardList = dao.selectBoardList(memberNo, pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}

	// 마이페이지 팔로잉 목록 조회
	@Override
	public Map<String, Object> selectFollowingList(int memberNo) {
		
		int followingTotalCount = dao.getFollowingTotalCount(memberNo);
		int followerTotalCount = dao.getFollowerTotalCount(memberNo);
		
		List<Member> followingList = dao.selectFollowingList(memberNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("followingTotalCount", followingTotalCount);
		map.put("followerTotalCount", followerTotalCount);
		map.put("followingList", followingList);
		
		return map;
	}

	// 마이페이지 팔로워 목록 조회
	@Override
	public Map<String, Object> selectFollowerList(int memberNo) {
		
		List<Member> followerList = dao.selectFollowerList(memberNo);
		
		List<Member> followingList = dao.selectFollowingList(memberNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("followerList", followerList);
		map.put("followingList", followingList);
		
		return map;
	}

	// 마이페이지 언팔로우
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int unfollow(Map<String, Object> paramMap) {
		return dao.unfollow(paramMap);
	}

	// 마이페이지 팔로우
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int follow(Map<String, Object> paramMap) {
		return dao.follow(paramMap);
	}

	// 마이페이지 멤버 피드 조회
	@Override
	public Map<String, Object> selectFeedMember(int loginMemberNo, int memberNo, int cp) {
		
		// 피드 주인인 회원 정보 얻어오기
		Member member = dao.selectFeedMember(memberNo);
		
		// 피드 주인의 팔로잉, 팔로워 수 얻어오기
		int followerTotalCount = dao.getFollowerTotalCount(memberNo);
		int followingTotalCount = dao.getFollowingTotalCount(memberNo);

		Map<String, Object> memberNoMap = new HashMap<>();
		memberNoMap.put("loginMemberNo", loginMemberNo);
		memberNoMap.put("memberNo", memberNo);
		
		// 로그인한 회원이 피드 주인을 팔로우했는지 확인하기
		int result = dao.feedFollowCheck(memberNoMap);
		
		int followCheck = 0;
		
		if(result > 0) {
			followCheck = 1;
		}
		
		// 피드 주인의 게시글 조회하기
		int listCount = dao.getBoardCount(memberNo);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> boardList = dao.selectFeedBoardList(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("feedMember", member);
		map.put("followerTotalCount", followerTotalCount);
		map.put("followingTotalCount", followingTotalCount);
		map.put("followCheck", followCheck);
		map.put("boardList", boardList);
		map.put("pagination", pagination);
		
		return map;
	}

	// 마이페이지 팔로우 수 조회
	@Override
	public Map<String, Object> selectFollowCount(Map<String, Object> paramMap) {
		
		int memberNo = Integer.parseInt((String) paramMap.get("memberNo"));

		int followingTotalCount = dao.getFollowingTotalCount(memberNo);
		int followerTotalCount = dao.getFollowerTotalCount(memberNo);

		Map<String, Object> map = new HashMap<>();
		map.put("followingTotalCount", followingTotalCount);
		map.put("followerTotalCount", followerTotalCount);
		
		return map;
	}

}
