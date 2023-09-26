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
public class MarketServiceImpl implements MarketService {
	private final MarketDAO dao;

	@Autowired    //	생성자 주입
	public MarketServiceImpl(MarketDAO dao) {
		this.dao = dao;
	}

	//    득근마켓 게시글 목록조회
	@Override
	public Map<String, Object> selectMarketList(int boardCode, int cp, String sort) {

		int listCount = dao.getListCount(boardCode);
		Pagination pagination = new Pagination(cp, listCount);

//		List<Product> marketList = dao.selectMarketList(pagination, boardCode);
		List<Product> marketList = null;

		if ("n".equals(sort)) {
			marketList = dao.selectMarketList(pagination, boardCode); // 신상품 우선으로 조회
		} else if ("l".equals(sort)) {
			marketList = dao.selectMarketListByLowPrice(pagination, boardCode); // 낮은 가격 우선으로 조회
		} else if ("h".equals(sort)) {
			marketList = dao.selectMarketListByHighPrice(pagination, boardCode); // 높은 가격 우선으로 조회
		} else if ("b".equals(sort)) {
			marketList = dao.selectMarketListByReview(pagination, boardCode); // 후기 많은순
		}
		else {
			marketList = dao.selectMarketList(pagination, boardCode);
		}
		// 4. pagination, marketList를  Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("marketList", marketList);

		return map;
	}

	// 검색했을때 게시글 목록
	@Override
	public Map<String, Object> selectMarketList(Map<String, Object> paramMap, int cp) {

		int listCount = dao.getListCount(paramMap);

		Pagination pagination = new Pagination(cp, listCount);

		List<Product> marketList = dao.selectMarketList(pagination, paramMap);

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("marketList", marketList);

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

	// 리뷰 게시글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reviewInsert(int boardCode, int productNo, Review review, MultipartFile image, String webPath, String filePath) throws IOException {

		int reviewNo = review.getReviewNo();

		if (image.isEmpty()) {

			reviewNo = dao.reviewInsert2(review);

		} else {
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

			// 리뷰 정보 저장
			reviewNo = dao.reviewInsert(review); // 이미지가 있는 경우 dao.reviewInsert 호출
		}

		return reviewNo;
	}

