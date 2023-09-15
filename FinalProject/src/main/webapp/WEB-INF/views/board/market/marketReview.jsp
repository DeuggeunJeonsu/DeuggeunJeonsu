<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="product" value="${product}" />
<c:set var="productImageList" value="${productImageList}" />
<%--<c:set var="reviewList" value="${reviewList}" />--%>

<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map2.pagination}" />
<c:set var="rList" value="${map2.rList}" />

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketReview-style.css 연결 --%>
            <link rel="stylesheet" href="/resources/css/board/market/marketReview-style.css">
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
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div class="main-con">
                    <div class="place"></div>
                    <div class="top-container">
                        <div class="left-content">
                            <img src="${product.productImg}" id="main-photo">
                        </div>
                        <%--                        <p>Image Path: ${product.pImagePath}</p>--%>
                        <div class="right-content">
                            <div id="title">${product.productTitle}</div>
                            <hr>
                            <div id="amount">
                                <h3>판매가 : ${product.productPrice}원</h3>
                            </div>
                            <div class="right" id="text">
                                <h3>${product.productContent}</h3>
                            </div>
                            <div class="right">${product.subTitle}</div>
                            <div class="number-con">
                                <div class="number">
                                    <div>수량</div>
                                    <select name="selectNumber" id="select">
                                        <option> - [필수] 수량을 선택해 주세요 -</option>
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
                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <ul class="item-nav">
                        <li>
                            <a href="/board/${boardCode}/detail/${productNo}">상품정보</a>
                        </li>
                        <li>
                            <a href="/board/${boardCode}/review/${productNo}">Review</a>
                        </li>
                        <li>
                            <a href="/market/marketInquire">상품문의</a>
                        </li>
                    </ul>

                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <section class="reivew-list">
                        <h1 class="board-name">Review</h1>
                        <h3>득근전수 회원님들의 상품 후기를 확인해보세요 ~ :)</h3>
                        <br>
                        <br>
                        <table>
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty rList}">
                                    <tr>
                                        <td colspan="5">작성된 리뷰 게시글이 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="review" items="${rList}">
                                        <c:if test="${review.productNo == product.productNo}">
                                            <tr>
                                                <td>${review.reviewNo}</td>
                                                <td><a href="/board/market/reviewDetail">${review.reviewTitle}</a></td>
                                                <td>${review.memberNickname}</td>
                                                <td>${review.reviewCreateDate}</td>
                                                <td>100</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <%--                                <tr>--%>
<%--                                    <td>4</td>--%>
<%--                                    <td><a href="#">네번째 게시글</a></td>--%>
<%--                                    <td>유저일이지롱</td>--%>
<%--                                    <td>2023-09-01</td>--%>
<%--                                    <td>85</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>3</td>--%>
<%--                                    <td><a href="#">세번째 게시글</a></td>--%>
<%--                                    <td>유저일이지롱</td>--%>
<%--                                    <td>2023-09-01</td>--%>
<%--                                    <td>85</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>2</td>--%>
<%--                                    <td><a href="#">두번째 게시글</a></td>--%>
<%--                                    <td>유저일이지롱</td>--%>
<%--                                    <td>2023-09-01</td>--%>
<%--                                    <td>85</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>1</td>--%>
<%--                                    <td><a href="#">첫번째 게시글</a></td>--%>
<%--                                    <td>유저일이지롱</td>--%>
<%--                                    <td>2023-09-01</td>--%>
<%--                                    <td>85</td>--%>
<%--                                </tr>--%>
                            </tbody>
                        </table>

                        <br>
                        <br>
                        <div class="btn-area">


                            <!-- 로그인 상태일 경우 글쓰기 버튼 노출 -->
<%--                            <!-- <c:if test="${!empty loginMember}"> -->--%>
                                    <a href="/board/${boardCode}/review/${productNo}/insert" id="insertBtn">글쓰기</a>
<%--                            <button id="insertBtn">글쓰기</button>--%>
<%--                            <!-- </c:if> -->--%>

                        </div>



                        <div class="pagination-area">


                            <ul class="pagination">

                                <!-- 첫 페이지로 이동 -->
                                <li><a href="/board/${boardCode}?cp=1${sp}">&lt;&lt;</a></li>

                                <!-- 이전 목록 마지막 번호로 이동 -->
                                <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>


                                <!-- 특정 페이지로 이동 -->
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                                    <c:choose>
                                        <c:when test="${ i == pagination.currentPage}">
                                            <!-- 현재 보고있는 페이지 -->
                                            <li><a class="current">${i}</a></li>
                                        </c:when>

                                        <c:otherwise>
                                            <!-- 현재 페이지를 제외한 나머지 -->
                                            <li><a href="/board/${boardCode}?cp=${i}${sp}">${i}</a></li>

                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                                <!-- 다음 목록 시작 번호로 이동 -->
                                <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                                <!-- 끝 페이지로 이동 -->
                                <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                            </ul>

                        </div>
                    </section>
                <div class="place"></div>

                </div>
            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <%-- <script src="/resources/js/main.js"></script> --%>

        </body>
        <script src="/resources/js/board/market/marketReviewList.js"></script>

        </html>