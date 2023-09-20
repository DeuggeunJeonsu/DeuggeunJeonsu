<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="product" value="${product}" />
<c:set var="productImageList" value="${productImageList}" />

<c:set var="pagination" value="${map2.pagination}" />
<c:set var="iList" value="${map2.iList}" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketQ&A-style.css 연결 --%>
                <link rel="stylesheet" href="/resources/css/board/market/marketInquire-style.css">

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

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div class="main-con">
                    <div class="top-container">
                        <div class="left-content">
                            <img src="${product.productImg}" id="main-photo">
                        </div>
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
                                        <option value="4">4개</option>
                                        <option value="5">5개</option>
                                        <option value="0">- 최대 구매 수량 5개 -</option>
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
                            <a href="/board/${boardCode}/inquire/${product.productNo}">상품문의</a>
                        </li>
                    </ul>

                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <section class="reivew-list">
                        <h1 class="board-name">Q&A</h1>
                        <h3>상품에 관해 궁금한 점이 있으시다면 무엇이든 물어보세요 :)</h3>
                        <br>
                        <br>
                        <table>
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>처리상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <c:choose>
                                        <c:when test="${empty iList}">
                                            <tr>
                                                <td colspan="5">작성된 리뷰 게시글이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="inquiry" items="${iList}">
                                                <c:if test="${inquiry.productNo == product.productNo}">
                                                    <tr>
                                                        <td>${inquiry.inquiryNo}</td>
                                                        <%--td><a href="/board/${boardCode}/review/${review.reviewNo}/detail?cp=${param.cp}">${review.reviewTitle}</a></td>--%>
                                                        <td><a href="/board/${boardCode}/inquiry/${inquiry.inquiryNo}/detail?cp=${param.cp}">${inquiry.inquiryTitle}</a></td>
                                                        <td>${inquiry.memberNickname}</td>
                                                        <td>${inquiry.inquiryCreateDate}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${inquiry.adminFlag == 'N'}">
                                                                    <button type="button" id="btn-status">처리대기</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button type="button" id="btn-status">답변완료</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                              </tbody>
                        </table>


                        <div class="btn-area">
<%--                    <a href="/board/${boardCode}/review/${productNo}/insert" id="insertBtn">글쓰기</a>--%>
                        <a href="/board/${boardCode}/inquiry/${productNo}/insert" id="insertBtn">문의하기</a>
<%--                        <button id="insertBtn">문의하기</button>--%>
                            <!-- 로그인 상태일 경우 글쓰기 버튼 노출 -->

                            <!-- <c:if test="${!empty loginMember}"> -->
                            <!-- </c:if> -->

                        </div>

                        <div class="pagination-area">
                            <ul class="pagination">
                                <!-- 첫 페이지로 이동 -->
                                <li><a href="/board/${boardCode}/inquire/${productNo}?cp=1${sp}">&lt;&lt;</a></li>
                                <!-- 이전 목록 마지막 번호로 이동 -->
                                <li><a href="/board/${boardCode}/inquire/${productNo}?cp=${pagination.prevPage}${sp}">&lt;</a></li>
                                <!-- 특정 페이지로 이동 -->
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${ i == pagination.currentPage}">
                                            <!-- 현재 보고있는 페이지 -->
                                            <li><a class="current">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 현재 페이지를 제외한 나머지 -->
                                            <li><a href="/board/${boardCode}/inquire/${productNo}?cp=${i}${sp}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <!-- 다음 목록 시작 번호로 이동 -->
                                <li><a href="/board/${boardCode}/inquire/${productNo}?cp=${pagination.nextPage}${sp}">&gt;</a></li>
                                <!-- 끝 페이지로 이동 -->
                                <li><a href="/board/${boardCode}/inquire/${productNo}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>
                            </ul>
                        </div>
                    </section>
                </div>

                 </section>
            <script>

                const productNo = "${product.productNo}";
                const productPrice = "${product.productPrice}";
                const loginMemberNo = "${loginMember.memberNo}";
                const boardCode = "${boardCode}";

            </script>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <script src="/resources/js/market/marketDetail.js"></script>
            <%-- <script src="/resources/js/main.js"></script> --%>
        </body>

        </html>