	// 리뷰 목록 조회
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
		return map;

	}

	@Override
	public Review selectReviewDetail(Map<String, Object> map) {

		int result = dao.updateCount(map);
		if (result > 0) {
			return dao.selectReviewDetail(map);
		} else {
			return null;
		}
	}


	// 조회 수 증가 서비스
	@Transactional
	@Override
	public int updateReadCount(int reviewNo) {
		return dao.updateReadCount(reviewNo);
	}

	// 리뷰 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reviewUpdate(Review review, MultipartFile image, String webPath, String filePath) throws IllegalStateException, IOException {

		// 1. 리뷰 제목/내용 수정 (XSS 방지 처리)
		review.setReviewTitle(Util.XSSHandling(review.getReviewTitle()));
		review.setReviewContent(Util.XSSHandling(review.getReviewContent()));


		// 2. 리뷰 업데이트
		int rowCount = dao.reviewUpdate(review);

		// 3. 업데이트 성공 시 이미지 관련 작업
		if (rowCount > 0) {

			if ("null".equals(review.getUploadImage())) {
				rowCount = dao.updateImagePath2(review);
			} else if (image.getSize() > 0) {
				// 이미지 원본명과 저장될 이름을 얻어옴
				String originalFilename = image.getOriginalFilename();
				String savedFilename = Util.fileRename(originalFilename);

				// 서버에 파일 저장
				File uploadFile = new File(filePath, savedFilename);
				image.transferTo(uploadFile);

				// 리뷰 객체에 이미지 웹 경로 설정
				review.setUploadImage(webPath + savedFilename);

				// DB에 이미지 경로 업데이트 (선택적)
				rowCount = dao.updateImagePath(review);
			}
		}
		return rowCount;
	}

	// 리뷰 삭제
	@Override
	public int reviewDelete(Map<String, Object> map) {

		int result = dao.reviewDelete(map);

		return result;
	}

	// 상품 문의 목록조회
	@Override
	public Map<String, Object> selectInquiry(int boardCode, int cp, int productNo) {

		int listCount = dao.getInquiryListCount(boardCode);
		Pagination pagination = new Pagination(cp, listCount);

		Map<String, Object> params = new HashMap<>();

		params.put("boardCode", boardCode);
		params.put("productNo", productNo);

		List<Inquiry> iList = dao.selectInquiry(pagination, params);

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("iList", iList);

		return map;

	}

	// 상품문의 상세페이지
	@Override
	public Inquiry selectInquiryDetail(Map<String, Object> map) {
		return dao.selectInquiryDetail(map);
	}

	// 상품문의 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int inquiryInsert(int boardCode, int productNo, Inquiry inquiry, MultipartFile image, String webPath, String filePath) throws IOException {

		int inquiryNo = inquiry.getInquiryNo();

		if (image.isEmpty()) {

			inquiryNo = dao.inquiryInsert2(inquiry);

		} else {
			inquiry.setUploadImage(webPath);

			String fileName = image.getOriginalFilename();

			// 이미지 업로드 및 경로 저장
			String originalFilename = image.getOriginalFilename();
			String savedFilename = Util.fileRename(originalFilename);

			File uploadFile = new File(filePath, savedFilename);
			image.transferTo(uploadFile);

			// 문의 테이블에 이미지 경로 업데이트
			inquiry.setInquiryNo(inquiry.getInquiryNo());
			inquiry.setUploadImage(webPath + savedFilename);

			// 문의 정보 저장
			inquiryNo = dao.inquiryInsert(inquiry); // 이미지가 있는 경우
		}

		return inquiryNo;
	}

	// 상품문의 게시글 삭제
	@Override
	public int inquiryDelete(Map<String, Object> map) {
		int result = dao.inquiryDelete(map);

		return result;
	}

	// 상품문의 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int inquiryUpdate(Inquiry inquiry, MultipartFile image, String webPath, String filePath) throws IOException {
		// 1. 리뷰 제목/내용 수정 (XSS 방지 처리)
		inquiry.setInquiryTitle(Util.XSSHandling(inquiry.getInquiryTitle()));
		inquiry.setInquiryContent(Util.XSSHandling(inquiry.getInquiryContent()));

		// 2. 리뷰 업데이트
		int rowCount = dao.inquiryUpdate(inquiry);
		// 3. 업데이트 성공 시 이미지 관련 작업
		if (rowCount > 0) {

			if ("null".equals(inquiry.getUploadImage())) {
				rowCount = dao.updateImagePath4(inquiry);

			} else if (image.getSize() > 0) {

				// 이미지 원본명과 저장될 이름을 얻어옴
				String originalFilename = image.getOriginalFilename();
				String savedFilename = Util.fileRename(originalFilename);

				// 서버에 파일 저장
				File uploadFile = new File(filePath, savedFilename);
				image.transferTo(uploadFile);

				// 리뷰 객체에 이미지 웹 경로 설정
				inquiry.setUploadImage(webPath + savedFilename);

				// DB에 이미지 경로 업데이트 (선택적)
				rowCount = dao.updateImagePath3(inquiry);
			}
		}
		return rowCount;

	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int addToCart(Cart cart) {
		Cart cartForQuery = new Cart();
		cartForQuery.setMemberNo(cart.getMemberNo());
		cartForQuery.setProductNo(cart.getProductNo());

		// 1. 먼저, 장바구니에 상품이 있는지 확인합니다.
		Cart existingCartItem = dao.getCartItem(cartForQuery);

		if (existingCartItem != null) {
			// 이미 장바구니에 있는 경우

			// 2. 상품이 이미 장바구니에 있는 경우, 수량을 업데이트합니다.
			int updatedQuantity = existingCartItem.getQuantity() + cart.getQuantity();

			// 5개 이상인 경우 추가하지 않고 에러 메시지 반환
			if (updatedQuantity > 5) {
				return -2; // 5개 이상 구매 불가
			}

			existingCartItem.setQuantity(updatedQuantity);

			// 3. 총 금액을 업데이트
			int updateTotal = updatedQuantity * cart.getProductPrice();
			existingCartItem.setTotal(updateTotal);

			// 상품 번호를 가져옵니다.
			int productNo = existingCartItem.getProductNo();

			// 상품 번호와 업데이트된 수량, 총 금액을 이용하여 업데이트
			int result = dao.updateCart(existingCartItem);

			if (result > 0) {
				return result;
			} else {
				return -1; // 업데이트 실패
			}
		} else {
			// 장바구니에 없는 경우

			// 4. 상품이 장바구니에 없는 경우, 새로운 레코드를 추가합니다.
			int result = dao.addToCart(cart);

			if (result > 0) {
				return result;
			} else {
				return -1; // 추가 실패
			}
		}
	}

	// 장바구니 페이지 조회
	@Override
	public List<Cart> selectCart(Map<String, Object> map) {


		return dao.selectCart(map);
	}

	// 장바구니 선택 항목 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int removeFromCart(Map<String, Object> map) {
		return dao.removeFromCart(map);
	}

	// 결제성공 시 주문 테이블 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertOrder(Order order) {

		int result = 0;
		result = dao.insertOrder(order);

		if (result > 0) {  // 주문 데이터 삽입 성공
			order.setMemberNo(order.getMemberNo());
			result = dao.afterOrder(order);

			if (result > 0) {  // 주문 업데이트 성공

				// 카트 업데이트 로직
				Cart cart = new Cart();
				cart.setMemberNo(order.getMemberNo());
				cart.setOrderNo(order.getOrderNo());

				result = dao.afterUpdateCart(cart);

				if (result > 0) {
					result = cart.getOrderNo();
				} else {
					System.out.println("카트 업데이트 실패");
				}
			} else {
				System.out.println("주문 업데이트 실패");
			}
		}

		return result;
	}

	// 리뷰 작성시 회원의 구매내역 확인
	@Override
	public List<Cart> checkPurchase(Map<String, Object> map) {

		return dao.checkPurchase(map);
	}

	// 바로 구매하기 버튼
	@Override
	public int buyItNow(Cart cart) {
		Cart cartForQuery = new Cart();
		cartForQuery.setMemberNo(cart.getMemberNo());
		cartForQuery.setProductNo(cart.getProductNo());

		// 1. 먼저, 장바구니에 상품이 있는지 확인합니다.
		Cart existingCartItem = dao.getCartItem(cartForQuery);

		if (existingCartItem != null) {
			// 이미 장바구니에 있는 경우

			// 2. 상품이 이미 장바구니에 있는 경우, 수량을 업데이트합니다.
			int updatedQuantity = existingCartItem.getQuantity() + cart.getQuantity();

			// 5개 이상인 경우 추가하지 않고 에러 메시지 반환
			if (updatedQuantity > 5) {
				return -2; // 5개 이상 구매 불가
			}

			existingCartItem.setQuantity(updatedQuantity);

			// 3. 총 금액을 업데이트
			int updateTotal = updatedQuantity * cart.getProductPrice();
			existingCartItem.setTotal(updateTotal);

			// 상품 번호를 가져옵니다.
			int productNo = existingCartItem.getProductNo();

			// 상품 번호와 업데이트된 수량, 총 금액을 이용하여 업데이트
			int result = dao.updateCart(existingCartItem);

			if (result > 0) {
				return result;
			} else {
				return -1; // 업데이트 실패
			}
		} else {
			// 장바구니에 없는 경우
			// 4. 상품이 장바구니에 없는 경우, 새로운 레코드를 추가합니다.
			int result = dao.buyItNow(cart);
			if (result > 0) {
				return result;
			} else {
				return -1; // 추가 실패
			}
		}

	}

	// 결제 완료 페이지
	@Override
	public List<Order> selectOrderList(int orderNo) {
		return dao.selectOrderList(orderNo);
	}

	// 자동완성 기능
	@Override
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap) {
		return dao.autocomplete(paramMap);
	}
}