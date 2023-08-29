<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">


<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>hc17</title>

  <link rel="stylesheet" href="/resources/css/member/signUp-style.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>


<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

  <form>

    <div class="membership">

      <div>
        <label class="imp">아이디(이메일)</label>
        <div>
          <input type="text" placeholder="예 : email@gmail.com" required>
          <button type="button">중복확인</button>
        </div>
      </div>

      <div>
        <label class="imp">비밀번호</label>
        <input type="password" placeholder="비밀번호를 입력해주세요." required>
      </div>

      <div>
        <label class="imp">비밀번호 확인</label>
        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요." required>
      </div>

      <div>
        <label class="imp">닉네임</label>
        <input type="text" placeholder="닉네임을 입력해주세요" required>
      </div>

      <div>
        <label class="imp">휴대폰</label>
        <div>
          <input type="tel" placeholder="숫자만 입력해주세요" required>
          <button type="button">인증번호받기</button>
        </div>
      </div>

      <div>
        <div>
          <input type="tel" placeholder="인증번호 입력" required id="tel2">
          <button type="button">인증번호확인</button>
        </div>
      </div>

      <div>
        <label class="imp">주소</label>
        <div>
          <input type="text" placeholder="도로명, 지번, 건물명 검색" required>
        </div>
        <p>배송지에 따라 상품 정보가 달라질 수 있습니다.</p>
      </div>

      <div>
        <label>생년월일</label>
        <div>
          <input type="text" name="birth_year" id="birth_year" pattern="[0-9]*" value label="생년월일" size="4" maxlength="4"
            placeholder="YYYY">
          <span>/</span>
          <input type="text" name="birth_month" id="birth_month" pattern="[0-9]*" value label="생년월일" size="2" maxlength="2"
            placeholder="MM">
          <span>/</span>
          <input type="text" name="birth_day" id="birth_day" pattern="[0-9]*" value label="생년월일" size="2" maxlength="2"
            placeholder="DD">
        </div>
      </div>


      <div>
      </div>
    </div>
    
   

    <button type="submit">가입하기</button>

  </form> 

  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  
</body>


</html>