<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>건강/운동정보</title>
    <link rel="stylesheet" href="../resources/css/board/informationBoard/informationBoardList-style.css">
    <!-- JQuery lib -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- slick lib -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">
        <div id="title-area">
            <div><h1>건강/운동정보</h1></div>
            <div>득근전수 회원님들이 유용한 지식을 얻어갈 수 있는 공간입니다.</div>
        </div>
        <div id="search-area">
            
            <div id="sort-btn-area">
                <button id="healthCategory"># 건강정보</button>
                <button id="exerciseCategory"># 운동정보</button>
                <button id="trendCategory"># 최근동향</button>
            </div>

            <div class="hashTag-area">
                <div>
                    <span>"어깨통증" 에 대한 검색결과 1개</span>
                    <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i>
                </div>                
            </div>

            <div class="search-place">
                <input type="search" id="market-search" placeholder="search...">
                <button id="search-button"><i class="fas fa-search"></i></button>
            </div>

        </div>

        <div id="list-area">
            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>건강 / 운동정보에 대한 컨탠츠 내용을 짧게 미리보기 할 수 있습니다. 자세한 내용은...</div>
                    </div>
                    <div class="profile-area">
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 7</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>

            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>건강 / 운동정보에 대한 컨탠츠 내용을 짧게 미리보기 할 수 있습니다. 자세한 내용은...</div>
                    </div>
                    <div class="profile-area">
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 7</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>

            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>건강 / 운동정보에 대한 컨탠츠 내용을 짧게 미리보기 할 수 있습니다. 자세한 내용은...</div>
                    </div>
                    <div class="profile-area">
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 7</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>

            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>건강 / 운동정보에 대한 컨탠츠 내용을 짧게 미리보기 할 수 있습니다. 자세한 내용은...</div>
                    </div>
                    <div class="profile-area">
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 7</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>

            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>건강 / 운동정보에 대한 컨탠츠 내용을 짧게 미리보기 할 수 있습니다. 자세한 내용은...</div>
                    </div>
                    <div class="profile-area">
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 7</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>

            <div class="thumbnail">
                <div><img src="/resources/images/main/log02.png"></div>
                <div>
                    <div class="title ">제목입니다</div>
                    <div class="createDate-area">
                        <div>건강 / 운동정보에 대한 컨탠츠 내용을 짧게 미리보기 할 수 있습니다. 자세한 내용은...</div>
                    </div>
                    <div class="profile-area">
                        <div><i class="fa-regular fa-comment" style="color: #ddd;"></i> 7</div>
                        <div><i class="fa-solid fa-heart" style="color: #ff4242;"></i> 99</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="slide_div_wrap">
            
            <div class="slide_div">
                <div class="slick-prev"><</div>
                <div>
                    <a>
                        <img src="/resources/images/slideShow/show1.jpg">
                    </a>
                </div>
                <!-- <div>
                    <a>
                        <img src="/resources/images/slideShow/show2.jpg">
                    </a>
                </div>
                <div>
                    <a>
                        <img src="/resources/images/slideShow/show3.jpg">
                    </a>
                </div>				 -->
                <div class="slick-next">></div>	
            </div>

        </div>

        <div class="paginationArea">
            <div>
                페이지네이션 영역
            </div>
        </div>
	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="/resources/js/main.js"></script>

</body>
</html>