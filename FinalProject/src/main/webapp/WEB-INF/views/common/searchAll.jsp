<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>전체검색페이지</title>
    <link rel="stylesheet" href="/resources/css/common/seachAll.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="bigCon">
    <p>총 10000개의 포스트</p>

    <div class="resultCon">

        <div class="user-info">
            <a href="#">
                <img src="/resources/images/market/bono.png" alt="thumbnail">
            </a>
            <div class="username">
                <a href=#>멤버닉네임</a>
            </div>
        </div>
        <a href="#">
            <div class="imgCon">
                <img src="/resources/images/board/리액트.png" class="thumb">
            </div>
        </a>
        <a>
            <h2>제목입니다</h2>
        </a>
        <p class="contentP">
            Eclipse에서 전체 검색(Ctrl + H) 로 검색을 할 때,
            검색을 원치 안하는 파일들이 포함되어 검색 결과를 늘리는 경우가 종종 발생한다.
            jQuery.min.js, 오픈소스라이브러리.js, 템플릿.css 뭐 등등,,이때 전체 검색 대상이 되는 범위 Scope를
        </p>

        <div class="subinfo">
            <span>2022년 1월 1일</span>
            <div class="separator">.</div>
            <span>10개의 댓글</span>
            <div class="separator">.</div>
            <span class="heart">
                <svg width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M18 1l-6 4-6-4-6 5v7l12 10 12-10v-7z"></path></svg>
            </span>
        </div>

    </div> <%-- 여기까지 resultCon --%>

    <div class="resultCon">

        <div class="user-info">
            <a href="#">
                <img src="/resources/images/market/bono.png" alt="thumbnail">
            </a>
            <div class="username">
                <a href=#>멤버닉네임</a>
            </div>
        </div>
        <a href="#">
            <div class="imgCon">
                <img src="/resources/images/board/리액트.png" class="thumb">
            </div>
        </a>
        <a>
            <h2>제목입니다</h2>
        </a>
        <p class="contentP">
            Eclipse에서 전체 검색(Ctrl + H) 로 검색을 할 때,
            검색을 원치 안하는 파일들이 포함되어 검색 결과를 늘리는 경우가 종종 발생한다.
            jQuery.min.js, 오픈소스라이브러리.js, 템플릿.css 뭐 등등,,이때 전체 검색 대상이 되는 범위 Scope를
        </p>

        <div class="subinfo">
            <span>2022년 1월 1일</span>
            <div class="separator">.</div>
            <span>10개의 댓글</span>
            <div class="separator">.</div>
            <span class="heart">
                <svg width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M18 1l-6 4-6-4-6 5v7l12 10 12-10v-7z"></path></svg>
            </span>
        </div>

    </div> <%-- 여기까지 resultCon --%>

</div>
<div class="place"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
