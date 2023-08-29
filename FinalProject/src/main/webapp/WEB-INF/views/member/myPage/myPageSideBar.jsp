<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 사이드바</title>
    
    <!-- jquery연결 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- <link rel="icon" type="image/png" href="favicon.ico"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- 아이콘 사이트 key -->
    <script src="https://kit.fontawesome.com/9e44afcd4a.js" crossorigin="anonymous"></script>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
</head>
<body>

    <div id="left-sideBar">
        <div>
            <div>
                <img src="../../../../resources/images/user.png">
            </div>
            <div>
                닉네임 님
            </div>
        </div>
        <div>내 뱃지</div>
        <div>팔로잉/팔로워</div>
        <div>내 게시글</div>
        <div>구매 내역</div>
        <div>1:1 문의</div>
        <div>내 정보 수정</div>
        <div>회원 탈퇴</div>
    </div>

</body>
</html>