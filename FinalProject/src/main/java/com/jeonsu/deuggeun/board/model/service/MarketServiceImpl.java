package com.jeonsu.deuggeun.board.model.service;

import com.jeonsu.deuggeun.board.model.dto.*;
import com.jeonsu.deuggeun.common.utility.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.board.model.dao.MarketDAO;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
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
//
//	// 리뷰 리스트 조회
//	@Override
//	public List<Review> selectReviewList(Map<String, Object> map, int boardCode, int cp) {
//
//		int listCount = dao.getReviewListCount(boardCode);
//
//		Pagination pagination = new Pagination(cp, listCount);
//
//		map.put("pagination", pagination);
//
//		return dao.selectReviewList(pagination, map);
//
//	}

	// 리뷰 게시글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reviewInsert(int boardCode, int productNo, Review review, MultipartFile image, String webPath, String filePath) throws IOException {

		// 리뷰 정보 저장

			review.setUploadImage(webPath);

			String fileName = image.getOriginalFilename();

			// 이미지 업로드 및 경로 저장
			String originalFilename = image.getOriginalFilename();
			String savedFilename = Util.fileRename(originalFilename);

			File uploadFile = new File(filePath, savedFilename);
			image.transferTo(uploadFile);

			// 리뷰 테이블에 이미지 경로 업데이트
			review.setReviewNo(review.getReviewNo());

			review.setUploadImage(webPath + savedFilename);

			int result = dao.reviewInsert(review);


//			dao.updateReviewImage(review);
//		int result = dao.reviewInsert(review);
//
//		if (result > 0 && image != null) {
//
//			System.out.println("두번째 사진if문 실행");
//
//			review.setUploadImage(webPath);
//
//			String fileName = image.getOriginalFilename();
//
//			// 이미지 업로드 및 경로 저장
//			String originalFilename = image.getOriginalFilename();
//			String savedFilename = Util.fileRename(originalFilename);
//
//			System.out.println("filePath : " + filePath);
//			System.out.println("saveFilename : " + savedFilename);
//
//			File uploadFile = new File(filePath, savedFilename);
//			image.transferTo(uploadFile);
//
//			System.out.println("upload 파일명" + uploadFile);
//			System.out.println(webPath);
//
//			// 리뷰 테이블에 이미지 경로 업데이트
//			review.setReviewNo(review.getReviewNo());
//			System.out.println("webPAth + save명 : " + webPath + savedFilename);
//			review.setUploadImage(webPath + savedFilename);
//
//			dao.updateReviewImage(review);

		return result;
	}

	@Override
	public Map<String, Object> selectReview(int boardCode, int cp, int productNo) {

		int listCount = dao.getReviewListCount(boardCode);

		Pagination pagination = new Pagination(cp, listCount);

		Map<String, Object> params = new HashMap<>();

		params.put("boardCode", boardCode);
		params.put("productNo", productNo);

		List<Review> rList = dao.selectReview(pagination, params);

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("rList", rList);
		System.out.println(rList);
		return map;

	}

//	@Override
//	public Map<String, Object> selectReview(int productNo, int cp) {
//
//		int listCount = dao.getListCount(productNo);
//
//		Pagination pagination = new Pagination(cp, listCount);
//
//		List<Review> rList = dao.selectReview(pagination, productNo);
//
//		Map<String, Object> map = new HashMap<>();
//
//		map.put("pagination", pagination);
//		map.put("rList", rList);
//
//		return map;
//	}


}