<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 게시판</title>

    <link rel="stylesheet" href="/resources/css/board/notification.css">
</head>

<body>
    <main>

    <form action="/notification" method="GET">

        <div class="Jbody">
            <div class="Jcenter">


                <div class="Jhead">
                    <h2>공지사항 게시판</h2>
                </div>

                <div class="Jtext">
                    득근전수에서 회원님들에게 공지드립니다.
                </div>

                <div class="Jsearch">
                    <button class="fa-solid fa-magnifying-glass" ><svg
                            xmlns="http://www.w3.org/2000/svg" 
                            viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                            <path
                                d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                        </svg></button> <input type="text">
                </div>

                <div class="JList">

                    <table>
                        <thead>
    
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성날짜</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
    
                        <tbody>
                            <tr>
                                <td><div id="Jpoint">중요!</div></td>
                               <td><a href="#">회원가입 시 필수 약관동의에 대하여</a></td>
                                <td>관리자</td>
                                <td>2023-08-20</td>
                                <td>1</td>
                            </tr>
    
                            <tr>
                                <td>3</td>
                                <td>회원가입 시 필수 약관동의에 대하여</td>
                                <td>관리자</td>
                                <td>2023-08-20</td>
                                <td>1</td>
                            </tr>
    
                            <tr>
                                <td>2</td>
                                <td>회원가입 시 필수 약관동의에 대하여</td>
                                <td>관리자</td>
                                <td>2023-08-20</td>
                                <td>1</td>
                            </tr>
    
                            <tr>
                                <td>1</td>
                                <td>회원가입 시 필수 약관동의에 대하여</td>
                                <td>관리자</td>
                                <td>2023-08-20</td>
                                <td>1</td>
                            </tr>
                        </tbody>
                    </table>

                    

                </div>

                <div class="pagination-area">

                    <button class="Jwrite">글쓰기</button>

                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="/board/${boardCode}?cp=1">&lt;&lt;</a></li>
    
                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="/board/${boardCode}?cp=${pagination.prevPage}">&lt;</a></li>
    
                   
                        <!-- 특정 페이지로 이동 -->
                        <c:forEach var="i" begin="${pagination.startPage}"
                                end="${pagination.endPage}" step="1">
    
                                <c:choose>
    
                                   <c:when test="${i == pagination.currentPage}">
                                        <!-- 현재 보고있는 페이지 -->
                                        <li><a class="current"></a></li>
                                   </c:when>
                                
                                   <c:otherwise>
                                        <!-- 현재 페이지를 제외한 나머지 -->
                                        <li><a href="#"></a></li>
                                   </c:otherwise>
                                </c:choose>
                                
                        </c:forEach>
                        
                       
                        
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <li><a href="#">&gt;</a></li>
    
                        <!-- 끝 페이지로 이동 -->
                        <li><a href="#">&gt;&gt;</a></li>
    
                    </ul>
                </div>

            </div>
        </div>
        </form>
    </main>
</body>

</html>