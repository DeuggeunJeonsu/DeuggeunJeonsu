<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 탈퇴</title>

  <%-- mySecession-style.css 연결 --%>
  <link rel="stylesheet" href="/resources/css/member/myPage/mySecession-style.css">

  <%-- myPageSideBar-style.css 연결 --%>
  <link rel="stylesheet" href="/resources/css/member/myPage/myPageSideBar-style.css">

  <%-- alert창 바꿔 주는 스크립트 연결 --%>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">

  <%-- 헤더 아이콘 --%>
  <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
</head>

<body>

  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

  <section id="main-container">

    <!-- 마이페이지 사이드바 include -->
    <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

    <div id="right-content-area">

      <div id="title-area">
        <div><h1>회원 탈퇴</h1></div>
        <div>득근전수 회원 탈퇴를 할 수 있습니다.</div>
      </div>

      <div id="main-content-area">

        <div id="middle-content-area">

          <div id="middle-content">
            <div>
              <i class="fa-solid fa-circle-exclamation fa-6x" style="color: #99e1ed; margin-top: 150px;"></i>
            </div>
            
            <div>
              회원 탈퇴 사유를 체크해 주시면 서비스 개선에 중요한 자료로 활용하겠습니다.
            </div>
          </div>

        </div>

        <div id="radio-form">

          <div>
            <input type="radio" id="radioimg1" name="radio_form" value="1">
            <label for="radioimg1">이유 없음</label>
          </div>

          <div>
            <input type="radio" id="radioimg2" name="radio_form" value="2">
            <label for="radioimg2">이용이 불편하고 장애가 많음</label>
          </div>

          <div>
            <input type="radio" id="radioimg3" name="radio_form" value="3">
            <label for="radioimg3">원하는 제품이 없음</label>
          </div>

          <div>
            <input type="radio" id="radioimg4" name="radio_form" value="4">
            <label for="radioimg4">방문 횟수가 거의 없음</label>
          </div>

          <div>
            <input type="radio" id="radioimg5" name="radio_form" value="5">
            <label for="radioimg5">더 이상의 지속 의사 없음</label>
          </div>

          <div>
            <input type="radio" id="radioimg6" name="radio_form" value="6">
            <label for="radioimg6">기타</label>
          </div>

        </div>

      </div>
      
      <form action="secession" method="POST" name="myPageFrm" id="secessionFrm">
      
        <div id="secession-pw-input-area">

          <!-- <div>
            <i class="fa-solid fa-check" style="color: #99e1ed;"></i>
            &nbsp;비밀번호를 입력해 주세요.
          </div> -->

          <div id="secession-pw-input">
            <input type="password" id="memberPw" name="memberPw" maxlength="30" required>
            <label>
              <i class="fa-solid fa-check" style="color: #99e1ed;"></i>
              &nbsp;비밀번호를 입력해 주세요.
            </label>
            <span></span>
          </div>

        </div>
        
        <div id="secession-notice-area">   

          <div id="secession-notice">
            <i class="fa-solid fa-check" style="color: #99e1ed;"></i>
            &nbsp;회원 탈퇴 전 꼭! 확인해 주세요.
          </div>

          <div>
            <ul id="secession-list">
              <li>
                - 탈퇴한 아이디는 다시 복구하실 수 없습니다.
              </li>
              <li>
                - 회원 탈퇴하시면 사용 중인 아이디로는 재가입이 불가능합니다.
              </li>
            </ul>
          </div>

        </div>
        
        <div class="all-agree">

          <input type="checkbox" id="agree" name="agree"/>
          <label for="agree">
            <span>위 내용을 모두 확인하였으며, 이에 동의합니다.</span>
          </label> 

          <div>
            <button id="secession-form-submit-btn" type="submit">확인</button>
          </div>

        </div>
                  
      </form>
  
  </section>

  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  <%-- secession.js 연결 --%>
  <script src="/resources/js/member/myPage/secession.js"></script>

</body>
</html>
