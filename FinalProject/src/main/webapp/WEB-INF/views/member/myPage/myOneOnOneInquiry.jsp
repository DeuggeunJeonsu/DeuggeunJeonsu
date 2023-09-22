<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <c:set var="boardList" value="${map.boardList}" ></c:set>

            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>1:1 문의</title>

                <%-- myPageSideBar-style.css 연결 --%>
                    <link rel="stylesheet" href="/resources/css/member/myPage/myPageSideBar-style.css">
                    <%-- myOneOnOneInquiry-style.css 연결 --%>
                        <link rel="stylesheet" href="/resources/css/member/myPage/myOneOnOneInquiry-style.css">

                        <%-- 헤더 아이콘 --%>
                            <link rel="apple-touch-icon" sizes="180x180"
                                href="/resources/images/favicon_io/apple-touch-icon.png">
                            <link rel="icon" type="image/png" sizes="32x32"
                                href="/resources/images/favicon_io/favicon-32x32.png">
                            <link rel="icon" type="image/png" sizes="16x16"
                                href="/resources/images/favicon_io/favicon-16x16.png">
                            <%-- <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest"> --%>

            </head>

            <body>
                <%-- header include --%>
                    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

                    <section id="main-container">

                        <!-- 마이페이지 사이드바 include -->
                        <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>
                        <section id="QnAModal">
                            <h1 class="modal-header">내가 작성한 1:1 문의글</h1>
                            <div id="modal-header2">회원님이 작성하신 1:1 문의 글입니다.🍀</div>

                            <hr>
                            <br>

                            <div>
                                <input type="text" id="modalTitle" name="boardTitle" id="QnATitle" readOnly value="">
                            </div>

                            <div>
                                <textarea name="boardContent" id="QnAContent" cols="30" rows="10"
                                    placeholder="내용을 입력해주세요" readOnly></textarea>
                            </div>

                            <br>
                            <div class="bottom">
                                <div>
                                    <button id="close-button">닫기</button>
                                </div>
                            </div>

                        </section>


                        <div id="right-content-area">
                            <div id="title-area">
                                <div>
                                    <h1>1:1 문의</h1>
                                </div>
                                <div>작성하신 1:1 문의글 목록 및 상세 조회를 할 수 있습니다.</div>
                            </div>

                            <div id="main-content-area">
                                <div>
                                    <a href="/board/myPage/QnAWrite">
                                        <button class="inquiryBtn inquiryBtnColor1">문의글 작성하기</button>
                                    </a>
                                </div>
                                <div id="list">
                                    <table id="inquiry-list">
                                        <thead class="theadColor">
                                            <tr>
                                                <th>게시글 번호</th>
                                                <th>제목</th>
                                                <th>작성일</th>
                                                <th>답변 상태</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${boardList}" var="board">
                                                <tr>
                                                    <td>${board.boardNo}</td>
                                                    <td class="realboardTitle">${board.boardTitle}</td>
                                                    <td>${board.boardCreateDate}</td>
                                                    <td class="checkFl">${board.adminCheckFl}</td>
                                                </tr>
                                                <input type="hidden" class="boardTitle" value="${board.boardTitle}" />
                                                <input type="hidden" class="boardContent" value="${board.boardContent}" />
                                                <input type="hidden" class="boardNo" value="${board.boardNo}" />
                                            </c:forEach>



                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>

                    </section>

                    <!-- footer include -->
                    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

                    <script src="/resources/js/member/myPage/myOneOnOneInquiry.js"></script>

            </body> 


            </html>