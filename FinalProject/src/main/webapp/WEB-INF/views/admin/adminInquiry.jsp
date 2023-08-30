<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 문의 목록</title>

<link rel="stylesheet" href="/resources/css/admin/adminInquiry.css">
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
					<a href="/adminBoardList"><div id="sideList">득근전수 회원 목록</div>
					<a href="/adminInquiry"><div id="sideList">회원 문의</div></a>
					<a href="/userList"><div id="sideList">관리자 페이지</div></a>
				</div>

				<div class="userList">
					<div class="Jhead">
						<h2>회원 문의 목록</h2>
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
									<th>문의 번호</th>
									<th>제목</th>
									<th>구분</th>
									<th>회원아이디</th>
									<th>답변</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>4</td>
									<td>상품이 이상해요</td>
									<td>상품 / 환불</td>
									<td>user04</td>
									<td>완료</td>
								</tr>

								<tr>
									<td>3</td>
									<td>환불 해주세요.</td>
									<td>상품 / 환불</td>
									<td>user03</td>
									<td><button id="iqWrite">답변</button></td>
								</tr>

								<tr>
									<td>2</td>
									<td>반품 요청합니다</td>
									<td>상품 / 반품</td>
									<td>user02</td>
									<td><button id="iqWrite">답변</button></td>
								</tr>

								<tr>
									<td>1</td>
									<td>배송이 느리네요</td>
									<td>상품 / 배송 문의</td>
									<td>user01</td>
									<td>완료</td>
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
</html>