<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- marketDetail-style.css 연결 --%>
<link rel="stylesheet" href="../resources/css/board/market/marketDetail-style.css">

<!-- Font Awesome CDN 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H" crossorigin="anonymous">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="main-container">
        <div class="top-container">
            <div class="item-photo"></div>
            <div class="item-detail"></div>
        </div>
        <div class="item-nav"></div>
        <div class="item-content"></div>
        <div class="notice"></div>
    </div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script src="/resources/js/main.js"></script>
</body>
</html>