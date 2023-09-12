<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>로그인 페이지</title>
        <link rel="stylesheet" href="/resources/css/member/bmi-style.css">
        <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
    </head>

    <body>

        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <main>

            <section class="title-area">
                <p>BMI 계산하기</p>
                <p>비만도 체크하고 건강관리 해보세요 </p>
            </section>

            <form action="/member/login" method="post" id="loginFrm">
                
            </form>

        </main>
        
    </body>

    <script src="/resources/js/main.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>