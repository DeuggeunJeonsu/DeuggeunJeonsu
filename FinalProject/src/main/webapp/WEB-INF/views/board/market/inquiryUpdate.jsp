<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>상품 문의 수정</title>

    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

    <%-- inquireWrite-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/inquireWrite-style.css">
    <!-- Font Awesome CDN 추가 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
          crossorigin="anonymous">

    <!-- SweetAlert2 CSS 파일 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JavaScript 파일 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- include libraries(bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<section id="main-container">
    <div id="title-area">
        <div>
            <h1>상품 문의 | 수정하기</h1>
        </div>
        <div>상품 문의 게시글을 수정할 수 있습니다.</div>
    </div>

    <div id="middle-area">
        <form action="/board/update/${inquiryNo}" method="POST" id="inquireForm" enctype="multipart/form-data">
            <div id="title-middle-area">
                <input type="text" name="inquiryTitle" id="inquireTitle" placeholder="제목" value="${inquiry.inquiryTitle}" placeholder="제목을 입력해주세요" maxlength="10">
            </div>
            <br>

            <div>
                <textarea name="inquiryContent" id="inquireContent" value="${inquiry.inquiryContent}" cols="110" rows="15" placeholder="문의 내용을 입력해주세요" maxlength="500">${inquiry.inquiryContent}</textarea>
            </div>

            <div class="fileBox previewImage">
                <img src="${inquiry.uploadImage}" class="src">
                <input class="uploadFileName" value="${inquiry.uploadImage}" disabled="disabled" style="width: 300px;">
                <label for="file1">사진업로드</label>
                <input type="file" name="inquiryImage" id="file1" class="inputHidden">
                <button id="deleteImage" type="button">삭제</button>
            </div>

            <br>
            <div id="button-area">
                <button type="submit" id="submit-button">수정</button>
                <button type="button" class="btnStyle" id="cancel-btn">취소</button>
            </div>
            <input type="hidden" name="cp" value="${param.cp}">
            <input type="hidden" name="imageDeleted" id="imageDeleted" value="false">
        </form>
    </div>

</section>

<script>
    const loginMember = "${loginMember}";
    const inquiryNo = "${inquiry.inquiryNo}";
    const uploadImage = "${inquiry.uploadImage}";
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script src="/resources/js/market/inquiryUpdate.js"></script>
</body>

</html>