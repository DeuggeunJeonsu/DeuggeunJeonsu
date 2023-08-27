<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>득근전수</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="main-content">
		<!--메인 동영상 재생  -->
		<section id="hello" class="home bg-mega">
			<video controls autoplay loop width="100%">
				<source src="/resources/images/main/mainVido.mp4">
			</video>
			<!--End off container -->
		</section>
	</div>
	


	<script src="/resources/js/main.js"></script>
</body>
</html>