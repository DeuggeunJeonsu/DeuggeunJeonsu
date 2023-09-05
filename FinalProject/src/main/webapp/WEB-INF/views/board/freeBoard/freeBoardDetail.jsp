<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- freeBoardDetail-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/freeBoard/freeBoardDetail-style.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>자유 게시판</h1></div>
            <div>득근전수 회원님들이 자유롭게 이야기를 나누는 공간입니다.</div>
        </div>

        <div>제목입니다.</div>
        <div>
            <div><img src="../../../../resources/images/user.png"></div>
            <div>
                <div>닉네임</div>
                <div>
                    <button>follow</button>
                </div>
            </div>
            <div>
                <span>작성일 23.01.01&nbsp;|</span>
                <span>조회수 999</span>
            </div>
        </div>

        <div>
            <div class="hashtag">#오운완</div>
            <div class="hashtag">#OOTD</div>
            <div class="hashtag">#운동폼미쳤다</div>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="../resources/js/main.js"></script>

</body>
</html>