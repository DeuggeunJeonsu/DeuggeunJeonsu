<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 이름</title>

<%-- 헤더 아이콘 --%>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
<link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

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

	<section id="main-container">
        <div id="title-area">
            <div><h1>자유 게시판 ㅣ 글쓰기</h1></div>
            <div>자유 게시판 게시글을 작성할 수 있습니다.</div>
        </div>

        <div id="middle-area">
            <form action="/board2/3/insert" method="POST" id="write-form" accept-charset="UTF-8">
                
                <%-- <div id="title-middle-area">
                    <textarea placeholder="제목을 입력해 주세요." id="title-textArea"></textarea>
                </div>

                <div id="hashtag-area">
                    <div>
                        <input type="text" id="hashtag-textArea" placeholder="#해시태그 추가">
                    </div>
                    <div id="hashtag-making-area">
                        <!-- <div class="hashtag">#오운완</div>
                        <div class="hashtag">#OOTD</div> -->
                    </div>
                </div>

                <div id="content-area">
                    <textarea placeholder="회원님의 이야기를 들려주세요." id="content-textArea"></textarea>
                </div>

                <div id="button-area">
                    <button class="btnStyle" id="write-btn">작성</button>
                    <button class="btnStyle" id="cancel-btn">취소</button>
                </div> --%>

                <div id="title-middle-area">
                    <textarea placeholder="제목을 입력해 주세요." name="boardTitle" id="title-textArea" value="제목"></textarea>
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

                <textarea id="summernote" name="boardContent">내용입니다.</textarea>
                
                <div id="button-area">
                    <button class="btnStyle" id="write-btn">작성</button>
                    <button type="cancel" class="btnStyle" id="cancel-btn">취소</button>
                </div>

                <input type="hidden" name="hashtags">
            </form>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <!-- freeBoardWrite.js 연결 -->
	<script src="/resources/js/board/freeBoard/freeBoardWrite.js"></script>

</body>
</html>