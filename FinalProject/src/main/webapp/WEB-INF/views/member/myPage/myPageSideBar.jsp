<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%-- alert창 바꿔 주는 스크립트 연결 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">


<div id="middle-area">
    <div id="left-sideBar">
        <div class="sideBarTop">

            <div class="myPageProfile">
                <label for="imageInput">
                    <span>Change!</span>
                </label>
                <%-- 프로필 이미지 X --%>
                <c:if test="${empty loginMember.profileImage}" >
                    <img src="/resources/images/user.png" id="profileImage">
                </c:if>

                <%-- 프로필 이미지 O --%>
                <c:if test="${!empty loginMember.profileImage}" >
                    <img src="${loginMember.profileImage}" id="profileImage">
                </c:if>
                
                
                <input type="file" name="profileImage" id="imageInput" accept="image/*" >
                
            </div>

            <div class="nickname">
                ${loginMember.memberNickname}
            </div>

        </div>

        <a href="/myPage/myBadge">
            <div class="sideBarMenu">내 뱃지</div>
        </a>
        <a href="/myPage/followingFollower">
            <div class="sideBarMenu">팔로잉/팔로워</div>
        </a>
        <a href="/myPage/myBoardList">
            <div class="sideBarMenu">내 게시글</div>
        </a>
        <a href="/myPage/myPurchaseList">
            <div class="sideBarMenu">구매 내역</div>
        </a>
        <a href="/myPage/oneOnOneInquiry">
            <div class="sideBarMenu">1:1 문의</div>
        </a>
        <a href="/myPage/myUpdate">
            <div class="sideBarMenu">내 정보 수정</div>
        </a>
        <a href="/myPage/mySecession">
            <div class="sideBarMenu">회원 탈퇴</div>
        </a>
    </div>
</div>

<script>

    // 프로필이미지 변경 
    const imageInput= document.getElementById("imageInput");
    const profileImage = document.getElementById("profileImage");


    let initCheck; //초기 프로필 이미지 상태 저장 
    let deletCheck = -1;

    let originalImage; //초기 프로필 이미지의 파일 경로 저장
    
    originalImage = profileImage.getAttribute('src');

    if(originalImage == "/resources/images/user.png"){ //기본이미지 일때 
        initCheck= false;
    }else{
        initCheck= true;
    }

    imageInput.addEventListener("change", e => {
    const file = e.target.files[0];

    if (file === undefined) {
        console.log('파일 선택이 취소됨');
        deletCheck = -1;
        profileImage.setAttribute("src", originalImage);
        return;
    }

    const reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = e => {
        const url = e.target.result;
        profileImage.setAttribute("src", url);
        deletCheck = 1;

        Swal.fire({
            title: '프로필 이미지를 바꾸시겠습니까?',
            text: '취소 시 원래 이미지로 돌아갑니다.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네! 바꿀거에요',
            cancelButtonText: '취소',
        }).then(result => {

            let flag = true;
            if (!result.isConfirmed) {
                deletCheck = -1;
                profileImage.setAttribute("src", originalImage);
                return;
            
            }else{
                var formData = new FormData();
                var inputFile = $("input[name='profileImage']");
                var files = inputFile[0].files;
                console.log(files);

                formData.append("profileImage", files[0]);
                
                
                $.ajax({
                    url: '/myPage/changeProfile',
                    processData : false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result) {
                        if(result > 0) alert("Uploaded");
                        else alert("실패")
                    },
                    error: function(){
                        console.log("실패ㅜㅜㅜ")
                    }
                });

                


            }
        });
    };
});






</script>