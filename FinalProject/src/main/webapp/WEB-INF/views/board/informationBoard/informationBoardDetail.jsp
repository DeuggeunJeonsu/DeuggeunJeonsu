<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<title>정보공유 게시판</title>

	<link rel="stylesheet" href="/resources/css/board/informationBoard/informationBoardDetail-style.css">
    
    <%-- GSAP 라이브러리 추가 --%>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 

    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

    <%-- 카카오 라이브러리 추가 --%>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
        Kakao.init('5600ed391bce28878bbfdfcae636db6e');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
</head>

<body>
    <%-- mojs 라이브러리 추가 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
			<div class="board-title">정보공유 게시판</div>
			<div><h3>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</h3></div>
			<div>
				<div><i class="fa-regular fa-clock"></i> <span id="createDate">${board.boardCreateDate}</span></div>
				<div><i class="fa-solid fa-eye"></i> <span id="readCount">${board.readCount}</span></div>
			</div>
			<div>
                <c:forEach items="${board.tagList}" var="hashtag">
                    <div class="categorie"># ${hashtag.tagContent}</div>
                </c:forEach>
				<div class="title">${board.boardTitle}</div>
			</div>
		</div>

		<div id="detail-container">
			<div id="board-detail-area">
                <div id="board-content-area">${board.boardContent}</div>
                <!-- 좋아요 영역 -->
                <div class="board-like">
                    <c:if test="${empty likeCheck}" >
                        <div class="like-cnt" id="like-cnt">
                            <i class="like-btn fa-solid fa-heart fa-2x"></i>
                        </div>
                    </c:if>

                    <c:if test="${!empty likeCheck}" >
                        <div class="like-cnt" id="like-cnt" style="background-color: #99E1ED">
                            <i class="like-btn fa-solid fa-heart fa-2x"></i>
                        </div>
                    </c:if>
                </div>
                <div class="likeCount">${board.likeCount}</div>

                <!-- 버튼 영역 -->
                <div class="detail-btn-area">
                    <div>
                        <button id="goToListBtn">목록으로</button>
                    </div>

                    <c:if test="${!empty loginMember}">
                        <div id="social-btn-area">
                            <button id="kakao-share-btn" onclick="shareMessage()">
                                <img id="kakao-logo" src="/resources/images/freeBoard/kakaotalk_logo.png">
                                &nbsp;카카오톡 공유하기
                            </button>
                        </div>
                    </c:if>

                    <c:if test="${loginMember.memberNo == board.memberNo || loginMember.authority == 2}">
                        <div>
                            <button id="updateBtn">수정하기</button>
                            <button id="deleteBtn">삭제하기</button>
                        </div>
                    </c:if>
                </div>
            </div>
		</div>

		<!-- 댓글 영역 -->
        <jsp:include page="/WEB-INF/views/board/comment.jsp"></jsp:include>
	</section>

    <script>
        const boardNo = "${board.boardNo}";
        const boardMemberNo = "${board.memberNo}";
        const loginMemberNo = "${loginMember.memberNo}";

        const title = "${board.boardTitle}";
        const content = '${board.boardContent}';
    </script>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- informationBoardDetail.js 연결 -->
	<script src="/resources/js/board/informationBoard/informationBoardDetail.js"></script>
    <!-- comment.js 연결 -->
    <script src="/resources/js/board/comment.js"></script>
	
</body>
</html>