<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>득근전수</title>

<%-- alert창 바꿔 주는 스크립트 연결 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">

<link rel="stylesheet" href="/resources/css/common/todolist-style.css">
</head>
<body>
    
    <section id="middle-Container">
		<div id="schedule-area">
			<div>
				<h1>My Health Schedule</h1>
				<div>
					<div class="progress">
						<div class="progress-num" ></div>
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
			
					</div>
				</div>
			</div>
			

			<div class="todolist-area">

				<h2>My To Do List</h2>
				<hr>
				<div class="check-area">
					
					<%-- <div>
						<input type="checkbox" id="ck1" class="none checkbox">
						<label for="ck1" class="ck"></label>
						<span>1. 득근전수 50회 4세트</span>
						<button type="button">-</button>
					</div> --%>
					
					
				</div>
				
				<div>
					<input type="text" name="addList" class="addList" placeholder="예) 스쿼트 20회 5세트"><button type="button" class="addListBtn">+</button>
					<input type="hidden" class="choice" value="">
				</div>

				<%-- <div class="tdl-btnArea">
					<a class="button btnPush btnLightBlue">저장하기</a>
					<a class="button btnPush btnLightBlue">수정하기</a>
					
				</div> --%>
				
			
			
			</div>

			
		</div>
	</section>

	<script src="/resources/js/TodoList/todoList.js"></script>
	<script>
		 const loginMemberNo = "${loginMember.memberNo}";
	</script>
</body>
</html>
