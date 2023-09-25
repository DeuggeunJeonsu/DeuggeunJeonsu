package com.jeonsu.deuggeun.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.board.model.dto.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dao.ashBoardDAO;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.common.utility.Util;
import com.jeonsu.deuggeun.member.model.dao.MyPageDAO;
import com.jeonsu.deuggeun.member.model.dto.Badge;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;

		@Autowired
		private BCryptPasswordEncoder bcrypt;

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

	// 결제 완료시 마이페이지 구매내역
	@Override
	public List<Cart> selectPurchaseList(int memberNo) {
		return dao.selectPurchaseList(memberNo);
	}

	// 마이페이지 1:1 문의 목록조회
	@Override
	public Map<String, Object> selectMyUpdateList(Member loginMember) {

		List<Board> boardList = dao.selectMyUpdateList(loginMember);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("boardList", boardList);

		return map;
	}

	// 마이페이지 1:1 문의 답변조회
	@Override
	public Board inquiryAnswer(int boardNo) {
		
		// 문의글 답변 내용 조회를 위한 게시글 번호 조회
		int adminBoardNo = dao.selectAdminBoardNo(boardNo);
		
		Board board = new Board();
		
		board.setAdminBoardNo(adminBoardNo);
		
		 board = dao.inquiryAnswer(board);
		 
		 System.out.println(board.getBoardTitle());
		 System.out.println(board.getBoardContent());
		
		
		
		return board;
	}

	// 마이페이지 내 뱃지 페이지 이동 + 뱃지 목록 조회
	@Override
	public Map<String, Object> selectBadgeList(int memberNo) {
		
		// 로그인한 회원의 뱃지 목록 조회
		List<Badge> badgeList = dao.selectBadgeList(memberNo);
		
		// 로그인한 회원의 뱃지 수 조회
		int badgeCount = dao.getBadgeCount(memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("badgeList", badgeList);
		map.put("badgeCount", badgeCount);
		
		return map;
	}


		// 회원 탈퇴
		@Transactional(rollbackFor = {Exception.class} )
		@Override
		public int secession(int memberNo, String memberPw) {
			
			String encPw = dao.selectEncPw(memberNo);
			
			if(bcrypt.matches(memberPw, encPw)) {
				return dao.secession(memberNo);
			}
			
			return 0;
		}

		// 회원 프로필 수정
		@Override
		public int updateImage(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws IllegalStateException, IOException {
			
			String temp = loginMember.getProfileImage();
			
			String rename = null;
			
			if(profileImage.getSize() > 0) {
				
				rename = Util.fileRename(profileImage.getOriginalFilename());
				
				loginMember.setProfileImage(webPath + rename);
				
			} else {
				loginMember.setProfileImage(null);
			}
			
			int result = dao.updateProfile(loginMember);
			
			if(result > 0) {
				
				if(rename != null) {
					profileImage.transferTo(new File(filePath + rename));
				}
			} else {
				loginMember.setProfileImage(temp);
			}
			
			return result;
		}

		// 마이페이지 - 구매 내역 selectbox 선택 시
		@Override
		public List<Cart> selectPurchaseList(int memberNo, Map<String, Object> paramMap){
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberNo", memberNo);
			map.put("key", paramMap.get("key"));
			
			List<Cart> purchaseList = dao.selectPurchaseList(map);
			
			return purchaseList;
		}

}
