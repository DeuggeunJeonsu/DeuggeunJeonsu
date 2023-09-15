package com.jeonsu.deuggeun.board.model.dao;

import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.board.model.dto.Product;
import com.jeonsu.deuggeun.board.model.dto.ProductImage;
import com.jeonsu.deuggeun.board.model.dto.Review;
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


	// 현재 페이지에 해당하는 부분에 대한 득근마켓 게시글 목록 조회
	public List<Product> selectMarketList(Pagination pagination, int boardCode) {

		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("marketMapper.selectMarketList", boardCode, rowBounds);
	}


	// 검색했을때 마켓 목록 수 조회
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("marketMapper.getListCount_search", paramMap);
	}

	// 검색 했을때 게시글 목록 조회
	public List<Product> selectMarketList(Pagination pagination, Map<String, Object> paramMap) {

		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectMarketList_search", paramMap, rowBounds);
	}

	// 상품 게시글 상세조회
	public Product selectProduct(Map<String, Object> map) {

		return sqlSession.selectOne("marketMapper.selectProduct", map);
	}

	// 상품 상세 사진 가져오기
	public List<ProductImage> selectImageList(int productNo) {
		return sqlSession.selectList("marketMapper.selectImageList", productNo);
	}

	// 리뷰 작성 + 사진첨부
	public int reviewInsert(Review review) {

		int result =  sqlSession.insert("marketMapper.reviewInsert", review);

		if(result>0) result = review.getReviewNo();

		return result;

	}

	// 리뷰 사진 없을때
	public int reviewInsert2(Review review) {

		int result =  sqlSession.insert("marketMapper.reviewInsert2", review);

		if(result>0) result = review.getReviewNo();

		return result;
	}

	// 리뷰게시판 삭제되지 않은 게시글 목록
	public int getReviewListCount(int boardCode) {
		return sqlSession.selectOne("marketMapper.getReviewListCount", boardCode);
	}

	public List<Review> selectReview(Pagination pagination, Map<String, Object> params) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("marketMapper.selectReview", params, rowBounds);
	}

	public Review selectReviewDetail(Map<String, Object> map) {

		return sqlSession.selectOne("marketMapper.selectReviewDetail", map);
	}

	public int updateReadCount(int reviewNo) {

		return sqlSession.update("marketMapper.updateReadCount", reviewNo);
	}
}
