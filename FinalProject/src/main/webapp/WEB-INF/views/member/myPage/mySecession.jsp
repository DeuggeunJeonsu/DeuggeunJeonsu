<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/member/myPage/mySecession-style.css">
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="main-css">
    
    <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>
      <center>
      <div class="center-css">
         <h2>회원탈퇴신청
     <hr style="width:20%; height:2px; background-color:#000;"></h2>
      <div>
        회원 탈퇴하시는 사유를 체크해주시면,<br>서비스 개선에 중요한 자료로 활용하겠습니다.
      </div>
      <br>  
     <div style="width:340px; text-align:left">
      <div class="radio_form">
           <input type="radio" id="radioimg1" name="radio_form" value="1">
                <label for="radioimg1;">이유 없음</label>
            </div>
    
      <div class="radio_form">
      <input type="radio" id="radioimg2" name="radio_form" value="2">
       <label for="radioimg2">이용이 불편하고 장애가 많아서</label>
            </div>
          
      <div class="radio_form">
      <input type="radio" id="radioimg3" name="radio_form" value="3">
                <label for="radioimg3">원하는 제품이 없어서</label>
            </div>
     
      <div class="radio_form">
       <input type="radio" id="radioimg4" name="radio_form" value="4">
        <label for="radioimg4">방문 횟수가 거의 없음</label>
      </div>
    
      <div class="radio_form">
      <input type="radio" id="radioimg5" name="radio_form" value="5">
       <label for="radioimg5">더 이상의 지속의사 없음</label>
            </div>
      
      <div class="radio_form">
      <input type="radio" id="radioimg6" name="radio_form" value="6">
         <label for="radioimg6">기타</label>
       </div>
         
       </div>
        
        <br>
      
      <form action="secession" method="POST" name="myPageFrm" id="secessionFrm">
      <div style="font-weight : bold;">
       
        <div>
        <label class="imp">비밀번호</label>
        <input type="password" placeholder="비밀번호를 입력해주세요." id="memberPw" name="memberPw" required>
      </div>

        <hr>

      <div>
        <label class="imp">비밀번호 확인</label>
        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요." id="memberPwConfirm" name="memberPwConfirm" required>
        <p class="signUp-message" id="pwMessage">영어,숫자,특수문자 8~16자 사이로 입력해주세요.</p>
      </div>

      

      <hr>

      <br>
       
        <span class="box-shadow">득근전수 회원 탈퇴 전 꼭!확인해주세요.</span>
       
        <br>
      </div>
      <div style="width:550px; color : red">   
     <br> - 회원 탈퇴하시면 사용 중인 아이디로는 재가입이 불가능합니다.<br>- 탈퇴 시 잔여 적립금, 포인트는 소멸됩니다.
       <br>
           <br>
        </div>
      <div class="all_agree">
        <input type="checkbox" id="agree" name="agree"/>
        <label >위 내용을 모두 확인하였으며, 이에 동의합니다. </label> 
      </div>
       <br>
                
      <div>
     <button type="submit"style="border:1px solid rgba(52, 196, 219, 0.5);
     border-radius:20px;width:90px;height:36px;
     background:rgba(52, 196, 219, 0.5) ; color:white;font-size:16px;  cursor: pointer;">확인</button>
          </center>
    </div>

    </form>

         <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

         <script src="/resources/js/member/myPage/secession.js"></script>


        </body>
        </html>
