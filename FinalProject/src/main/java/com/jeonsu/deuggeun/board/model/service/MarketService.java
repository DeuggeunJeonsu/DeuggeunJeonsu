package com.jeonsu.deuggeun.board.model.service;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.Map;

public interface MarketService {


    // 득근마켓 게시글 목록조회
    Map<String, Object> selectMarketList(int boardCode, int cp);

    // 검색했을때 게시글 목록
    Map<String, Object> selectMarketList(Map<String, Object> paramMap, int cp);
}
