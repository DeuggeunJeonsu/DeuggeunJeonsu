package com.jeonsu.deuggeun.member.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Cart;
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
	 * @param cp 
	 * @param cp 
	 * @return map
	 */
	Map<String, Object> selectFeedMember(int loginMemberNo, int memberNo, int cp);

	/** 마이페이지 팔로우 수 조회
	 * @param paramMap
	 * @return map
	 */
	Map<String, Object> selectFollowCount(Map<String, Object> paramMap);

	// 결제완료시 마이페이지 구매내역 페이지
	List<Cart> selectPurchaseList(int memberNo);

	/** 마이페이지 1:1 문의 목록 조회
	 * @param loginMember
	 * @return boardList
	 */
	Map<String, Object> selectMyUpdateList(Member loginMember);

	/** 마이페이지 1:1 문의 답변조회
	 * @param boardNo
	 * @return
	 */
	Board inquiryAnswer(int boardNo);

	/** 마이페이지 내 뱃지 페이지 이동 + 뱃지 목록 조회
	 * @param memberNo
	 * @return map
	 */
	Map<String, Object> selectBadgeList(int memberNo);

	/** 회원 탈퇴
	 * @param memberNo
	 * @param memberPw
	 * @return result
	 */
	int secession(int memberNo, String memberPw);

	
	/** 프로필 이미지 수정
	 * @param profileImage
	 * @param webPath
	 * @param filePath
	 * @param loginMember
	 * @return result
	 */
	int updateImage(MultipartFile profileImage, String webPath, String filePath, Member loginMember)throws IllegalStateException, IOException;

	/** 마이페이지 구매 내역 - selectbox 선택 시
	 * @param memberNo
	 * @param key
	 * @return purchaseList
	 * @throws Exception 
	 */
	List<Cart> selectPurchaseList(int memberNo, Map<String, Object> paramMap);

	
	
	/** 프로필 이미지 수정 
	 * @param profileImage
	 * @param webPath
	 * @param filePath
	 * @param loginMember
	 * @return
	 */
	int updateProfile(MultipartFile profileImage, String webPath, String filePath, Member loginMember)throws IllegalStateException, IOException;

	// 회원정보 수정 
	int updateInfo(Member updateMember);

	// 비밀번호 수정
	int changePw(String newPw, int memberNo);

}
