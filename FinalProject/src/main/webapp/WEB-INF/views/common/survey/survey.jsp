<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/resources/css/survey-style.css">


</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
		<div class="svBody">


          <!--   <div class="popUp">
                <div class="popTitle">득근전수 추천 운동 !</div>
                <div class="popContent list"> 
                
                       <div class="popList">
                           <input type="checkbox" id="check${i}"><label for="check${i}">벤치</label>
                       </div>

                       <div class="popList">
                        <input type="checkbox" id="check${i}"><label for="check${i}">벤치</label>
                      </div>

						<button href="" title="Button border lightblue" class="button btnFloat btnLightBlue"></button>
						<button href="" title="Button border lightblue" class="button2 btnFloat2 btnLightBlue2"></button>

                </div>
            </div>   -->
 
			<div class="sv1">

				<div class="svHeader">오늘은 어느 부위를 하시나요?</div>
				<div class="svGauge">
					<input id="rangeInput1" readonly class="rangeInput" 
						max="10" min="0" step="1" value="0" type="range" />
				</div>

				<div class="checks etrans">
					<input type="checkbox" id="ex_chk1" class="bodycheck0"> <label for="ex_chk1">상체</label>

					<input type="checkbox" id="ex_chk2" class="bodycheck0"> <label for="ex_chk2">하체</label>



					<div class="bodycheck1">
						<input type="checkbox" id="ex_chk3" > <label for="ex_chk3">등</label>
					</div>	
                    <div class="bodycheck1">
						<input type="checkbox" id="ex_chk3" > <label for="ex_chk3">등</label>
					</div>	

                    <div class="bodycheck1">
						<input type="checkbox" id="ex_chk3" > <label for="ex_chk3">등</label>
					</div>	

                    <div class="bodycheck1">
						<input type="checkbox" id="ex_chk3" > <label for="ex_chk3">등</label>
					</div>	

					<div class="bodycheck1">
						<input type="checkbox" id="ex_chk4" > <label for="ex_chk4">가슴</label>
					</div>

					<div class="bodycheck1">
						<input type="checkbox" id="ex_chk5" > <label for="ex_chk5">팔</label>
					</div>

					<div class="bodycheck1">
						<input type="checkbox" id="ex_chk6" > <label for="ex_chk6">전완</label>
					</div>

					<div class="bodycheck1">
						<input type="checkbox" id="ex_chk7" > <label for="ex_chk7">전완2</label>
					</div>

					<div class="bodycheck1">
						<input type="checkbox" id="ex_chk8" > <label for="ex_chk8">전완3</label>
					</div>
					


					<button type="button"  id="bodyCheck" value="">다음</button>
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