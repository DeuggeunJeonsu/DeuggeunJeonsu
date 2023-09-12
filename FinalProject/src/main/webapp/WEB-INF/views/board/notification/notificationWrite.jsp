<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
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

<link rel="stylesheet"
	href="/resources/css/board/notification/notificationWrite-style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

				<div class="cnText">득근전수에서 회원님들에게 공지드립니다.</div>

				<div class="ncTitle">
					<input type="text" placeholder="제목 작성" autocomplete="off">
				</div>

				<div class="ncProfile">

					<div id="ncProfile2">

						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmsIcVNgkjQ_BAsCA53PKy_iBXOaetVFJBQ&usqp=CAU"
							id="adminProfile">
					</div>

					<div id="ncName">관리자</div>

					<div id="ncCheckbox">

						<div id="ncBignews" class="popContent list">
							<input type="checkbox" id="ncBigCheck"><label
								for="ncBigCheck">중요 공지사항</label>
						</div>

						<label for="ncPic" class="btn-two cyan small">사진선택</label> <input
							type="file" id="ncPic" accept="image/*">
					</div>

				</div>
				<textarea class="ncContent" maxlength="1999"
					placeholder="내용을 입력해주세요."></textarea>



				<div class="ncContent2">
					<div id="ncContentText">
						<span id="ncTextCount">0</span> / 2000 자
					</div>
				</div>

				<div class="ncBtn">
					<button id="ncCancle">취소</button>
					<button id="ncInsert">작성</button>
				</div>

			</div>
		</div>

	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="/resources/js/board/notificationWrite.js"></script>
</body>

</html>