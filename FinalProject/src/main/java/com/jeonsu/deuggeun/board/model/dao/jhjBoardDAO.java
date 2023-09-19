package com.jeonsu.deuggeun.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;

@Repository
public class jhjBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 공지사항 게시글 삽입
	 * @param board
	 * @return result
	 */
	public int ncInsert(Board board) {
		return sqlSession.insert("boardMapper.ncInsert", board);
	}

	/** 공지사항 목록 조회
	 * @param pagination 
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectNcBoardList(Pagination pagination, int boardCode) {
		
		
		 int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		 
		 RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		 
		 return sqlSession.selectList("boardMapper.selectNcBoardList", boardCode,rowBounds );
		
	}

	/** 공지사항 삭제되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return
	 */
	
	  public int getListCount(int boardCode) {
	 
	 return sqlSession.selectOne("boardMapper.getListCount", boardCode);
	 }

	  
	/** 공지사항 삭제되지 않은 게시글 수 조회(검색)
	 * @param boardMap
	 * @return
	 */
	public int getListCount(Map<String, Object> boardMap) {
		return sqlSession.selectOne("boardMapper.listCountSearch" , boardMap);
	}

	public List<Board> selectNcBoardList(Pagination pagination, Map<String, Object> boardMap) {
		
		int offset
		= (pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		
		return sqlSession.selectList("boardMapper.selectNcBoardTitle_search", boardMap, rowBounds);
	}

	/** 공지사항 게시글 상세조회
	 * @param map
	 * @return
	 */
	public Board selectNcBoardDetail(Map map) {
		
		return sqlSession.selectOne("boardMapper.selectNcBoardDetail", map);
	}

	/** 게시글 수정
	 * @param board
	 * @return
	 */
	public int ncUpdate(Board board) {
		
		return sqlSession.update("boardMapper.ncUpdate", board);
	}

	/** 공지사항 게시글 수정을 위한 게시글 조회
	 * @param map
	 * @return 
	 */
	public Board ncUpdateSelect(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.ncUpdateSelect", map);
	}

	/** 공지사항 게시글 삭제
	 * @param board
	 * @return
	 */
	public int ncDelete(Board board) {
		return sqlSession.update("boardMapper.ncDelete", board);
	}

	/** 1:1 문의글 작성
	 * @param board
	 * @return result
	 */
	public int QnaWriteInsert(Board board) {
		return sqlSession.insert("boardMapper.QnaWriteInsert" , board);
	}

	/** 문의 테이블 데이터 삽입을 위한 boardNo 조회
	 * @param board
	 * @return boardNo
	 */
		public int selectInquiryBoardNo(int memberNo) {
	    return sqlSession.selectOne("boardMapper.selectInquiryBoardNo", memberNo);
	}

	/** 문의 테이블 데이터 삽입
	 * @param board
	 * @return result
	 */
	public int insertInquiry(Board board) {
		
		return sqlSession.insert("boardMapper.insertInquiry", board);
	}
	 
}
