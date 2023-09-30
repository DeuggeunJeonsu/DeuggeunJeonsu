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
<%--<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">--%>
<%--<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>--%>

<section id="main-container">
    <div id="title-area">
        <div>
            <h1>상품 문의하기</h1>
        </div>
        <div class="tip">문의해 주신 내용은 영업일 기준 2~3일 내에 답변 드립니다🍀</div>
    </div>

    <div id="middle-area">
        <form action="/board/${boardCode}/inquiry/${productNo}/insert" method="POST" id="inquireForm" enctype="multipart/form-data">
            <div>
                <select name="inquiryType" id="inquiryType">
                    <option value="3">--- 상품 문의 유형을 선택해주세요 ---</option>
                    <option value="1">교환</option>
                    <option value="2">취소</option>
                    <option value="3">기타</option>
                </select>
            </div>
            <div id="title-middle-area">
                <input type="text" name="inquiryTitle" id="inquireTitle" placeholder="제목" value="" placeholder="제목을 입력해주세요" maxlength="10">
            </div>
            <br>

            <div>
                <textarea name="inquiryContent" id="inquireContent" cols="110" rows="15" placeholder="문의 내용을 입력해주세요"></textarea>
            </div>

            <div class="fileBox previewImage">
                <input class="uploadFileName" value="파일선택" disabled="disabled" style="width: 300px;">
                <label for="file1">사진업로드</label>
                <input type="file" name="inquiryImage" id="file1" class="inputHidden">
                <button id="deleteImage" type="button">삭제</button>
            </div>
            <br>
            <div id="button-area">
                <button type="submit" id="submit-button" onclick="showAlert()">등록</button>
                <button type="button" class="btnStyle" id="cancel-btn">취소</button>
            </div>
        </form>
    </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
    const loginMember = "${loginMember}";
</script>
<script src="/resources/js/market/inquireWrite.js"></script>
</body>

</html>