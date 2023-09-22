<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="marketList" value="${map.marketList}" />
<%--<c:set var="marketList" value="${map2.marketList}" />--%>
<c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}" >
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>

        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketList-style.css 연결 --%>
                <link rel="stylesheet" href="/resources/css/board/market/marketList-style.css">

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


            <%-- 검색을 진행한 경우 파라미터(key, query)를 쿼리스트링 형태로 저장한 변수를 선언 --%>
            <c:if test="${!empty param.keyword}">
                <c:set var="sp" value="&query=${param.keyword}"/>
            </c:if>

            <div class="place"></div>
            <section id="main-container">
                <div id="title-area">
                    <div class="board-title">득근 마켓</div>
                    <div>
                        <h3>건강한 삶을 지향하는 득근전수 회원님들을 위한 마켓입니다 :)</h3>
                    </div>
                </div>
                <div id="search-area">

                    <form action="/board/${boardCode}/list" method="GET">
                        <div class="search-place">
                            <input type="text" id="market-search" name="keyword" placeholder="찾으시는 제품을 검색해보세요" value="${param.keyword}">
                            <button id="search-button"><i class="fas fa-search"></i></button>
                        </div>
                    </form>

                    <div id="sort-btn-area">
                        <select id="type" name="sort">
                            <option value="n">신상품</option>
                            <option value="l">낮은가격</option>
                            <option value="h">높은가격</option>
                            <option value="b">사용후기</option>
                        </select>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${empty marketList}">
                            <h1 id="list-area2">게시글이 존재하지 않습니다.</h1>
                    </c:when>
                    <c:otherwise>
                        <div id="list-area" class="font-weight">
                            <c:forEach items="${marketList}" var="market">
                                <div class="thumbnail">
                                    <div>
                                        <a href="/board/${boardCode}/detail/${market.productNo}">
                                            <img src="${market.productImg}">
                                        </a>
                                    </div>
                                    <div class="list-content">
                                        <div class="title">
                                            <a href="/board/${boardCode}/detail/${market.productNo}?cp=${pagination.currentPage}${sp}">
                                                    ${market.productTitle}
                                            </a>
                                        </div>
                                        <div class="price" id="formattedPrice">${market.productPrice}원</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <br>
                        <br>
                        <!-- 페이지네이션 -->
                        <div class="pagination-area">
                            <ul class="pagination">
                                <li><a href="/${boardCode}/list?cp=1${sp}">&lt;&lt;</a></li>
                                <li><a href="/${boardCode}/list?cp=${pagination.prevPage}${sp}">&lt;</a></li>
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${ i == pagination.currentPage}">
                                            <li><a class="current">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="/${boardCode}/list?cp=${i}${sp}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <li><a href="/${boardCode}/list?cp=${pagination.nextPage}${sp}">&gt;</a></li>
                                <li><a href="/${boardCode}/list?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <script src="/resources/js/market/marketList.js"></script>
        </body>

        </html>