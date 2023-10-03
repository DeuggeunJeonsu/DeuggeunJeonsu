<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		

		<c:set var="memberList" value="${map.memberList}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>득근전수 회원 목록</title>

<link rel="stylesheet" href="/resources/css/admin/userList.css">

<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest"
	href="/resources/images/favicon_io/site.webmanifest">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
							<%-- 프로필 이미지 X --%>
							<c:if test="${empty loginMember.profileImage}" >
								<img src="/resources/images/user.png" id="profileImage">
							</c:if>
			
							<%-- 프로필 이미지 O --%>
							<c:if test="${!empty loginMember.profileImage}" >
								<img src="${loginMember.profileImage}" id="profileImage">
							</c:if>
						</div>
						${loginMember.memberNickname}

					</div>
					<a href="/admin/userList">
						<div class="sideList" id="user-sideList">회원 목록</div>
					</a> <a href="/admin/adminInquiry">
						<div class="sideList" id="inquiry-sideList">회원 문의</div>
					</a> <a href="/admin/adminBoardList">
						<div class="sideList" id="boardList-sideList">관리자 페이지</div>
					</a>
				</div>

				<div class="userList">
					<div class="Jhead">
						<h2>득근전수 회원 목록</h2>
					</div>


					<div class="search-place">
						
					</div>


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

							<c:choose>

							<c:when test="${empty memberList}">
								<tr>
									<th id="noPage" colspan="6">
										페이지가 존재하지 않습니다.
									</th>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${memberList}" var="member">
									<tr>
										<td>${member.memberNo}</td>
										<td>${member.memberEmail}</td>
										<td>${member.memberNickname}</td>
										<td><button class="userDel">탈퇴</button></td>
									</tr>

									<input  type="hidden" id="memberNo" value="${member.memberNo}" >
									
									
								</c:forEach>
							</c:otherwise>
						
							</c:choose>
							

							
							</tbody>
						</table>



				</div>

			</div>

		</div>


	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


</body>



<script src="/resources/js/board/admin/userList.js"></script>
</html>