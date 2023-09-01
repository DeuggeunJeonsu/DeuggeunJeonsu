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
                <form action="/member/findId" method="post" id="findIdFrm">
                    <legend><p>아이디 찾기</p></legend>
                    <section class="input-box">
                        <input class="width30" type="text" name="memberPhone" placeholder="휴대폰"/>
                        -
                        <input class="width30" type="text" name="memberPhone" />
                        -
                        <input class="width30" type="text" name="memberPhone" />
                    </section>

                    <section class="input-box">
                        <input class="width65" type="text" name="idAuthenticationKey" placeholder="인증번호 입력" />
                        <button type="button" id="sendSmsBtn">인증번호 전송</button>
                    </section>

                    <section>
                        <!-- <span id="smsTimer">타이머</span> -->
                    </section>

                    <button id="findIdBtn">등록 정보로 아이디 찾기</button>
                </form>

                <form action="/member/findPw" method="post" id="findPwFrm">
                    <legend><p>비밀번호 찾기</p></legend>
                    <section class="input-box">
                        <input class="width100" type="text" name="memberEmail" placeholder="아이디(이메일)"/>
                    </section>

                    <section class="input-box">
                        <input class="width65" type="text" name="pwAuthenticationKey" placeholder="인증번호 입력" />
                        <button type="button" id="sendEmailBtn">인증번호 전송</button>
                    </section>

                    <section>
                        <!-- <span id="emailTimer">05:00</span> -->
                    </section>

                    <button id="findPwBtn">등록 정보로 비밀번호 찾기</button>
                </form>
            </section>

        </main>
        
    </body>

    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/member/findInfo.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>