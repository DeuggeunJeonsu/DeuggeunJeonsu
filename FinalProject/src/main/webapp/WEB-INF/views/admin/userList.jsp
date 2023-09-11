<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>득근전수 회원 목록</title>

<link rel="stylesheet" href="/resources/css/admin/userList.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>

		<div class="adminBody">

			<div class="adminBody2">


				<div class="adminSide">
					<div id="fristSide">
						<div class="adminImg">
							<img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmsIcVNgkjQ_BAsCA53PKy_iBXOaetVFJBQ&usqp=CAU">
						</div>
						관리자님

					</div>
					<a href="/userList"><div class="sideList" id="user-sideList">득근전수 회원 목록</div></a>
					<a href="/adminInquiry"><div class="sideList" id="inquiry-sideList">회원 문의</div></a>
					<a href="/adminBoardList"><div class="sideList" id="boardList-sideList">관리자 페이지</div></a>
				</div>

				<div class="userList">
					<div class="Jhead">
						<h2>득근전수 회원 목록</h2>
					</div>


					<div class="userSearch">
						<button class="fa-solid fa-magnifying-glass">
							
						</button>
						<input type="text">
					</div>

					<div class="userList">

						<table>
							<thead>

								<tr>
									<th>회원 번호</th>
									<th>회원 아이디</th>
									<th>닉네임</th>
									<th>비고</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>4</td>
									<td>user01</td>
									<td>유저일</td>
									<td><button class="userDel">탈퇴</button></td>
								</tr>

								<tr>
									<td>3</td>
									<td>user02</td>
									<td>유저이</td>
									<td><button class="userDel">탈퇴</button></td>
								</tr>

								<tr>
									<td>2</td>
									<td>user03</td>
									<td>유저삼</td>
									<td><button class="userDel">탈퇴</button></td>
								</tr>

								<tr>
									<td>1</td>
									<td>user04</td>
									<td>유저사</td>
									<td><button class="userDel">탈퇴</button></td>
								</tr>
							</tbody>
						</table>



					</div>
				</div>

			</div>

		</div>


	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


</body>

	<script src="/resources/js/board/admin/userList.js"></script>
</html>