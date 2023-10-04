<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest"
	href="/resources/images/favicon_io/site.webmanifest">

<link rel="stylesheet" href="/resources/css/survey-style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
		<div class="svBody">


			<div class="popUp">
				<div class="popTitle">득근전수 추천 운동 !</div>
				<div class="popContent list">

					<div class="popList">
					</div>


					<button href="" title="Button2 border lightblue2" class="button2 btnFloat2 btnLightBlue2" id="confirmStart2"></button>
					<button href="" title="Button border lightblue"
						class="button btnFloat btnLightBlue" id="confirmStart"></button>

				</div>
			</div>

			<div class="sv1">

				<div class="svHeader" id="fristHeader">오늘은 어느 부위를 하시나요?</div>

				<div class="svGauge">
					<div id="range">
						<div id="rangeblue"></div>
					</div>
				</div>

				<div class="checks etrans">

					<div class="bodycheck0 bodyList">
						<input type="checkbox" id="ex_chk1" class="bodycheck0 fristCheck">
						<label for="ex_chk1" class="bodyList">상체</label>
					</div>

					<div class="bodycheck0 bodyList">
						<input type="checkbox" id="ex_chk2" class="bodycheck0 fristCheck">
						<label for="ex_chk2" class="bodyList-leg">하체</label>
					</div>



					<div class="bodycheck1 ">
						<input type="checkbox" class="up_chk" id="ex_chk3"> <label
							for="ex_chk3" class="bodyList">등</label>
					</div>
					<div class="bodycheck1 ">
						<input type="checkbox" class="up_chk" id="ex_chk4"> <label
							for="ex_chk4" class="bodyList">가슴</label>
					</div>

					<div class="bodycheck1 ">
						<input type="checkbox" class="up_chk" id="ex_chk5"> <label
							for="ex_chk5" class="bodyList">어깨</label>
					</div>

					<div class="bodycheck1 ">
						<input type="checkbox" class="up_chk" id="ex_chk6"> <label
							for="ex_chk6" class="bodyList">팔</label>
					</div>


					<div class="bodycheck2 ">
						<input type="checkbox" class="leg_chk" id="ex_chk7"> <label
							for="ex_chk7" class="bodyList" name="legs">허벅지 앞쪽</label>
					</div>

					<div class="bodycheck2 ">
						<input type="checkbox" class="leg_chk" id="ex_chk8"> <label
							for="ex_chk8" class="bodyList" name="legs">허벅지 뒤쪽</label>
					</div>

					<div class="bodycheck2 ">
						<input type="checkbox" class="leg_chk" id="ex_chk9"> <label
							for="ex_chk9" class="bodyList" name="legs">종아리</label>
					</div>


				</div>

				<div class="btnList">
					<button type="button" id="beforeBtn" value="">이전</button>
					
					<c:if test="${empty loginMember}">
						<a id="noMember">로그인하고 추천받기!</a>
					</c:if>
					
					<c:if test="${!empty loginMember}">
						<button type="button" id="bodyCheck" value="">다음</button>
					</c:if>
					<button type="button" id="finalCheck" value="">결과확인</button>

				</div>

			</div>

			<pre class="sv2">
					<strong>득근 전수가 추천 해드립니다.</strong>

	득근 전수에서는 설문하신 내용을 토대로 부의별 운동을 추천 해드립니다.

		  자유롭게 선택 후 득근하는 시간이 되셨으면 좋겠습니다.




											
						<strong>TodoList 추가 가능!</strong> 

		  설문 완료 후, 마음에 드는 운동을 나만의 TodoList에 담아보세요.

			  + 버튼을 누르시면 금일 나만의 TodoList에 추가됩니다. 

					   TodoList 추가 후 오늘도 득근!





					* TodoList 기능은 로그인 후 이용가능 하고,
				추천내용은 새로고침 후 사라지니 유의하시기 바랍니다.
                </pre>

		</div>



	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

<script>
	const loginMember = '${loginMember}';
</script>

<script src="/resources/js/survey.js"></script>

</html>