package com.jeonsu.deuggeun.board.model.dao;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MarketDAO {
	private final SqlSessionTemplate sqlSession;

	// 생성자 주입
	@Autowired
	public MarketDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 특정 게시판의 삭제되지 않은 게시글 수 조회
	public int getListCount(int boardCode) {

		return sqlSession.selectOne("marketMapper.getListCount", boardCode);
	}
//		public int getListCount(int boardCode) {
//		return sqlSession.selectOne("boardMapper.getListCount", boardCode);
//	}

	// 현재 페이지에 해당하는 부분에 대한 득근마켓 게시글 목록 조회
	public List<Board> selectMarketList(Pagination pagination, int boardCode) {

		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("marketMapper.selectMarketList", boardCode, rowBounds);
	}

//	public List<Board> selectBoardList(Pagination pagination, int boardCode)
//		// 1) offset 계산
//		int offset
//		= (pagination.getCurrentPage() -1) * pagination.getLimit();
//
//		// 2) RowBounds 객체 생성
//		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
//
//		// 3) selectList("namespace.id", 파라미터, RowBounds) 호출
//		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
//	}

	// 검색했을때 마켓 목록 수 조회
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("marketMapper.getListCount_search", paramMap);
	}

	// 검색 했을때 게시글 목록 조회
	public List<Board> selectMarketList(Pagination pagination, Map<String, Object> paramMap) {

		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectMarketList_search", paramMap, rowBounds);
	}
}
