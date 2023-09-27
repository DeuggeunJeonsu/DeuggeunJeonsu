<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="searchList" value="${map.searchList}" />
<c:set var="listCount" value="${map.listCount}" />
<html>
<head>
    <title>전체검색 페이지</title>
    <link rel="stylesheet" href="/resources/css/common/seachAll.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<%-- 검색을 진행한 경우 파라미터(key, query)를 쿼리스트링 형태로 저장한 변수를 선언 --%>
<c:if test="${!empty param.keyword}">
    <c:set var="sp" value="&query=${param.keyword}"/>
</c:if>

<div class="place"></div>
<div class="bigCon">

    <form action="/search/all" method="GET">
    <div class="searchCon"><svg width="17" height="17" viewBox="0 0 17 17">
        <path fill-rule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z" clip-rule="evenodd" fill="currentColor"></path></svg>
        <input type="text" placeholder="검색어를 입력하세요" name="keyword" value="${param.keyword}" id="searchAll">
    </div>
    </form>

    <c:if test="${!empty param.keyword}">

    <p class="total">총
        <b>${listCount.size()}</b>
        건의 검색결과를 찾았습니다.
    </p>
    <c:if test="${listCount.size() == 0}">
        <p class="no-results">검색결과가 없습니다.</p>
    </c:if>

    <div class="boardName">
        <c:forEach var="boardCount" items="${listCount}">
            <a href="#">
            <div class="detail">#${boardCount.boardName} (${boardCount.count})</div>
            </a>
        </c:forEach>
    </div>


    <c:forEach var="board" items="${searchList}">
        <div class="resultCon">
            <div class="user-info">
                <a href="#">
                    <c:choose>
                        <c:when test="${empty board.profileImage}">
                            <img src="/resources/images/user.png" alt="default">
                        </c:when>
                        <c:otherwise>
                            <img src="${board.profileImage}" alt="profile">
                        </c:otherwise>
                    </c:choose>
                </a>
                <div class="username">
                    <a href="#">${board.memberNickname}</a>
                </div>
            </div>
            <a href="#">
                <div class="imgCon">
                    <img src="/resources/images/board/${board.thumbnail}" class="thumb">
                </div>
            </a>
            <a>
                <h2>${board.boardTitle}</h2>
            </a>
            <p class="contentP">
                    ${board.boardContent}
            </p>
            <div class="subinfo">
                <span>${board.boardCreateDate}</span>
                <div class="separator">.</div>
                <span>10개의 댓글</span>
            </div>
        </div>
    </c:forEach>
    </c:if>


</div>
<%--<div class="place"></div>--%>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
