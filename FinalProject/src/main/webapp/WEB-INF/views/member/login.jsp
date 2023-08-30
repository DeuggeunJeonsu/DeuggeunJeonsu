<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">


<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>


    <link rel="stylesheet" href="/resources/css/member/login-style.css">

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
                <input type="text" name="memberEmail" placeholder="Email" value="${cookie.saveId.value}" />
            </section>


            <section class="input-box">
                <input type="password" name="memberPw" placeholder="Password" />
            </section>


            <%-- 쿠키에 saveId가 있는 경우--%>
            <c:if test="${ !empty cookie.saveId.value}">
                <%-- chk 변수 생성(page scope)--%>
                <c:set var="chk" value="checked"/>
            </c:if>


            <div class="saveId-area">
                <input type="checkbox" name="saveId" id="saveId" ${chk}>
                <label for="saveId"><i class="fas fa-check"></i>아이디 저장</label>
            </div>


            <p class="text-area">
                <a href="#">회원가입</a>
                <a href="#">아이디/비밀번호 찾기</a>
            </p>

            <button class="login-btn">득근전수 로그인</button>

            <button class="kakao-login-btn">카카오톡 로그인</button>
        </form>
    </main>

    
    <%-- main.js 추가 --%>
    <script src="/resources/js/main.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>