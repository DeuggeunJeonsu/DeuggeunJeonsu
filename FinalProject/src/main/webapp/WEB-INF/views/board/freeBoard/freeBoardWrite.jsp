<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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

<%-- freeBoardWrite-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/freeBoard/freeBoardWrite-style.css">

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
            <div class="board-title">자유 게시판 ㅣ 글쓰기</div>
            <div>자유 게시판 게시글을 작성할 수 있습니다.</div>
        </div>

        <div id="middle-area">
            <form action="/board2/3/insert" method="POST" id="write-form">

                <div id="title-middle-area">
                    <input placeholder="제목을 입력해 주세요." name="boardTitle" id="title-textArea">
                </div>

                <div id="hashtag-area">
                    <div>
                        <input type="text" id="hashtag-textArea" placeholder="#해시태그 추가">
                    </div>
                    <div id="hashtag-making-area">
                        <!-- <input type="text" readonly class="hashtag">
                        #오운완
                        <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                        </input>
                        <div class="hashtag">#OOTD</div> -->
                    </div>
                </div>

                <textarea id="summernote" name="boardContent"></textarea>
                <input type="hidden" name="imgSrc" value="">
                
                <div id="button-area">
                    <button class="btnStyle" id="write-btn">작성</button>
                    <button type="button" class="btnStyle" id="cancel-btn">취소</button>
                </div>

                <input type="hidden" name="hashtags">
                <input type="hidden" name="cp" value="${param.cp}">
            </form>
        </div>

	</section>


    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <!-- freeBoardWrite.js 연결 -->
	<script src="/resources/js/board/freeBoard/freeBoardWrite.js"></script>

</body>
</html>