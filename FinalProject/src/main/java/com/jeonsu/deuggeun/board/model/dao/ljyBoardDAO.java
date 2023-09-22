package com.jeonsu.deuggeun.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.BoardImage;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.board.model.dto.Routine;

@Repository
public class ljyBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 공유게시판 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCont(int boardCode) {
		return sqlSession.selectOne("shareBoardMapper.getShareBoardListCount", boardCode);
	}

	
	/** 공유게시판 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
	 * @param pagination
	 * @param boardCode
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("shareBoardMapper.selectShareBoardList", boardCode, rowBounds);
	}

	// 공유게시판 게시글 상세조회 
	public Board selectShareBoard(Map<String, Object> map) {
		return sqlSession.selectOne("shareBoardMapper.selectShareBoard", map);
	}

	// 공유게시판 좋아요 처리
	public int insertFreeBoardLike(Map<String, Integer> paramMap) {
		return sqlSession.insert("freeBoardMapper.insertFreeBoardLike", paramMap);
	}

	// 공유게시판 좋아요 추소(삭제)
	public int deleteFreeBoardLike(Map<String, Integer> paramMap) {
		return sqlSession.delete("freeBoardMapper.deleteFreeBoardLike", paramMap);
	}

	// 공유게시판 좋아요 조회
	public int countFreeBoardLike(Integer boardNo) {
		return sqlSession.selectOne("freeBoardMapper.countFreeBoardLike", boardNo);
	}

	// 공유게시판 좋아요 여부 확인
	public int freeBoardLikeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("freeBoardMapper.freeBoardLikeCheck", map);
	}

	// 게시글 삽입
	public int boardInsert(Board board) {
		int result = sqlSession.insert("shareBoardMapper.boardInsert", board);
		
		if(result > 0) result = board.getBoardNo();
		return result;
	}

	// 이미지 리스트 여러개 삽입
	public int insertImageList(List<BoardImage> uploadList) {
		return sqlSession.insert("shareBoardMapper.insertImageList", uploadList);
	}

	// 루틴 여러개 삽입 
	public int insertRoutineList(List<Routine> routines) {
		return sqlSession.insert("shareBoardMapper.insertRoutineList", routines);
	}


	/** DB이미지 파일 목록 조회
	 * @return list
	 */
	public List<String> selectImageList() {
		return sqlSession.selectList("boardMapper.selectImageListAll");
	}



	/** 조회수 증가 
	 * @param boardNo
	 * @return
	 */
	public int updateBoardReadCount(int boardNo) {
		return sqlSession.update("shareBoardMapper.updateBoardReadCount", boardNo);
	}

}
