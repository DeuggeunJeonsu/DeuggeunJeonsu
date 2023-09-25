<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="boardCode" value="1"/>

<head>
    <meta charset="UTF-8">
    <title>건강/운동정보</title>
    <link rel="stylesheet" href="/resources/css/board/informationBoard/informationBoardList-style.css">

    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <%-- 검색어가 있을 경우 --%>
    <c:if test="${!empty param.key}" >
        <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
    </c:if>

	<section id="main-container">
        <div id="title-area">
            <div><h1>건강/운동정보</h1></div>
            <div>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</div>
        </div>

        <div id="search-area">

            <%-- 게시글 빠른 검색 --%>
            <div id="sort-btn-area">
                <a href="/board/1/list?key=h">
                    <c:if test="${param.key == 'h'}" >
                        <span name="key" value="h" style="font-weight:bold; color:#99E1ED" id="healthCategory"># 건강정보</span>
                    </c:if>
                </a>
                <c:if test="${param.key != 'h'}" >
                    <span name="key" value="h" id="healthCategory"># 건강정보</span>
                </c:if>

                <a href="/board/1/list?key=e">
                    <c:if test="${param.key == 'e'}" >
                        <span name="key" value="e" style="font-weight:bold; color:#99E1ED" id="exerciseCategory"># 운동정보</span>
                    </c:if>
                </a>
                <c:if test="${param.key != 'e'}" >
                    <span name="key" value="e" id="exerciseCategory"># 운동정보</span>
                </c:if>

                <a href="/board/1/list?key=f">
                    <c:if test="${param.key == 'f'}" >
                        <span name="key" value="f" style="font-weight:bold; color:#99E1ED" id="trendCategory"># 최근동향</span>
                    </c:if>
                </a>
                <c:if test="${param.key != 'c'}" >
                    <span name="key" value="f" id="exerciseCategory"># 최근동향</span>
                </c:if>
            </div>

            <%-- 검색 결과 화면에서 검색어 해시태그로 표현 --%>
            <c:if test="${!empty param.query}" >
                <div class="hashTag-area">
                    <div>
                        <span>"${param.query}" 에 대한 검색결과</span>
                        <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                    </div>                
                </div>
            </c:if>

            <%-- 게시글 상세 검색 --%>
            <div class="search-place">
                <form method="get" id="boardSearch">
                    <input type="hidden" name="key" value="tc">
                    <input type="search" name="query" id="searchQuery" placeholder="search..." autocomplete="off" value=${param.query}>
                    <button id="search-button"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </div>

        <div id="list-area">
            <c:choose>
                <c:when test="${empty boardList}">
                    <div class="no-board-list">
                        <h1>게시글이 존재하지 않습니다. 첫 게시글의 주인공이 되어 보세요! 😅</h1>
                    </div>
                </c:when>
            
                <c:otherwise>

                    <c:forEach items="${boardList}" var="board">

                        <div class="thumbnail">
                            <a href="/board/1/${board.boardNo}?cp=${pagination.currentPage}">
                                <div>
                                    <c:if test="${empty board.thumbnail}" >
                                        <img src="/resources/images/main/log02.png" id="default-logo">
                                    </c:if>

                                    <c:if test="${!empty board.thumbnail}">
                                        <img src="${board.thumbnail}">
                                    </c:if>
                                </div>
                                <div>
                                    <div class="title">${board.boardTitle}</div>
                                    <div class="createDate-area">
                                        <div>${board.boardContent}</div>
                                    </div>
                                    <div class="profile-area">
                                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i>&nbsp;${board.commentCount}</div>
                                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i>&nbsp;${board.likeCount}</div>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </c:forEach>

                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="write-btn-area">
            <c:if test="${!empty loginMember}" >
                <button type="button" id="writeBtn">글쓰기</button>
            </c:if>
        </div>

        <div class="paginationArea">
            <ul class="pagination">

                <!-- 첫 페이지로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=1${sp}">&lt;&lt;</a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=${pagination.prevPage}${sp}">&lt;</a></li>


                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                    <c:choose>
                        <c:when test="${ i == pagination.currentPage}">
                            <!-- 현재 보고있는 페이지 -->
                            <li><a class="current">${i}</a></li>
                        </c:when>

                        <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                            <li><a href="/board/${boardCode}/list?cp=${i}${sp}">${i}</a></li>

                        </c:otherwise>
                    </c:choose>

                </c:forEach>

                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

            </ul>
        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- informationBoardList.js 연결 -->
	<script src="/resources/js/board/informationBoard/informationBoardList.js"></script>

</body>
</html>