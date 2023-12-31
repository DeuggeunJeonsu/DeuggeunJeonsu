<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	
	<!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
	<script>
		const loginMemberEmail = "${loginMember.memberEmail}"; // 로그인한 회원이메일
	</script>
<meta charset="UTF-8">
<title>득근전수</title>
	<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
	<link rel="stylesheet" href="/resources/css/common/main.css">

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- Preloader -->
	<div id="loading">
		<div id="loading-log">
			<img src="/resources/images/main/loading.gif">
		</div>
		
	</div>

	<section id="main-container">

		<a href="/bmi"><button class="Jbtn position1"><span>BMI 측정하러 가기!</span></button></a>
		<a href="/survey"><button class="Jbtn position2"><span>운동 루틴 추천받기!</span></button></a>

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
								<button class="schedule-scroll">My Health Schedule</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	
		
	</section>

	<jsp:include page="/WEB-INF/views/common/todolist.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/randing.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/ranking.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/MDPick.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/trendingPost.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/map.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<input type="hidden" name="mainPage" value="mainPage"/>	

	<%-- <script src="../resources/js/main.js"></script> --%>
	<!-- <script src="/resources/js/TodoList/todoList.js"></script>  -->

	<!-- AOS 스크립트 시작 -->
	<script> 
		AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
	</script>

</body>
</html>