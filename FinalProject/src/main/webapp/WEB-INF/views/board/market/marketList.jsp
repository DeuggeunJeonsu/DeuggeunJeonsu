<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketList-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/marketList-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div id="title-area">
                    <div class="board-title">득근 마켓</div>
                    <div>
                        <h3>건강한 삶을 지향하는 득근전수 회원님들을 위한 마켓입니다 :)</h3>
                    </div>
                </div>
                <div id="search-area">
                    <div class="search-place">
                        <%-- <input type="text" name="query"  id="searchQuery" placeholder="search..."> --%>
                        <input type="search" id="market-search" placeholder="search...">
                        <button id="search-button"><i class="fas fa-search"></i></button>

                    </div>
                    <div id="sort-btn-area">
                        <a href="#"><span>최신순</span></a> |
                        <a href="#"><span>인기순</span></a>
                    </div>
                </div>

                <div id="list-area" class="font-weight">
                    <div class="thumbnail">
                        <div>
                            <a href="/market/marketDetail">
                                <img src="/resources/images/market/test2-main.jpeg">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="/market/marketDetail">[프리미엄 프로틴 파우더]</a></div>
                            <div>70,000원</div>
                        </div>
                    </div>
                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
                    </div>

                    <div class="thumbnail">
                        <div> <a href="/marketDetail">
                                <img src="/resources/images/main/log02.png">
                            </a>
                        </div>
                        <div class="list-content">
                            <div class="title"><a href="">상품명입니다</a></div>
                            <div>내용 영역</div>
                        </div>
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


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/main.js"></script>
        </body>

        </html>