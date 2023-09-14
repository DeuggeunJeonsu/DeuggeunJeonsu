package com.jeonsu.deuggeun.board.model.service;
import com.jeonsu.deuggeun.board.model.dto.Product;
import com.jeonsu.deuggeun.board.model.dto.ProductImage;
import com.jeonsu.deuggeun.board.model.dto.Review;

import java.util.List;
import java.util.Map;

public interface MarketService {


    // 득근마켓 게시글 목록조회
    Map<String, Object> selectMarketList(int boardCode, int cp);
//    Map<String, Object> selectBoardList(int boardCode, int cp);

    // 검색했을때 게시글 목록
    Map<String, Object> selectMarketList(Map<String, Object> paramMap, int cp);

    // 게시글 상세 조회
    Product selectProduct(Map<String, Object> map);

    // 게시글 상세 사진
    List<ProductImage> selectImageList(int productNo);

    // 리뷰 리스트 조회
    List<Review> selectReviewList(Map<String, Object> map);
}
