<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- map에서 꺼내기 --%>
<c:set var="badgeList" value="${map.badgeList}"/>
<c:set var="badgeCount" value="${map.badgeCount}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/member/myPage/myPageSideBar-style.css">
    <%-- memberInfo-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/member/myPage/memberInfo-style.css">
    
    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">

    <%-- 뱃지 애니메이션 CSS 연결 --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

</head>

<body>
    <%-- header include --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 마이페이지 사이드바 include -->
        <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

        <div id="right-content-area">
            <div id="title-area">
                <div><h1>내 정보 수정</h1></div>
                <div>${loginMember.memberNickname}님 회원정보 수정을 통해 개인 정보를 보호하세요</div>
            </div>

            <div id="main-content-area">
                <form action="info" method="POST" name="myPageFrm" id ="updateInfo">
                    
                    <h1>회원 정보 변경하기</h1>
                    <ul>
                        <li>
                            <span>닉네임</span>
                            <div class="nickArea">
                                <input type="text" name="memberNickname" id="memberNickname"
                                placeholder="한글/숫자 만 가능합니다." value="${loginMember.memberNickname}">
                                <span id="nickMessage"></span>
                            </div>
                            
                        </li>
                        <li>
                            <span>전화번호</span>
                            <div class="info-tel">
                                <input type="text" name="memberTel" id="memberTel"
                                placeholder="(-)제외 입력해주세요 "value="${loginMember.memberTel}">
                                <button type="button" class="findInfo-btn" id="sendSmsBtn">인증번호 받기</button>
                                <input type="text" id="tel-auth-key" placeholder="인증번호 입력">
                                <button type="button"  id="tel-auth-btn">인증번호 확인</button>
                                <span id="smsTimer"></span>
                            </div>
                        </li>
                        <li>
                            <span>주소</span>
                            <c:set var="addr" value="${fn:split(loginMember.memberAddress,'^^^')}"/>
                            <div class="info-address">
                                <input type="text" name="memberAddress" 
                                placeholder="우편번호" value="${addr[0]}" id="sample6_postcode" readonly>
                                <button type="button" onclick="sample6_execDaumPostcode()">검색</button>
                                <input type="text" name="memberAddress" 
                                placeholder="도로명/지번 주소"value="${addr[1]}" id="sample6_address" readonly>
                                <input type="text" name="memberAddress" 
                                placeholder="상세주소"value="${addr[2]}" id="sample6_detailAddress">
                            </div>
                        </li>
                    
                    </ul>
                    <h1>비밀번호 변경하기</h1>
                    <ul>
                        <li>
                            <span>비밀번호</span>
                            <input type="password" name="newPw" id="newPw" maxlength="30"
                            placeholder="새로운 비밀번호를 입력해 주세요" >
                        </li>
                        <li>
                            <span>비밀번호 확인</span>
                            <input type="password" name="memberPwConfirm" id="newPwConfirm" maxlength="30"
                            placeholder="다시 입력해주세요">
                        </li>
                    
                    </ul>
                    <div class="btnArea">
					    <button class="button btnPush btnLightBlue" type="submit">수정하기</button>
				    </div> 
                </form>


            </div>
            
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- 다음 주소 api 추가 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                   

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    <%-- myUpdate.js 연결 --%>
	<script src="/resources/js/member/myPage/myUpdate.js"></script>

</body>
</html>