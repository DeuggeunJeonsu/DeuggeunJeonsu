<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<div id="middle-area">
    <div id="left-sideBar">
        <div class="sideBarTop">

            <div class="myPageProfile">
            
                <%-- 프로필 이미지 X --%>
                <c:if test="${empty loginMember.profileImage}" >
                    <img src="/resources/images/user.png">
                </c:if>

                <%-- 프로필 이미지 O --%>
                <c:if test="${!empty loginMember.profileImage}" >
                    <img src="${loginMember.profileImage}">
                </c:if>
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