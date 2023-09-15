package com.jeonsu.deuggeun.board.model.service;
import com.jeonsu.deuggeun.board.model.dto.Product;
import com.jeonsu.deuggeun.board.model.dto.ProductImage;
import com.jeonsu.deuggeun.board.model.dto.Review;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    // 리뷰 작성
    int reviewInsert(int boardCode, int productNo, Review review, MultipartFile image, String webPath, String filePath) throws IOException;

    Map<String, Object> selectReview(int boardCode, int cp, int productNo);


//    Map<String, Object> selectReview(int productNo, int cp);
}
