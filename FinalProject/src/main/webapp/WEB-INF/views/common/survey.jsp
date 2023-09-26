<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<li class="pop_chk" id="check">벤치</li>
						<li class="pop_chk" id="check">벤치</li>
					</div>


					<%-- <button href="" title="Button2 border lightblue2" class="button2 btnFloat2 btnLightBlue2" id="confirmStart2"></button> --%>
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
							for="ex_chk7" class="bodyList">허벅지 앞쪽</label>
					</div>

					<div class="bodycheck2 ">
						<input type="checkbox" class="leg_chk" id="ex_chk8"> <label
							for="ex_chk8" class="bodyList">허벅지 뒤쪽</label>
					</div>

					<div class="bodycheck2 ">
						<input type="checkbox" class="leg_chk" id="ex_chk9"> <label
							for="ex_chk9" class="bodyList">종아리</label>
					</div>


				</div>

				<div class="btnList">
					<button type="button" id="beforeBtn" value="">이전</button>
					<button type="button" id="bodyCheck" value="">다음</button>
					<button type="button" id="finalCheck" value="">결과확인</button>

				</div>

			</div>

			<pre class="sv2">
<strong>득근 전수가 추천 해드립니다.</strong>
득근 전수에서는 설문하신 내용을 토대로 부의별 운동을 추천 및 소개 해드립니다.

정성껏 답변하시어 득근하는 시간이 되셨으면 좋겠습니다.




                
<strong>이게 과연 나에게 맞을까?</strong>
설문 완료 후, 알맞은 운동이 나에게 맞지 않을까라는 의심이 드신다면?

걱정하지 마세요! 다시 해보세요 ~ 






추천내용은 새로고침 후 사라지니 유의하시기 바랍니다.
                </pre>

		</div>



	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script src="/resources/js/survey.js"></script>

</html>