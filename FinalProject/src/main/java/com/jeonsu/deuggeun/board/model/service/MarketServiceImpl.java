package com.jeonsu.deuggeun.board.model.service;

import com.jeonsu.deuggeun.board.model.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.board.model.dao.MarketDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MarketServiceImpl implements MarketService{
	private final MarketDAO dao;

	@Autowired	//	생성자 주입
	public MarketServiceImpl(MarketDAO dao) {
		this.dao = dao;
	}

	//    득근마켓 게시글 목록조회
	@Override
	public Map<String, Object> selectMarketList(int boardCode, int cp) {

		int listCount = dao.getListCount(boardCode);

		Pagination pagination = new Pagination(cp, listCount);

		List<Product> marketList = dao.selectMarketList(pagination, boardCode);

		// 4. pagination, marketList를  Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("marketList", marketList);

		System.out.println("marketList의 값 : " + marketList);

		return map;
	}

	// 검색했을때 게시글 목록
	@Override
	public Map<String, Object> selectMarketList(Map<String, Object> paramMap, int cp) {

		int listCount = dao.getListCount(paramMap);

		Pagination pagination = new Pagination(cp, listCount);

		List<Product> boardList = dao.selectMarketList(pagination, paramMap);

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}

	// 상품 게시글 상세조회
	@Override
	public Product selectProduct(Map<String, Object> map) {

		return dao.selectProduct(map);

	}

	// 상품 이미지 가져오기
	@Override
	public List<ProductImage> selectImageList(int productNo) {

		return dao.selectImageList(productNo);
	}

	// 리뷰 리스트 조회
	@Override
	public List<Review> selectReviewList(Map<String, Object> map) {
		return dao.selectReviewList(map);
	}

}
