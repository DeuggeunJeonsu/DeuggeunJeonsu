
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 리뷰 수정</title>

    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

    <%-- freeBoardWrite-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/market/reviewUpdate-style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- include libraries(bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<section id="main-container">
    <div id="title-area">
        <div><h1>상품 리뷰 ㅣ 수정하기</h1></div>
        <div>상품 리뷰 게시글을 수정할 수 있습니다.</div>
    </div>

    <div id="middle-area">
        <form action="/board/${reviewNo}/update" method="POST" id="write-form" enctype="multipart/form-data">

            <div id="title-middle-area">
                <input placeholder="제목을 입력해 주세요." name="reviewTitle" id="title-textArea" value="${review.reviewTitle}">
            </div>
            <br>

            <div>
                <textarea name="reviewContent" id="reviewContent"
                          cols="110" rows="15" value="${review.reviewContent}">${review.reviewContent}</textarea>
            </div>

            <div class="fileBox previewImage">
                <img src="${review.uploadImage}" class="src">
                <input class="uploadFileName" disabled="disabled" style="width: 300px;" value="${review.uploadImage}">
                <label for="file1">사진업로드</label>
                <input type="file" name="reviewImage" id="file1" class="inputHidden" value="${review.uploadImage}">
                <button id="deleteImage" type="button">삭제</button>
            </div>

            <div id="button-area">
                    <button type="submit" class="btnStyle" id="write-btn">수정</button>
                    <button type="button" class="btnStyle" id="cancel-btn">취소</button>
            </div>

            <input type="hidden" name="cp" value="${param.cp}">
            <input type="hidden" name="imageDeleted" id="imageDeleted" value="false">
        </form>
    </div>

</section>

<script>
    const boardCode = "${review.boardCode}";
    const reviewNo = "${review.reviewNo}";
    const uploadImage = "${review.uploadImage}";
</script>

<!-- footer include -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script src="/resources/js/market/reviewUpdate.js"></script>


</body>
</html>