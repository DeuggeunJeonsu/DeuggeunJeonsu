<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 뱃지</title>

<%-- myBadge-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/member/myPage/myBadge-style.css">
</head>
<body style="background-color:#F8F9FA">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>내 뱃지</h1></div>
            <div>회원님의 뱃지 획득 상태를 확인하세요!</div>
        </div>

        <div id="middle-area">
            <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>
            <div id="right-content-area"></div>
        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="../resources/js/main.js"></script>

</body>
</html>