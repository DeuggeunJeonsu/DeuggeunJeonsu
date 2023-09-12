package com.jeonsu.deuggeun.board.model.service;

import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.board.model.dto.Pagination;
import com.jeonsu.deuggeun.board.model.dto.Product;
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

		List<Board> marketList = dao.selectMarketList(pagination, boardCode);

		// 4. pagination, boardList를  Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("marketList", marketList);

		return map;
	}

	@Override
	public Map<String, Object> selectMarketList(Map<String, Object> paramMap, int cp) {

		int listCount = dao.getListCount(paramMap);

		Pagination pagination = new Pagination(cp, listCount);

		List<Board> boardList = dao.selectMarketList(pagination, paramMap);

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}
}
