package com.jeonsu.deuggeun.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
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

}
