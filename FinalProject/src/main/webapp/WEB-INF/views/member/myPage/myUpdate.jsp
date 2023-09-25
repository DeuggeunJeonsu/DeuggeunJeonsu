<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
    <link rel="stylesheet" href="/resources/css/member/myPage/myUpdate-style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
    
    <div id="list">
    <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

    

        <form action="/member/myUpdate" method="POST">
        <div id="title-area">
                <div><h2>내 정보 수정</h2></div>
                <div>회원님의 정보를 수정 할 수 있습니다!</div>
        </div>
         <div id="right-content-area">
            <table class="tg" id="UserTable">
        <tbody>
          <tr>
            <td class="tg-0pky firstBox makeOutLine">닉네임</td>
            <td class="tg-0pky makeOutLine"  colspan="2">
            <input type="text" name="memberNickname" placeholder="nickname" class="aboutUserInfoEdit" id="memberNickname">
            <p class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자</p></td>
          </tr>
          <tr>
            <td class="tg-0pky firstBox makeOutLine">이메일</td>
            <td class="tg-0pky makeOutLine" colspan="2"><input type="text" name="MEMBER_EMAIL" placeholder="email" id="joinMemberEmail" class="aboutUserInfoEdit"></td>
          </tr>
          <tr>
            <td class="tg-0pky firstBox makeOutLine" rowspan="3">비밀번호</td>
          </tr>
          <td>
              <label for="NewPW" class="changePW">새 비밀번호</label><input type="password" name="MEMBER_PW" placeholder="" class="aboutUserInfoEdit aboutPW" id="NewPW">
            </td>
          <tr>
          <td class="makeOutLine2">
            <label for="reNewID" class="changePW">비밀번호 다시 입력</label>
            <input type="password" name="MEMBER_PW" placeholder="" class="aboutUserInfoEdit aboutPW" id="reNewPW">
            <span id="PWFail"></span><span id="PWFailchange">비밀번호가 동일하지 않습니다....</span>
          </td>    
          </tr>
          <tr>
            <td class="tg-0pky firstBox makeOutLine">전화번호</td>
            <td class="tg-0pky makeOutLine"  colspan="2"><input type="tel" name="MEMBER_MOBILE" placeholder="010" value="010" class="aboutUserInfoEdit editTel"id="joinMemberMobilesecond"> - <input type="tel" name="MEMBER_MOBILE" placeholder="" class="aboutUserInfoEdit editTel"> - <input type="tel" name="MEMBER_MOBILE" placeholder="" class="aboutUserInfoEdit editTel"id="joinMemberMobilethird">
            </td>
          </tr>
          <tr>
            <td class="tg-0pky firstBox makeOutLine">생년월일</td>
            <td class="tg-0pky makeOutLine"  colspan="2"><input type="text" name="MEMBER_BIRTH" placeholder="연도 4자 " class="aboutUserInfoEdit birth" id="joinMemberYear">
            <select name="MEMBER_BIRTH" class="aboutUserInfoEdit birth" id="userInfoMonth">
            <option disabled selected>월</option>
                    <option>1월
                    <option>2월
                    <option>3월
                    <option>4월
                    <option>5월
                    <option>6월
                    <option>7월
                    <option>8월
                    <option>9월
                    <option>10월
                    <option>11월
                    <option>12월
            </select>
            <input type="text" name="MEMBER_BIRTH" placeholder="일" class="aboutUserInfoEdit birth" id="joinMemberDay"></td>
          </tr>
          <tr>
            <td colspan="2" class="updateUserInfo makeOutLine">   <input type="submit" value="회원 정보 업데이트" id="updateUserInfo">
            </td>
          </tr>
        </tbody>


        <form action="profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">

        <div class="myPageProfile2">
        <c:if test="" >
                <img src="../../../../resources/images/user.png">
        </c:if>
            </div>
        </div>
        <span id="deleteImage">x</span>

        <div class="profile-btn-area">
            <label for="imageInput">이미지 선택</label>
            <input type="file" name="profileImage" id="imageInput" accept="image/*">
        </form>   
        
        </table>
        
        </form>
        </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        
</body>
</html>