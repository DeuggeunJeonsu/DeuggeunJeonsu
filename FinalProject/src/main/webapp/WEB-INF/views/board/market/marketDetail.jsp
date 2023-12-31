<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="product" value="${product}" />
<c:set var="productImageList" value="${productImageList}" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketDetail-style.css 연결 --%>
            <link rel="stylesheet" href="/resources/css/board/market/marketDetail-style.css">
            <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
            <script>
                Kakao.init('5600ed391bce28878bbfdfcae636db6e'); // 사용하려는 앱의 JavaScript 키 입력
            </script>

            <!-- Font Awesome CDN 추가 -->
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                crossorigin="anonymous">
                <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
                <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
                <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
                <link rel="icon" href="/resources/images/favicon_io/favicon.ico" type="image/x-icon">

            <!-- SweetAlert2 CSS 파일 추가 -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

            <!-- SweetAlert2 JavaScript 파일 추가 -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <!-- Fixed 스크롤 탑 -->
            <a href="#" class="scroll-top-btn">
                <i class="fas fa-arrow-up"></i>
            </a>

            <section id="main-container">
                <div class="main-con">
                    <div class="place"></div>
                    <div class="top-container">
                        <div class="left-content">
                            <img src="${product.productImg}" id="main-photo">
                        </div>
                        <div class="right-content">
                            <div class="kakao">
                            <div id="title">${product.productTitle}</div>
                                <c:if test="${!empty loginMember}">
                                <button id="kakao-share-btn" onclick="shareMessage()">
                                    <img id="kakao-logo" src="/resources/images/main/kakao.png">
                                    &nbsp;카카오톡 공유하기
                                </button>
                                </c:if>
                            </div>

                            <hr>
                            <div id="amount">
                                <h3>판매가 : <fmt:formatNumber type="number" value="${product.productPrice}" pattern="#,###원" /></h3>
                            </div>
                            <div class="right" id="text">
                                <h3>${product.productContent}</h3>
                            </div>
                            <div class="right">${product.subTitle}</div>
                            <div class="number-con">
                                <div class="number">
                                    <div class="count">수량</div>
                                    <select name="selectNumber" id="select">
                                        <option> - [필수] 수량을 선택해 주세요 -</option>
                                        <option value="1">1개</option>
                                        <option value="2">2개</option>
                                        <option value="3">3개</option>
                                        <option value="4">4개</option>
                                        <option value="5">5개</option>
                                        <option value="0">- 최대 구매 수량 5개 -</option>
                                    </select>
                                </div>
                                <div class="min">(최소주문수량 1개 이상)</div>
                            </div>
                            <div class="price">
                                <button type="submit" id="cart-btn" class="submit-btn">ADD TO CART</button>
                                <button type="button" id="now-btn" class="submit-btn">BUY IT NOW</button>
                            </div>
                        </div>
                    </div>
                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <ul class="item-nav">
                        <li>
                            <a href="/board/${boardCode}/detail/${productNo}">상품정보</a>
                        </li>
                        <li>
                            <a href="/board/${boardCode}/review/${product.productNo}" id="reviewList">Review</a>
                        </li>
                        <li>
                            <a href="/board/${boardCode}/inquire/${product.productNo}">상품문의</a>
                        </li>
                    </ul>

                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">
                    <!-- 상품 상세 -->

                    <div class="item-content">
                        <c:forEach var="productImg" items="${productImageList}">
                            <div><img src="${productImg.productImg}" class="itemDetail"></div>
                            <br>
                        </c:forEach>
                    </div>

                    <div class="notice">
                        <ul>
                            <li class="title">제품명</li>
                            <li>${product.productName}</li>
                        </ul>
                        <ul>
                            <li class="title">제품유형</li>
                            <li>${product.productType}</li>
                        </ul>

                        <ul>
                            <li class="title">내용량</li>
                            <li>${product.productContain}</li>
                        </ul>
                        <ul>
                            <li class="title">원료 및 함량</li>
                            <li>${product.productMaterial}</li>
                        </ul>
                        <ul>
                            <li class="title">섭취방법</li>
                            <li>${product.productIntake}</li>
                        </ul>

                        <ul>
                            <li class="title">배송정보</li>
                            <li>- 배송 방법 : CJ대한통운 <br>
                                - 배송 지역 : 전국 <br>
                                - 배송 기간 : 2일 ~ 3일(단, 공휴일, 기념일 등 제외) <br>
                                - 배송 안내 : · 당일 오후 1시 주문 건에 한하여 당일 발송되며, 1시 이후에는 주문취소 불가(사전예약, 타임특가 및
                                냉동/신선 제품의 경우 상세페이지 주문 마감시간 확인)· 도서, 산간 오지 등 교통이 불편한 지역은 지역에 따라 2~3일 추가 소요· 추석, 설, 연말연시,
                                접수 물량이 많은 경우에 1~2일 지연될 수 있음· 군부대(사서함)주소의 경우 배송이 불가능할 수 있음
                            </li>
                        </ul>
                    </div>


                </div>
                <button id="myButton" style="display: none;">스크롤 버튼</button>
                <div class="place"></div>


            </section>

            <script>

                const productName = "${product.productName}";
                const productTitle = "${product.productTitle}";
                const productContent = "${product.productContent}";
                const productNo = "${product.productNo}";
                const productPrice = "${product.productPrice}";
                const loginMemberNo = "${loginMember.memberNo}";
                const boardCode = "${boardCode}";
                const productImg = "${product.productImg}";
                console.log(productImg);

            </script>

            <!-- jQuery 라이브러리 추가 -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <script src="/resources/js/market/marketDetail.js"></script>

        </body>

        </html>