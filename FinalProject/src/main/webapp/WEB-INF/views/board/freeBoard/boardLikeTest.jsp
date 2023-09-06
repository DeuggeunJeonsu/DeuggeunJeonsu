<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- <script src="//code.jquery.com/jquery-3.4.1.min.js"></script> --%>
<%-- GSAP 라이브러리 추가 --%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 

<%-- freeBoardDetail-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/freeBoard/freeBoardDetail-style.css">
<link rel="stylesheet" href="../resources/css/board/freeBoard/boardLikeTest.css">

</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>


	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>자유 게시판</h1></div>
            <div>득근전수 회원님들이 자유롭게 이야기를 나누는 공간입니다.</div>
        </div>

        <div class="like-container">
            <div class="like-cnt unchecked" id="like-cnt">
                <i class="like-btn fa-solid fa-heart fa-2x"></i>
            </div>
        </div>



	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- freeBoardDetail.js 연결 -->
	<script src="../resources/js/board/freeBoard/boardLikeTest.js"></script>

</body>
</html>

