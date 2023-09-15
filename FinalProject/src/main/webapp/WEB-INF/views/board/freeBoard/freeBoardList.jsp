<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="boardCode" value="3"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/freeBoard/freeBoardList-style.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>자유 게시판</h1></div>
            <div>득근전수 회원님들이 자유롭게 이야기를 나누는 공간입니다.</div>
        </div>
        <div id="search-area">
            <div class="search-place">
                <form action="" method="get" id="boardSearch">
                    <input type="search" name="query" id="searchQuery" placeholder="search...">
                    <button id="search-button"><i class="fas fa-search"></i></button>
                </form>
            </div>
            <div class="hashTag-area">
                <%-- <div>
                    #오운완
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
                <div>
                    #OOTD
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
                <div>
                    #단백질쉐이커
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                 --%>
            </div>
            <div id="sort-btn-area">
                <a href="#"><span name="key" value="l">최신순</span></a> |
                <a href="#"><span name="key" value="p">인기순</span></a> |
                <a href="#"><span name="key" value="f">팔로워</span></a>
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
                            <a href="/board/3/${board.boardNo}?cp=${pagination.currentPage}">
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
                                        <div>작성일 ${board.boardCreateDate}</div>
                                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i>&nbsp;${board.commentCount}</div>
                                    </div>
                                    <div class="profile-area">
                                        <div class="profileArea">
                                            <c:if test="${empty loginMember.profileImage}" >
                                                <img src="/resources/images/user.png">
                                            </c:if>

                                            <c:if test="${!empty loginMember.profileImage}" >
                                                <img src="${loginMember.profileImage}">
                                            </c:if>
                                        </div>
                                        <div>닉네임</div>
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
            <a href="/board2/3/insert">
                <%-- <c:if test="${!empty loginMember}" > --%>
                    <button id="writeBtn">글쓰기</button>
                <%-- </c:if> --%>
            </a>
        </div>

        <div class="pagination-area">
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

</body>
</html>