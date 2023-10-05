<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="boardCode" value="1"/>

<script>
    const loginMember = "${loginMember}";
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>정보공유 게시판</title>
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
        <c:set var="key" value="&key=${param.key}"/>
    </c:if>
    <c:if test="${!empty param.query}" >
        <c:set var="query" value="&query=${param.query}"/>
    </c:if>

    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">정보공유 게시판</div>
            <div><h3>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</h3></div>
        </div>

        <div id="search-area">
            <%-- 게시글 상세 검색 --%>
            <div class="search-place">
                <form method="get" id="boardSearch">
                    <c:if test="${!empty param.key}" >
                        <input type="hidden" name="key" value="${param.key}">
                    </c:if>
                    <input type="search" name="query" id="searchQuery" placeholder="search..." autocomplete="off" value="${key}">
                    <button id="search-button"><i class="fas fa-search"></i></button>
                </form>
            </div>

            <%-- 검색 결과 화면에서 검색어 해시태그로 표현 --%>
            <c:if test="${!empty param.query}" >
                <div class="hashTag-area">
                    <div class="hashtag">
                        <span>"${param.query}" 에 대한 검색결과</span>
                        <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                    </div>                
                </div>
            </c:if>

            <%-- 게시글 빠른 검색 --%>
            <div id="sort-btn-area">
                <a href="/board/1/list?${!empty param.query ? '&query=' : ''}${param.query}">
                    <c:if test="${param.key == null}" >
                        <span name="key" value="h" style="font-weight:bold; color:#99E1ED" id="healthCategory">전체보기</span>
                    </c:if>
                    <c:if test="${param.key != null}" >
                        <span name="key" value="h" id="healthCategory">전체보기</span>
                    </c:if>
                </a> |

                <a href="/board/1/list?key=h${!empty param.query ? '&query=' : ''}${param.query}">
                    <c:if test="${param.key == 'h'}" >
                        <span name="key" value="h" style="font-weight:bold; color:#99E1ED" id="healthCategory">건강정보</span>
                    </c:if>
                    <c:if test="${param.key != 'h'}" >
                        <span name="key" value="h" id="healthCategory">건강정보</span>
                    </c:if>
                </a> |

                <a href="/board/1/list?key=f${!empty param.query ? '&query=' : ''}${param.query}">
                    <c:if test="${param.key == 'f'}" >
                        <span name="key" value="f" style="font-weight:bold; color:#99E1ED" id="exerciseCategory">운동정보</span>
                    </c:if>
                    <c:if test="${param.key != 'f'}" >
                        <span name="key" value="f" id="exerciseCategory">운동정보</span>
                    </c:if>
                </a> |

                <a href="/board/1/list?key=t${!empty param.query ? '&query=' : ''}${param.query}">
                    <c:if test="${param.key == 't'}" >
                        <span name="key" value="t" style="font-weight:bold; color:#99E1ED" id="trendCategory">최근동향</span>
                    </c:if>
                    <c:if test="${param.key != 't'}" >
                        <span name="key" value="t" id="exerciseCategory">최근동향</span>
                    </c:if>
                </a>
            </div>
        </div>

        <div id="list-area">
            <c:choose>
                <c:when test="${empty boardList}">
                    <div class="no-board-list">
                        <h1>게시글이 존재하지 않습니다. 😅</h1>
                    </div>
                </c:when>
            
                <c:otherwise>

                <c:forEach items="${boardList}" var="board">

                <div class="thumbnail">
                    <a href="/board/1/${board.boardNo}?cp=${pagination.currentPage}">
                        <div>
                            <c:if test="${empty board.thumbnail}" >
                                <img src="/resources/images/myPage/kakaoShare_thumbnail.PNG" id="default-logo">
                            </c:if>

                            <c:if test="${!empty board.thumbnail}">
                                <c:set var="originalThumbnail" value="${board.thumbnail}"/>
                                <c:set var="thumbnail" value="${fn:replace(originalThumbnail, '^^^', ',')}"/>
                                <img src="${thumbnail}">
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
        
        <div class="write-btn-area">
            <c:if test="${!empty loginMember && loginMember.authority==2}" >
                <a href="/board2/1/write">
                    <button type="button" id="writeBtn">글쓰기</button>
                </a>
            </c:if>
        </div>

        <div class="slider__wrap">
            <div class="slider__img">
                <div class="slider__inner">
                    <div class="slider s1"><a href="/board/5/detail/7"><img src="/resources/images/ad/egg.png" alt="이미지3"></a></div>
                    <div class="slider s2"><a href="/board/5/detail/9"><img src="/resources/images/ad/coffee.png" alt="이미지4"></a></div>
                    <div class="slider s3"><a href="/board/5/detail/4"><img src="/resources/images/ad/fromroller.png" alt="이미지6"></a></div>
                    <div class="slider s4"><a href="/board/5/detail/3"><img src="/resources/images/ad/protine.png" alt="이미지8"></a></div>
                </div>
            </div>
        </div>

        <div class="paginationArea">
            <ul class="pagination">

                <!-- 첫 페이지로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=1${key}${query}">&lt;&lt;</a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=${pagination.prevPage}${key}${query}">&lt;</a></li>


                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                    <c:choose>
                        <c:when test="${ i == pagination.currentPage}">
                            <!-- 현재 보고있는 페이지 -->
                            <li><a class="current">${i}</a></li>
                        </c:when>

                        <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                            <li><a href="/board/${boardCode}/list?cp=${i}${key}${query}">${i}</a></li>

                        </c:otherwise>
                    </c:choose>

                </c:forEach>

                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=${pagination.nextPage}${key}${query}">&gt;</a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/board/${boardCode}/list?cp=${pagination.maxPage}${key}${query}">&gt;&gt;</a></li>

            </ul>
        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- informationBoardList.js 연결 -->
	<script src="/resources/js/board/informationBoard/informationBoardList.js"></script>

</body>
</html>