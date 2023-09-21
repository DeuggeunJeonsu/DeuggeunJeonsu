
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루틴공유게시판</title>
<%-- GSAP 라이브러리 추가 --%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js" ></script> 
<link rel="stylesheet" href="/resources/css/board/comment-style.css">

</head>
<body>
    <div id="comment-area">
        <div class="comment-count-area">
            <i class="fa-regular fa-comment"></i> <span id="commentCount">댓글 0</span>
        </div>
        <div class="comment-input">
            <textarea id="commentContent" placeholder="댓글을 입력해주세요"></textarea>
            <button id="addComment"><img src="/resources/images/icon/send-icon.png"></button>
        </div>
       
        <ul id="commentList">

            <c:forEach items="${board.commentList}" var="comment">
                <!-- 부모/자식 댓글 -->
                <li class="comment-row <c:if test='${comment.parentNo !=0 }'>child-comment</c:if>">
                    <c:if test="${comment.parentNo !=0 }">
                        <img src="/resources/images/boardDetaile/commentArrow.png">
                    </c:if>
                    <p class="comment-writer">

                        <!-- 프로필 이미지 -->
                        <c:if test="${empty comment.profileImage}" >
                            <%-- 없을 경우 --%>
                            <img src="/resources/images/user.png">
                        </c:if>
                        <c:if test="${!empty comment.profileImage}" >
                            <%-- 있을 경우 --%>
                            <img src="${comment.profileImage}">
                        </c:if>

                        <!-- 닉네임 -->
                        <span>${comment.memberNickname}</span>
                        
                        <!-- 작성일 -->
                        <span class="comment-date">${comment.commentCreateDate}</span>
                    </p>
                
                    <!-- 댓글 내용 -->
                    <p class="comment-content">${comment.commentContent}</p>


            

                    <!-- 버튼 영역 -->
                    <div class="comment-btn-area">
                        
                        <!-- 로그인 회원과 댓글 작성자가 같은 경우 -->  
                        <c:if test="${loginMember.memberNo == comment.memberNo}" >
                            <span onclick="deleteComment(${comment.commentNo})">&times;</span>
                        </c:if>
                        <div class="inline">
                            <button onclick="showInsertComment(${comment.commentNo},this)">답글</button>   
                            <!-- 로그인 회원과 댓글 작성자가 같은 경우 -->  
                            <c:if test="${loginMember.memberNo == comment.memberNo}" >
                                <button onclick="showUpdateComment(${comment.commentNo},this)">수정</button>     
                            </c:if>

                        </div>
                    </div>
                </li>
            </c:forEach>


        </ul>
    </div>


   
</body>
</html>