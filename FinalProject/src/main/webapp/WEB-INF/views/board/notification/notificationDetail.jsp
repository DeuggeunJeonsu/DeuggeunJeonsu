<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardCode" value="${board.boardCode}" />
<c:set var="boardContent" value="${board.boardContent}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세페이지</title>

<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest"
	href="/resources/images/favicon_io/site.webmanifest">

<script src="https://kit.fontawesome.com/f7459b8054.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="/resources/css/board/notification/notificationDetail-style.css">
</head>

<body>
	<main>
		<div class="Jheader">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>

		<div class="Jbody">
			<div class="Jcenter">

				<div class="ncHead">
					<h2>공지사항 게시판</h2>
				</div>

				<div class="ncText">득근전수에서 회원님들에게 공지드립니다.</div>

				<div class="ncTitle">
					<input type="text"  value="${board.boardTitle}"  readonly>
				</div>

				<div class="ncProfile">

					<div id="ncProfile2">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmsIcVNgkjQ_BAsCA53PKy_iBXOaetVFJBQ&usqp=CAU"
							id="adminProfile">
					</div>

					<div id="ncName">${board.memberNickname}</div>

					<div id="ncCheckbox">작성일 :${board.boardCreateDate} | 조회수 : 0

					<c:if test="${!empty board.boardUpdateDate}" >
							| 수정일 : ${board.boardUpdateDate}
					</c:if>
					</div>

				</div>

				<div class="ncContent"  ></div>



				<!-- 좋아요 영역 -->
				<div class="board-like">
					<div class="like-cnt unchecked" id="like-cnt">
						<i class="like-btn fa-solid fa-heart fa-2x"></i>
					</div>
				</div>

				<div class="likeCount">${board.likeCount}</div>

				<div class="ncBtn">
					<div class="listbtn1">

						<button id="listbtn2">목록으로</button>
					</div>

					<div class="ncBtnList">
						<button id="ncUpdate" onclick="return boardUpdate()">수정</button>
						<button id="ncDelete" onclick="return boardDelete()">삭제</button>

					</div>
				</div>

				<div class="JJ"></div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="/resources/js/board/notification/notificationDetail.js"></script>
</body>
	<script>
		const boardCode = ${boardCode};

		window.onload = function() {
   		 
			// 여기에 JavaScript 코드를 넣으세요.
			document.getElementsByClassName("ncContent")[0].innerHTML = '${boardContent}';
		};


	</script>

</html>