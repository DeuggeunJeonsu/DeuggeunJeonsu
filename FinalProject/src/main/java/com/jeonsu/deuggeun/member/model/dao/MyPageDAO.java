package com.jeonsu.deuggeun.member.model.dao;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.board.model.dto.Cart;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.member.model.dto.Badge;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 마이페이지 내 게시글 수 조회
	 * @return
	 */
	public int getListCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getMyPageListCount", memberNo);
	}

	/** 마이페이지 내 게시글 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	public List<Board> selectBoardList(int memberNo, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectMyPageBoardList", memberNo, rowBounds);
	}

	/** 마이페이지 팔로잉 수 조회
	 * @param memberNo
	 * @return followingTotalCount
	 */
	public int getFollowingTotalCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getFollowingTotalCount", memberNo);
	}
	
	/** 마이페이지 팔로잉 목록 조회
	 * @param memberNo
	 * @return followingList
	 */
	public List<Member> selectFollowingList(int memberNo) {
		return sqlSession.selectList("myPageMapper.selectFollowingList", memberNo);
	}

	/** 마이페이지 팔로워 수 조회
	 * @param memberNo
	 * @return followerTotalCount
	 */
	public int getFollowerTotalCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getFollowerTotalCount", memberNo);
	}

	/** 마이페이지 팔로워 목록 조회
	 * @param memberNo
	 * @return followerList
	 */
	public List<Member> selectFollowerList(int memberNo) {
		return sqlSession.selectList("myPageMapper.selectFollowerList", memberNo);
	}

	/** 마이페이지 언팔로우
	 * @param paramMap
	 * @return map
	 */
	public int unfollow(Map<String, Object> paramMap) {
		return sqlSession.delete("freeBoardMapper.memberUnfollow", paramMap);
	}

	/** 마이페이지 팔로우
	 * @param paramMap
	 * @return map
	 */
	public int follow(Map<String, Object> paramMap) {
		return sqlSession.insert("freeBoardMapper.memberFollow", paramMap);
	}

	/** 마이페이지 멤버 피드 조회
	 * @param memberNo
	 * @param loginMemberNo
	 * @return map
	 */
	public Member selectFeedMember(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectFeedMember", memberNo);
	}

	/** 로그인한 회원이 피드 주인을 팔로우했는지 확인하기
	 * @param memberNoMap
	 * @return result
	 */
	public int feedFollowCheck(Map<String, Object> memberNoMap) {
		return sqlSession.selectOne("myPageMapper.feedFollowCheck", memberNoMap);
	}
	
	/** 피드 주인의 게시글 수 조회
	 * @param memberNo
	 * @return listCount
	 */
	public int getBoardCount(int memberNo) {
		return sqlSession.selectOne("freeBoardMapper.getBoardCount", memberNo);
	}

	/** 피드 주인의 게시글 목록 조회
	 * @param pagination 
	 * @param memberNo
	 * @return boardList
	 */
	public List<Board> selectFeedBoardList(Pagination pagination, int memberNo) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("freeBoardMapper.selectFeedBoardList", memberNo, rowBounds);
	}

	/** 비밀번호 조회
	 * @param memberNo
	 * @return encPw
	 */
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo);
	}
	
	/** 1:1 문의 목록 조회
	 * @param loginMember
	 * @return
	 */
	public List<Board> selectMyUpdateList(Member loginMember) {
		return sqlSession.selectList("myPageMapper.selectMyUpdateList", loginMember);
	}

	// 결제 완료시 구매내역 페이지
	public List<Cart> selectPurchaseList(int memberNo) {
		return sqlSession.selectList("marketMapper.selectPurchaseList", memberNo);
	}

	/** 문의글 답변 내용 조회를 위한 게시글 번호 조회 
	 * @param boardNo
	 * @return boardNo
	 */
	public int selectAdminBoardNo(int boardNo) {
		System.out.println(boardNo + " ???다오");
		return sqlSession.selectOne("myPageMapper.selectAdminBoardNo", boardNo);
	}
	
	/** 마이페이지 1:1 답변조회
	 * @param boardNo
	 * @return 
	 */
	public Board inquiryAnswer(Board board) {
		return sqlSession.selectOne("myPageMapper.inquiryAnswer", board);
	}

	/** 마이페이지 뱃지 전체 목록 조회
	 * @return badgeListAll
	 */
	public List<Badge> selectBadgeListAll() {
		return sqlSession.selectList("myPageMapper.selectBadgeListAll");
	}

	/** 마이페이지 로그인한 회원의 뱃지 목록 조회
	 * @param memberNo
	 * @return myBadgeList
	 */
	public List<Badge> selectBadgeList(int memberNo) {
		return sqlSession.selectList("myPageMapper.selectBadgeList", memberNo);
	}

	/** 마이페이지 로그인한 회원의 뱃지 수 조회
	 * @param memberNo
	 * @return badgeCount
	 */
	public int getBadgeCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.getBadgeCount", memberNo);
	}

    /** 회원 탈퇴
	 * @param memberNo
	 * @return result
	 */
//	public int secession(int memberNo) {
//		return sqlSession.update("myPageMapper.secession", memberNo);
//	}
	
}
