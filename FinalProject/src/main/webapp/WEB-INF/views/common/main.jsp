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
	<section id="middle-Container">
		<div id="schedule-area">
			<div>
				<h1>My health Schedule</h1>
				<div>
					<div class="progress">
						<div class="progress-num" style="width:20%"></div>
					</div>
					<div class="todolist-area">

						<h2>My To Do List</h2>
						<hr>
						<div class="check-area">
							<div>
								<input type="checkbox" id="ck1" class="none">
								<label for="ck1" class="ck"></label>
								<span>득근전수 50회 4세트</span>
							</div>
							
							<div>
								<input type="checkbox" id="ck2" class="none">
								<label for="ck2" class="ck"></label>
								<span>득근전수 50회 4세트</span>
							</div>
							<div>
								<input type="checkbox" id="ck3" class="none">
								<label for="ck3" class="ck"></label>
								<span>득근전수 50회 4세트</span>
							</div>
							
							
							<div>
								<input type="checkbox" id="ck4" class="none">
								<label for="ck4" class="ck"></label>
								<span>득근전수 50회 4세트</span>
							</div>
							
						</div>

						<div class="tdl-btnArea">
							<a class="button btnPush btnLightBlue">저장하기</a>
							<a class="button btnPush btnLightBlue">수정하기</a>
							
						</div>
						
					
					
					</div>
				</div>
			</div>
			
			<div id="CalendarArea">
				<table class="Calendar">
					<thead>
						<tr>
							<td onClick="prevCalendar();" class="calenderBtn">&#60;</td>
							<td colspan="5">
								<span id="calYear"></span>년
								<span id="calMonth"></span>월
							</td>
							<td onClick="nextCalendar();" class="calenderBtn">&#62;</td>
						</tr>
						<tr>
							<td>일</td>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
						</tr>
					</thead>
		
					<tbody>
					</tbody>
				</table>
				<i class="fa-solid fa-caret-up triangle"></i>
				<i class="fa-solid fa-circle Circle"></i>
			
			
			</div>
			

			
		</div>
	</section>
	




	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<input type="hidden" name="mainPage" value="mainPage"/>	

	<script src="/resources/js/main.js"></script>
</body>
</html>