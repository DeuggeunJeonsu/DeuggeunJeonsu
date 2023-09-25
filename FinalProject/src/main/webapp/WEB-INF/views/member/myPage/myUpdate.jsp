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

    

<form action="info" method="POST" name="myPageFrm" id="updateInfo">

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
            <input type="text" name="memberNickname" 
            placeholder="nickname" class="aboutUserInfoEdit" id="memberNickname"
            value="${loginMember.memberNickname}"></td>
          </tr>
          <tr>
            <td class="tg-0pky firstBox makeOutLine">이메일</td>
            <td class="tg-0pky makeOutLine" colspan="2">
            <input type="text" name="memberEmail" placeholder="email"
             id="memberEmail" class="aboutUserInfoEdit"
             value="${loginMember.memberEmail}"></td>
          </tr>
</form>

          <tr>
            <td class="tg-0pky firstBox makeOutLine">전화번호</td>
            <td class="tg-0pky makeOutLine"  colspan="2">
            <input type="text" name="memberTel" 
            value="${loginMember.memberTel}" 
            class="aboutUserInfoEdit editTel" id="memberTel">
          </tr>
          <tr>

          <form action="changePw" method="POST" name="myPageFrm" id="changePwFrm">
          <tr>
            <td class="tg-0pky firstBox makeOutLine" rowspan="3">비밀번호</td>
          </tr>
          <td>
              <label for="newPw" class="changePW">새 비밀번호</label>
              <input type="password" name="newPw" placeholder="" 
              class="aboutUserInfoEdit aboutPW" id="newPw">
            </td>
          <tr>
          <td class="makeOutLine2">
            <label for="reNewID" class="changePW">비밀번호 다시 입력</label>
            <input type="password" name="newPwConfirm" placeholder="" 
            class="aboutUserInfoEdit aboutPW" id="newPwConfirm">
          </td>    
          </tr>

          </form>

            <td colspan="2" class="updateUserInfo makeOutLine">   <input type="submit" value="회원 정보 업데이트" id="updateUserInfo">
            </td>
          </tr>
        </tbody>

        <form action="profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">

            <div class="myPageProfile2">

            <c:if test="${empty loginMember.profileImage}" >
                    <img src="../../../../resources/images/user.png">
            </c:if>

            <c:if test="${!empty loginMember.profileImage}" >
                    <img src=${loginMember.profileImage} id="profileImage">
            </c:if>
                </div>
            </div>
            <span id="deleteImage">x</span>

            <div class="profile-btn-area">
                <label for="imageInput">이미지 선택</label>
                <input type="file" name="profileImage" id="imageInput" accept="image/*">
                <button>변경하기</button>

      </form>
        
        </table>
        </div>
        </div>

            <script src="/resources/js/member/myPage/myUpdate.js"></script>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        
</body>
</html>