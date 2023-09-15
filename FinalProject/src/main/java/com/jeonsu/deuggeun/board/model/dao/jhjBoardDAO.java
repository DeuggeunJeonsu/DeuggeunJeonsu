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
	 
}
