package com.jeonsu.deuggeun.member.model.service;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.member.model.dto.Member;

public interface MyPageService {

	/** 마이페이지 내 게시글 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMyBoardList(int memberNo, int cp);

	/** 마이페이지 팔로잉 목록 조회
	 * @param memberNo
	 * @return map
	 */
	Map<String, Object> selectFollowingList(int memberNo);

	/** 마이페이지 팔로워 목록 조회
	 * @param memberNo
	 * @return map
	 */
	Map<String, Object> selectFollowerList(int memberNo);

	/** 마이페이지 언팔로우
	 * @param paramMap
	 * @return result
	 */
	int unfollow(Map<String, Object> paramMap);

	/** 마이페이지 팔로우
	 * @param paramMap
	 * @return result
	 */
	int follow(Map<String, Object> paramMap);

	/** 마이페이지 멤버 피드 조회
	 * @param memberNo
	 * @return map
	 */
	Map<String, Object> selectFeedMember(int loginMemberNo, int memberNo);

}
