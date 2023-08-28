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
	
	<section id="main-container">
		<div class="video-container">
			<!--메인 동영상 재생  -->
			<section id="hello" class="home bg-mega" width="1140px">
				<video controls autoplay loop muted>
					<source src="/resources/images/main/mainVido.mp4">
				</video>
			</section>
			<div class="hello-container">
				<div class="hello-row">
					<div class="main-home">
						<h1 class="text-white">
							Let's work out<br> with your<br> <span style="color: #99E1ED ;">Deuggeun-Jeonsu</span>
						</h1>
					</div>
				</div>
				<div class="hello-BtnArea">
					<input type="button">
					<input type="button">
				</div>
			</div>
		</div>
	
		
	</section>
	<section id="middle-Container">

	</section>
	




	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<input type="hidden" name="mainPage" value="mainPage"/>	

	<script src="/resources/js/main.js"></script>
</body>
</html>