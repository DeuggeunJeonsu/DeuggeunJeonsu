<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <%-- alert창 바꿔 주는 스크립트 연결 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">
</head>
<body>


    <footer>
        <p class="footer-row">Made with by DEUGGEUN JEONSU <i class="fa fa-heart"></i> </p>

        <article>
            <!-- <a href="#">안수현</a>     -->
            <div>안수현</div>
            <span>|</span>
            <div>김종수</div>  
            <span>|</span>
            <div>이지영</div>  
            <span>|</span>
            <div>이민주</div>
            <span>|</span>
            <div>정호진</div>  
        </article>

        <p class="footer-row2">"득근전수"는 포트폴리오 프로젝트를 위해 개발된 사이트입니다. 무단 도용 및 배포를 금지합니다.</p>
    </footer>



    <c:if test="${!empty message}">
        <script>
            Swal.fire({                  
                title: "${message}"
            });
        </script>
    </c:if>
    
</body>
</html>