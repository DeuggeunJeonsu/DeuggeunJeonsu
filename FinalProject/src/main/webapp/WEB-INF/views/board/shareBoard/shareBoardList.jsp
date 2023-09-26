<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="boardCode" value="2"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루틴공유게시판</title>

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

<%-- alert창 바꿔 주는 스크립트 연결 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/freeBoard/freeBoardList-style.css">
</head>
<body style="background-color:#F8F9FA">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">루틴 공유 게시판</div>
            <div><h3>득근전수 회원들과 나만의 운동 루틴을 공유해 보세요.</h3></div>
        </div>
        <div id="search-area">
            <div class="search-place">
                <form method="get" id="boardSearch">
                    <input type="hidden" name="key" value="tc">
                    <input type="search" name="query" id="searchQuery" placeholder="search..." autocomplete="off" value=${param.query}>
                    <button id="search-button"><i class="fas fa-search"></i></button>
                </form>
            </div>

            <c:if test="${!empty param.query}" >
                <div class="hashTag-area">
                    <div class="hashtag">
                        #${param.query}
                        <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                    </div>
                </div>
            </c:if>

            <div id="sort-btn-area">
                <%-- 최신순 --%>
                <a href="/board/2/list?key=r">
                    <c:if test="${param.key == 'r'}" >
                        <span name="key" value="r" style="font-weight:bold; color:#99E1ED" id="recent-sort-btn">최신순</span>
                    </c:if>
                    <c:if test="${param.key != 'r'}" >
                        <span name="key" value="r" id="recent-sort-btn">최신순</span>
                    </c:if>
                </a> |

                <%-- 인기순 --%>
                <a href="/board/2/list?key=p">
                    <c:if test="${param.key == 'p'}" >
                        <span name="key" value="p" style="font-weight:bold; color:#99E1ED" id="popular-sort-btn">인기순</span>
                    </c:if>
                    <c:if test="${param.key != 'p'}" >
                        <span name="key" value="p" id="popular-sort-btn">인기순</span>
                    </c:if>
                </a>

                <%-- 팔로잉순 --%>
                <c:if test="${!empty loginMember}">
                |
                </c:if>
                <c:if test="${!empty loginMember}">
                    <a href="/board/2/list?key=f">
                        <c:if test="${param.key == 'f'}" >
                            <span name="key" value="f" style="font-weight:bold; color:#99E1ED" id="following-sort-btn">팔로잉순</span>
                        </c:if>
                        <c:if test="${param.key != 'f'}" >
                            <span name="key" value="f" id="following-sort-btn">팔로잉순</span>
                        </c:if>
                    </a>
                </c:if>
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
                            <a href="/board/2/${board.boardNo}?cp=${pagination.currentPage}">
                                <div>
                                    <c:if test="${empty board.thumbnail}" >
                                        <img src="/resources/images/myPage/kakaoShare_thumbnail.PNG" id="default-logo">
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
                                            <c:if test="${empty board.profileImage}" >
                                                <img src="/resources/images/user.png">
                                            </c:if>

                                            <c:if test="${!empty board.profileImage}" >
                                                <img src="${board.profileImage}">
                                            </c:if>
                                        </div>
                                        <div>${board.memberNickname}</div>
                                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i>&nbsp;${board.likeCount}</div>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </c:forEach>

                </c:otherwise>
            </c:choose>
        
        </div>
        <%-- 광고 영역
        <div id="ad"></div> --%>

        <div class="write-btn-area">
            <c:if test="${!empty loginMember}" >
                <button id="writeBtn">글쓰기</button>
            </c:if>
        </div>

        <%-- 페이지네이션 --%>
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


    <script>
        const loginMemberNo = "${loginMember.memberNo}";
    </script>

    <script src="/resources/js/board/shareBoard/shareBoardList.js"></script>
</body>
</html>