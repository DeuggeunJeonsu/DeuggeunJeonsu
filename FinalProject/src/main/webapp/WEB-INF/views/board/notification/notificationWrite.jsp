<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>건강/운동정보</title>

    <%-- freeBoardWrite-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/notification/notificationWrite-style.css">

    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">


	<!-- alert창 링크 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
            <div><h1> 공지사항</h1> <h3>ㅣ 게시글 작성</h3></div>
            <div>득근전수에서 회원님들에게 공지드립니다.</div>
        </div>

        <div id="middle-area">
            <form action="/board/4/insert" method="post" id="write-form" >
                
                <div id="title-middle-area">
					<div id="ncCheckbox">

						<div id="ncBignews" class="popContent list">
							
                            <input type="hidden" id="checkFL" name="tagNo" value="2">
						</div>

						
					</div>
                    <textarea name="boardTitle" id="title-textArea" placeholder="제목을 입력해 주세요."></textarea>
                </div>

                <textarea name="boardContent" id="summernote"></textarea>

                <div id="button-area">
                    <button class="btnStyle" id="write-btn" onclick="return insertBtn()">작성</button>
                    <button class="btnStyle" id="cancel-btn">취소</button>
                </div>

            </form>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <!-- freeBoardWrite.js 연결 -->
	<script src="/resources/js/board/notification/notificationWrite.js"></script>

</body>

    <script>
		const boardCode = ${boardCode}
	</script>
</html>