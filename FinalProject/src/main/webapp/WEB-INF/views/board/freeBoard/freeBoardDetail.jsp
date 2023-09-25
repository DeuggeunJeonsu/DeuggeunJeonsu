<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

<%-- alert창 바꿔 주는 스크립트 연결 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">

<%-- GSAP 라이브러리 추가 --%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 

<%-- freeBoardDetail-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/freeBoard/freeBoardDetail-style.css">

<%-- 카카오 라이브러리 추가 --%>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js" integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
<script>
// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
Kakao.init('5600ed391bce28878bbfdfcae636db6e');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());
</script>

<script>
    const followCheck = "${followCheck}";
</script>

</head>
<body>

    <%-- mojs 라이브러리 추가 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mo-js/1.6.0/mo.umd.min.js"></script>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">자유 게시판</div>
            <div><h3>득근전수 회원님들이 자유롭게 이야기를 나누는 공간입니다.</h3></div>
        </div>

        <div id="detail-container">

            <!-- 게시글 제목 -->
            <div id="title-middle-area">
                <div id="title">${board.boardTitle}</div>
                <div>
                    <div id="writing-date">작성일&nbsp;&nbsp;${board.boardCreateDate}&nbsp;&nbsp;&nbsp;&nbsp;</div> | <div id="readCount">조회수&nbsp;&nbsp;${board.readCount}</div>
                </div>
            </div>

            <!-- 게시글 작성자 정보 -->
            <div id="writer-info-area">

                <div id="profile-area">
                    <c:if test="${empty board.profileImage}" >
                        <img src="/resources/images/user.png">
                    </c:if>

                    <c:if test="${!empty board.profileImage}" >
                        <img src="${board.profileImage}">
                    </c:if>
                </div>

                <div id="nick-area">
                    
                    <div id="nickname"><a href="/myPage/memberFeed/${board.memberNo}">${board.memberNickname}</a></div>
                    <div>
                        <c:if test="${board.memberNo != loginMember.memberNo && loginMember != null}">

                            <c:if test="${empty followCheck}">
                                <button id="follow-btn">
                                    <i class="fa-solid fa-circle-plus whiteChk2" style="color: #ffffff; display: none"></i>
                                    <i class="fa-solid fa-circle-plus blueChk2" style="color: #99e1ed;"></i>
                                    follow
                                </button>
                            </c:if>

                            <c:if test="${!empty followCheck}">
                                <button id="following-btn">
                                    <i class="fa-solid fa-circle-check whiteChk" style="color: #ffffff;"></i>    
                                    <i class="fa-solid fa-circle-check blueChk" style="color: #99e1ed; display: none"></i>
                                    following
                                </button>
                            </c:if>

                        </c:if>
                    </div>
                </div>

            </div>
    
            <!-- 게시글 해시태그 영역 -->
            <div id="hashtag-area">

                <c:if test="${!empty board.tagList}" >

                    <c:forEach items="${board.tagList}" var="hashtag">
                        <a href="/board/3/list?key=ht&query=${hashtag.tagContent}">
                            <div class="hashtag">#${hashtag.tagContent}</div>
                        </a>
                    </c:forEach>

                </c:if>
                
            </div>
    
            <!-- 게시글 상세 조회 내용 영역 -->
            <div id="board-detail-area">

                <div id="board-content-area">${board.boardContent}</div>
    
                <!-- 게시글 버튼 영역 -->
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

                <div id="btn-area">
                    <div>
                        <button id="goToListBtn">목록으로</button>
                        
                        <c:if test="${!empty loginMember}">
                            <div id="social-btn-area">
                                <button id="kakao-share-btn" onclick="shareMessage()">
                                    <img id="kakao-logo" src="/resources/images/freeBoard/kakaotalk_logo.png">
                                    &nbsp;카카오톡 공유하기
                                </button>
                            </div>
                        </c:if>

                        <c:if test="${loginMember.memberNo == board.memberNo}">

                            <div>
                                <button id="updateBtn">수정하기</button>
                                <button id="deleteBtn">삭제하기</button>
                            </div>
                        </c:if>
                    </div>
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

        const profile = "${board.profileImage}";
        const nickname = "${board.memberNickname}";
        const title = "${board.boardTitle}";
        const content = '${board.boardContent}';
    </script>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- freeBoardDetail.js 연결 -->
	<script src="/resources/js/board/freeBoard/freeBoardDetail.js"></script>
    <!-- comment.js 연결 -->
    <script src="/resources/js/board/comment.js"></script>

</body>
</html>

