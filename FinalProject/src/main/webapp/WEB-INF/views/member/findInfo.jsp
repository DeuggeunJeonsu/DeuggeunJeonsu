<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">


<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>


    <link rel="stylesheet" href="/resources/css/member/findInfo-style.css">

</head>


<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <main>
        <section class="title-area">
            <p>회원 정보를 잊으셨나요?</p>
            <p>가입 시 입력한 정보를 통해 내 회원 정보를 찾아보세요.</p>
        </section>

        <section>
            <legend><p>아이디 찾기</p></legend>
            <form action="/member/findId" method="post" id="findIdFrm">
                <section class="input-box">
                    <input class="width30" type="text" name="memberPhone" placeholder="010"/>
                    <input class="width30" type="text" name="memberPhone" placeholder="1234"/>
                    <input class="width30" type="text" name="memberPhone" placeholder="5678"/>
                </section>
    
                <section class="input-box">
                    <input class="width100" type="text" name="idAuthenticationKey" placeholder="인증번호" />
                </section>
    
                <button class="find-id-btn">등록 정보로 아이디 찾기</button>
            </form>

            <legend><p>비밀번호 찾기</p></legend>
            <form action="/member/changePw" method="post" id="changePwFrm">
                <section class="input-box">
                    <input class="width100" type="text" name="memberEmail" placeholder="아이디"/>
                </section>
    
                <section class="input-box">
                    <input class="width70" type="text" name="pwAuthenticationKey" placeholder="인증번호" />
                </section>
    
                <button class="find-pw-btn">등록 정보로 비밀번호 찾기</button>
            </form>
        </section>
        
    </main>
    
    <%-- main.js 추가 --%>
    <script src="/resources/js/main.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>