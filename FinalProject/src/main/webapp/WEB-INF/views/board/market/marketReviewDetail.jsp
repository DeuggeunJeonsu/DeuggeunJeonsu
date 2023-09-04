<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketReview-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/marketReviewDetail-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div class="main-con">

                    <hr style="border: solid 3px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <section class="reivew-list">
                        <h1 class="board-name">Review</h1>
                        <h3>득근전수 회원님들의 상품 후기를 확인해보세요 ~ :)</h3>
                        <br>
                        <br>
                        <table>
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>5</td>
                                    <td><a href="#">다섯번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-08-31</td>
                                    <td>100</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><a href="#">네번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><a href="#">세번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="#">두번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td><a href="#">첫번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                            </tbody>
                        </table>


                </div>

            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/main.js"></script>
        </body>

        </html>