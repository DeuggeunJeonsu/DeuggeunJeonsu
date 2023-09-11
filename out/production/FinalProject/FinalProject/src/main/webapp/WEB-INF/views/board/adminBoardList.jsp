<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>관리자페이지 회원 게시글 목록</title>

            <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="/resources/css/board/adminBoardList-style.css">

        </head>

        <body>

            <main>
                <div class="adMain">
                    <a href="/"><img src="/resources/images/main/log01.png" id="mainImg"></a>
                    <div class="container"> 
                        <h1 class="swift-up-text">득근전수 관리자 페이지
                        </h1>

                     </div> 

                    <div class="inquiry1">
                     <a href="/adminInquiry"> <i class="fa-solid fa-envelope-circle-check" id="inquiry2" name="1"></i>
                        <label id="inquiry2">회원 문의</label></a>
                    </div>

                    <div class="userList">
                        <a href="/userList"><i class="fa-solid fa-users" id="userImg"></i>
                        <label id="userImg">회원 목록</label></a>
                    </div>
                </div>
                <div class="adBody">

                    <div class="workOut">
                        <a href="/shareBoard">
                            <div id="wo1">
                                <div id="wo2">

                                    <div id="wo3">
                                        운동 공유 게시판
                                    </div>

                                    <div id="wo4">
                                        <img src="/resources/images/admin/admin1.jpg">
                                    </div>

                                </div>
                        </a>
                    </div>




                </div>




                <div class="notification">
                    <a href="/notificationList">
                        <div id="nc1">
                            <div id="nc2">

                                <div id="nc3">
                                    공지사항 게시판
                                </div>

                                <div id="nc4">
                                    <img src="/resources/images/admin/admin2.jpg">
                                </div>

                            </div>
                    </a>
                </div>
                </div>


                <div class="information">
                    <a href="/informationBoard/list">
                        <div id="im1">
                            <div id="im2">

                                <div id="im3">
                                    건강/운동 정보 컬럼
                                </div>

                                <div id="im4">
                                    <img src="/resources/images/admin/admin3.jpg">
                                </div>

                            </div>
                    </a>
                </div>

                </div>


                <div class="freeBoard">
                    <a href="/freeBoard/list">
                        <div id="fb1">
                            <div id="fb2">

                                <div id="fb3">
                                    자유 게시판
                                </div>

                                <div id="fb4">
                                    <img src="/resources/images/admin/admin4.jpg">
                                </div>

                            </div>
                    </a>
                </div>
                </div>


                </div>
            </main>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </body>
        <script src="/resources/js/board/admin/adminBoardList.js"></script>
        </html>