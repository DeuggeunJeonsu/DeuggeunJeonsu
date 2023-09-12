<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>건강/운동정보</title>

    <%-- freeBoardWrite-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/informationBoard/informationBoardWrite-style.css">

    <%-- <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script> --%>

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

	<section id="main-container">
        <div id="title-area">
            <div><h1> 건강/운동정보</h1> <h3>ㅣ 게시글 작성</h3></div>
            <div>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</div>
        </div>

        <div id="middle-area">
            <form action="#" id="write-form">
                
                <div id="title-middle-area">
                    <select name="tagSelect" id="tagSelect">
                        <option value="">태그선택</option>
                        <option value="health">건강정보</option>
                        <option value="fitness">운동정보</option>
                        <option value="trends">최근동향</option>
                    </select>
                    <textarea name="title-textArea" id="title-textArea" placeholder="제목을 입력해 주세요."></textarea>
                </div>

                <textarea name="summernote" id="summernote"></textarea>

                <div id="button-area">
                    <button class="btnStyle" id="write-btn">작성</button>
                    <button class="btnStyle" id="cancel-btn">취소</button>
                </div>

            </form>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <!-- informationBoardWrite.js 연결 -->
	<script src="/resources/js/board/informationBoard/informationBoardWrite.js"></script>

</body>
</html>