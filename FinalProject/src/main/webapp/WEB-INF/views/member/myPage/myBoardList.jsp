<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 게시글</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myBoardList-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/member/myPage/myBoardList-style.css">
    
    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

</head>

<body>
    <%-- header include --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 마이페이지 사이드바 include -->
        <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

        <div id="right-content-area">
            <div id="title-area">
                <div><h1>내 게시글</h1></div>
                <div>회원님이 작성하신 게시글을 조회할 수 있습니다.</div>
            </div>

            <div id="main-content-area">
                <div id="board-area-middle">

                    <c:choose>
                       <c:when test="${empty boardList}">
                            <div class="no-board-list">
                                <h1>게시글이 존재하지 않습니다. 첫 게시글을 작성해 보세요! 😅</h1>
                            </div>
                       </c:when>
                    
                       <c:otherwise>

                            <c:forEach items="${boardList}" var="board">

                                <a href="/board/${board.boardCode}/${board.boardNo}" class="board-link">
                                    <div class="thumbnail">
                                        <div>
                                            <c:if test="${empty board.thumbnail}" >
                                                <img src="/resources/images/main/log02.png" id="default-logo">
                                            </c:if>

                                            <c:if test="${!empty board.thumbnail}">
                                                <c:set var="originalThumbnail" value="${board.thumbnail}"/>
                                                <c:set var="thumbnail" value="${fn:replace(originalThumbnail, '^^^', ',')}"/>
                                                <img src="${thumbnail}">
                                            </c:if>
                                        </div>
                                        <div>
                                            <div class="title ">${board.boardTitle}</div>
                                            <div class="createDate-area">
                                                <div>작성일 ${board.boardCreateDate}</div>
                                                <div><i class="fa-regular fa-comment" style="color: #ddd;"></i>&nbsp;${board.commentCount}</div>
                                            </div>
                                            <div class="profile-like-container">
                                                <div class="profile-area">
                                                    <div class="profileArea">
                                                        <c:if test="${empty board.profileImage}" >
                                                            <img src="/resources/images/user.png">
                                                        </c:if>
                                                        <c:if test="${!empty board.profileImage}" >
                                                            <img src="${board.profileImage}">
                                                        </c:if>
                                                    </div>

                                                    <div class="nicknameArea">${board.memberNickname}</div>
                                                </div>
                                                <div class="likeArea"><i class="fa-solid fa-heart" style="color: #ff4242;"></i>&nbsp;${board.likeCount}</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                            </c:forEach>

                       </c:otherwise>
                    </c:choose>

                </div>
                <!-- 페이지네이션 영역 -->
                <div id="pagination-area">
                    <ul class="pagination">

                        <!-- 첫 페이지로 이동 -->
                        <li><a href="/myPage/myBoardList?cp=1">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="/myPage/myBoardList?cp=${pagination.prevPage}">&lt;</a></li>


                        <!-- 특정 페이지로 이동 -->
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                            <c:choose>
                                <c:when test="${ i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>

                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/myPage/myBoardList?cp=${i}">${i}</a></li>

                                </c:otherwise>
                            </c:choose>

                        </c:forEach>

                        <!-- 다음 목록 시작 번호로 이동 -->
                        <li><a href="/myPage/myBoardList?cp=${pagination.nextPage}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 -->
                        <li><a href="/myPage/myBoardList?cp=${pagination.maxPage}">&gt;&gt;</a></li>

                    </ul>
                </div>
            </div>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>