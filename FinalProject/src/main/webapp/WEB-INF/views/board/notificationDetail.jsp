<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세페이지</title>

<script src="https://kit.fontawesome.com/f7459b8054.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="/resources/css/board/notificationDetail-style.css">
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
					<input type="text" autocomplete="off" value="공지사항 제목" readonly>
				</div>

				<div class="ncProfile">

					<div id="ncProfile2">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmsIcVNgkjQ_BAsCA53PKy_iBXOaetVFJBQ&usqp=CAU"
							id="adminProfile">
					</div>

					<div id="ncName">관리자</div>

					<div id="ncCheckbox">작성일 : 2023.08.29 | 조회수 : 999</div>

				</div>

				<textarea class="ncContent" readonly>공지사항 내용</textarea>



				<div class="ncContent2">
					<i class="fa-solid fa-heart" id="Jheart"></i>
					<div id="likeCount">99</div>
				</div>

				<div class="ncBtn">
					<div class="listbtn1">

						<button id="listbtn2">목록으로</button>
					</div>

					<div class="ncBtnList">
						<button id="ncUpdate">수정</button>
						<button id="ncDelete">삭제</button>

					</div>
				</div>
				<div class="JJ"></div>
			</div>
		</div>
	</main>
	<script src="notificationWrite.js"></script>
</body>

</html>