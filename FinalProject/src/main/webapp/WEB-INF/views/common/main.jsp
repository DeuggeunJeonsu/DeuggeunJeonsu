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
	<a href="/survey"><button class="Jbtn"><span>운동 루틴 추천받기!</span></button></a>
		<div class="video-container">
			<!--메인 동영상 재생  -->
			<section id="hello" class="home bg-mega">
				<video controls autoplay loop muted>
					<source src="/resources/images/main/mainVido.mp4">
				</video>
				<div class="hello-container">
					<div class="hello-row">
						<div class="main-home">
							<h1 class="text-white">
								Let's work out<br> with your<br> <span style="color: #99E1ED ;">Deuggeun-Jeonsu</span>
							</h1>
							<div class="hello-BtnArea">
								<button>My health Schedule</button>
								<button>BMI 측정</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	
		
	</section>

	<jsp:include page="/WEB-INF/views/common/todolist.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/common/ranking.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<input type="hidden" name="mainPage" value="mainPage"/>	

	<%-- <script src="../resources/js/main.js"></script> --%>
	<script src="/resources/js/TodoList/todoList.js"></script> 
</body>
</html>