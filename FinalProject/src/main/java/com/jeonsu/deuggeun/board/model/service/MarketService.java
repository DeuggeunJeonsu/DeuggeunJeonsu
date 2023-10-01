package com.jeonsu.deuggeun.board.model.service;
import com.jeonsu.deuggeun.board.model.dto.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface MarketService {


    // 득근마켓 게시글 목록조회
    Map<String, Object> selectMarketList(int boardCode, int cp, String sort);

    // 검색했을때 게시글 목록
    Map<String, Object> selectMarketList(Map<String, Object> paramMap, int cp);

    // 게시글 상세 조회
    Product selectProduct(Map<String, Object> map);

    // 게시글 상세 사진
    List<ProductImage> selectImageList(int productNo);

    // 리뷰 목록 조회
    Map<String, Object> selectReview(int boardCode, int cp, int productNo);

    // 리뷰 작성
    int reviewInsert(int boardCode, int productNo, Review review, MultipartFile image, String webPath, String filePath) throws IOException;

    // 리뷰 상세 페이지
    Review selectReviewDetail(Map<String, Object> map);

    // * 조회 수 증가 서비스
    int updateReadCount(Map<String, Object> readMap);

    // 리뷰 수정
    int reviewUpdate(Review review, MultipartFile image, String webPath, String filePath) throws IOException;

    // 리뷰 삭제
    int reviewDelete(Map<String, Object> map);

    // 상품문의 페이지 목록조회
    Map<String, Object> selectInquiry(int boardCode, int cp, int productNo);

    // 상품문의 상세페이지
    Inquiry selectInquiryDetail(Map<String, Object> map);

    // 상품문의 글 작성
    int inquiryInsert(int boardCode, int productNo, Inquiry inquiry, MultipartFile image, String webPath, String filePath) throws IOException;

    // 상품문의 삭제
    int inquiryDelete(Map<String, Object> map);

    // 상품문의 수정
    int inquiryUpdate(Inquiry inquiry, MultipartFile image, String webPath, String filePath) throws IOException;

    // 장바구니 상품담기
    int addToCart(Cart cart);

    // 장바구니 페이지 조회
    List<Cart> selectCart(Map<String, Object> map);

    // 장바구니 선택 항목 삭제
    int removeFromCart(Map<String, Object> map);

    // 주문 데이터 등록
    int insertOrder(Order order);

    // 리뷰 작성시 구매내역 확인
    List<Cart> checkPurchase(Map<String, Object> map);

    // 바로 구매 하기
    int buyItNow(Cart cart);

    // 구매완료 페이지
    List<Order> selectOrderList(int orderNo);

    // 자동완성 기능
    List<Map<String, Object>> autocomplete(Map<String, Object> paramMap) throws Exception;

    // 전체검색 기능
    Map<String, Object> searchAll(Map<String, Object> paramMap);

    // 전체검색에서 상품 영역
    Map<String, Object> searchProduct(Map<String, Object> paramMap);


}
