<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>정보공유 게시판</title>

    <%-- freeBoardWrite-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/informationBoard/informationBoardWrite-style.css">

    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
<!-- include libraries(bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">정보공유 게시판 ㅣ 글쓰기</div>
            <div>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</div>
        </div>

        <div id="middle-area">
            <form action="/board2/1/insert" method="POST" id="write-form">
                
                <div id="title-middle-area">
                    <select id="tagSelect">
                        <option value="">태그선택</option>
                        <option value="건강정보">건강정보</option>
                        <option value="운동정보">운동정보</option>
                        <option value="최근동향">최근동향</option>
                    </select>
                    <textarea name="boardTitle" id="title-textArea" placeholder="제목을 입력해 주세요."></textarea>
                </div>

                <textarea name="boardContent" id="summernote" ></textarea>

                <div id="button-area">
                    <button class="btnStyle" id="write-btn">작성</button>
                    <button class="btnStyle" id="cancel-btn" type="button">취소</button>
                </div>

                <input type="hidden" name="imgSrc" value="">
                <input type="hidden" name="tagContent" value="">
                <input type="hidden" name="cp" value="${param.cp}">
            </form>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <!-- informationBoardWrite.js 연결 -->
	<script src="/resources/js/board/informationBoard/informationBoardWrite.js"></script>

</body>
</html>