<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

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
                    <div>
                        게시글이 존재하지 않습니다.
                    </div>
               </c:when>
            
               <c:otherwise>

                    <c:forEach items="${boardList}" var="board">

                        <div class="thumbnail">
                            <a href="/board/3/${board.boardNo}?cp=${pagination.currentPage}">
                                <div>
                                    <c:if test="${empty board.thumbnail}" >
                                        <img src="/resources/images/main/log02.png">
                                    </c:if>
                                </div>
                                <div>
                                    <div class="title">${board.boardTitle}</div>
                                    <div class="createDate-area">
                                        <div>작성일 ${board.boardCreateDate}</div>
                                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
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
                                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </c:forEach>

               </c:otherwise>
            </c:choose>




            <%-- <div class="thumbnail">
                <a href="#">
                    <div><img src="/resources/images/main/log02.png"></div>
                    <div>
                        <div class="title ">제목입니다</div>
                        <div class="createDate-area">
                            <div>작성일 23.01.01</div>
                            <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 4</div>
                        </div>
                        <div class="profile-area">
                            <div class="profileArea"><img src="/resources/images/user.png"></div>
                            <div>닉네임</div>
                            <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                        </div>
                    </div>
                </a>
            </div> --%>

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

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>