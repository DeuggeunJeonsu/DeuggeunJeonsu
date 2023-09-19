<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>아이디/비밀번호 찾기</title>
        <link rel="stylesheet" href="/resources/css/member/findInfo-style.css">

        <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
    </head>

    <body>
        
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <main>

            <section class="title-area">
                <p>회원 정보를 잊으셨나요?</p>
                <p>가입 시 입력한 정보를 통해 내 회원 정보를 찾아보세요.</p>
            </section>

            <section>
                <div class="find-area" id="idArea">
                    <p>아이디 찾기</p>
                    <section class="input-box">
                        <input type="text" class="width30" name="memberTel" placeholder="휴대폰" autocomplete="off"/>
                        -
                        <input type="text" class="width30" name="memberTel" autocomplete="off"/>
                        -
                        <input type="text" class="width30" name="memberTel" autocomplete="off"/>
                    </section>

                    <section class="input-box">
                        <input class="width65" type="text" id="idAuthenticationKey" placeholder="인증번호 입력" autocomplete="off"/>
                        <button class="findInfo-btn" id="sendSmsBtn">인증번호 전송</button>
                    </section>

                    <section class="timerSection">
                        <div id="smsTimer"></div> <!-- 아이디 찾기 인증 타이머 -->
                    </section>

                    <button class="findInfo-btn" id="findIdBtn">등록 정보로 아이디 찾기</button>
                </div>

                <div class="find-area" id="pwArea">
                    <p>비밀번호 찾기</p>
                    <section class="input-box">
                        <input class="width100" type="text" id="memberEmail" placeholder="아이디(이메일)" autocomplete="off"/>
                    </section>

                    <section class="input-box">
                        <input class="width65" type="text" id="pwAuthenticationKey" placeholder="인증번호 입력" autocomplete="off"/>
                        <button type="button" class="findInfo-btn" id="sendEmailBtn">인증번호 전송</button>
                    </section>

                    <section class="timerSection">
                        <div id="emailTimer"></div> <!-- 비밀번호 변경 인증 타이머 -->
                    </section>

                    <button class="findInfo-btn" id="findPwBtn">등록 정보로 비밀번호 찾기</button>
                </div>
            </section>

            <div id="resultArea">
                <div id="resultContentArea">
                    <div>
                        <p>조회된 회원님의 아이디</p>
                        <span id="idResult"></span>
                    </div>
                    <div>
                        <button class="findInfo-btn" id="resultRoginBtn">로그인 하러가기</button>
                        <button class="findInfo-btn" id="resultFindPwBtn">비밀번호 찾기</button>
                    </div>
                    <span id="resultCloseBtn">&times</span>
                </div>
            </div>

        </main>
        
    </body>

    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/member/findInfo.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>