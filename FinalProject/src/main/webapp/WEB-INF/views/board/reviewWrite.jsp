<%-- ------------ ------------ ------------ ------------ ------------ ------------ ------------ -------------%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>상품 문의</title>

    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

    <%-- inquireWrite-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/board/reviewWrite-style.css">

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
<%--<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">--%>
<%--<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>--%>

<section id="main-container">
    <div id="title-area">
        <div>
            <h1>리뷰 작성하기</h1>
        </div>
        <div class="tip">구매하신 상품에 대한 리뷰를 작성하여 득근전수 회원님들에게 공유해 보세요🍀</div>
    </div>

    <div id="middle-area">
        <form action="/board/${boardCode}/review/${productNo}/insert" method="POST" id="reviewForm" enctype="multipart/form-data">

            <div id="title-middle-area">
                <input type="text" name="reviewTitle" id="reviewTitle" placeholder="제목" value="" maxlength="10" placeholder="제목을 입력해주세요">
            </div>
            <br>

            <div>
                  <textarea name="reviewContent" id="reviewContent" cols="110" rows="15" placeholder="내용을 입력해주세요"></textarea>
            </div>

            <div class="fileBox previewImage">
                <input class="uploadFileName" value="파일선택" disabled="disabled" style="width: 300px;">
                <label for="file1">사진업로드</label>
                <input type="file" name="reviewImage" id="file1" class="inputHidden">
                <button id="deleteImage" type="button">삭제</button>
            </div>

            <br>
            <div id="button-area">
                <button type="submit" id="submit-button" onclick="showAlert()">작성</button>
                <button type=button id="cancel-button">취소</button>
            </div>
        </form>
    </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
    const loginMember = "${loginMember}";
</script>
<script src="/resources/js/market/reviewWrite.js"></script>
</body>

</html>