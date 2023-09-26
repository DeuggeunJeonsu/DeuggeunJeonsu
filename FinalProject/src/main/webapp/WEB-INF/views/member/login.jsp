<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>로그인 페이지</title>
        <link rel="stylesheet" href="/resources/css/member/login-style.css">
        <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
    </head>

    <body>

        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <main>

            <section class="title-area">
                <p>로그인</p>
                <p>어서오세요, 득근전수에 오신걸 환영합니다.</p>
            </section>

            <form action="/member/login" method="post" id="loginFrm">
                <section class="input-box">
                    <input type="text" name="memberEmail" placeholder="아이디(이메일)" value="${cookie.saveId.value}" />
                </section>

                <section class="input-box">
                    <input type="password" name="memberPw" placeholder="비밀번호" />
                </section>

                <%-- 쿠키에 saveId가 있는 경우--%>
                <c:if test="${!empty cookie.saveId.value}">
                    <%-- chk 변수 생성(page scope)--%>
                    <c:set var="chk" value="checked"/>
                </c:if>

                <div class="saveId-area">
                    <input type="checkbox" name="saveId" id="saveId" ${chk}>
                    <label for="saveId"><i class="fas fa-check"></i>아이디 저장</label>
                </div>

                <p class="text-area">
                    <a href="/member/signUp">회원가입</a>
                    <a href="/member/findInfo">아이디/비밀번호 찾기</a>
                </p>

                <button type="submit" class="login-btn">득근전수 로그인</button>

                <button type="button" class="kakao-login-btn">카카오톡 로그인</button>
            </form>

        </main>
        
    </body>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>