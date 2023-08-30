<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- marketDetail-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/market/marketDetail-style.css">

<!-- Font Awesome CDN 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H" crossorigin="anonymous">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div class="main-con">
            <div class="top-container">
                <div class="left-content">
                    <img src="/resources/images/market/test.jpeg" alt="" id="main-photo">
                </div>
                <div class="right-content">
                    <div id="title">스틸 그린 30서빙</div>
                    <hr>
                    <div id="amount"><h3>30,000원</h3></div>
                    <div class="right" id="text"><h3>다이어트? 면역력? 이 주스를 마셔봐, 스틸 그린</h3></div>
                    <div class="right">근피로 회복, 질좋은 수면, 고중량 훈련+다이어트 서포트 스틸 그린™은 신체의 항산화 시스템, 소화 기능 및 면역 건강을 지원하면서 자연스럽고 기분 좋은 에너지를 제공하도록 설계되었습니다. 수퍼 푸드 채소 이외에도 Steel Greens ™에는 최대 흡수를위한 DigeZyme® 소화 효소 및 LactoSpore® (Bacillus coagulans MTCC 5856)가 포함되어 있습니다.</div>
                    <div class="number-con">
                        <div class="number">
                            <div>수량</div>
                            <select name="selectNumber" id="select">
                                <option>   - [필수] 수량을 선택해 주세요 -</option>
                                <option value="1">1개</option>
                                <option value="2">2개</option>
                                <option value="3">3개</option>
                                <option value="3">4개</option>
                                <option value="3">5개</option>
                                <option value="3">- 최대 구매 수량 5개 -</option>
                            </select>
                        </div>
                        <div class="min">(최소주문수량 1개 이상)</div>
                    </div>
                    <div class="price">
                        <button type="submit" id="cart-btn" class="submit-btn">ADD TO CART</button>
                        <button type="submit" id="now-btn" class="submit-btn">BUY IT NOW</button>
                    </div>
                </div>
            </div>
            
            <div class="item-nav"></div>
            <div class="item-content"></div>
            <div class="notice"></div>
        </div>
        
        </section>
        <div class="page">
            페이지네이션 영역
        </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script src="/resources/js/main.js"></script>
</body>
</html>