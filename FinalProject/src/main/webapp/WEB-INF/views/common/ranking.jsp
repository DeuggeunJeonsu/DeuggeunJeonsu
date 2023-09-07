<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹</title>
    
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

    <link rel="stylesheet" href="/resources/css/ranking-style.css">

</head>
<body>

    <section class="ranking-section">
        <div class="ranking-container">

            <div class="ranking-title-area">
                <div>
                    <h1>RANKING</h1>
                </div>
            </div>

            <div class="ranking-content-area">

                <div class="ranking-table-area"> <!--홈페이지 출석-->
                    <div id="attendance-ranking">
                        <div class="ranking-title">
                            출석 랭킹
                        </div>
                        
                        <div class="top3-area">
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>

                        <div class="ranking-row">
                            <div>4</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>5</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>6</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>7</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                        <div class="ranking-row">
                            <div>8</div>
                            <div>
                                <img class="rank-profile-img" src="/resources/images/user.png">
                            </div>
                            <div>NickName</div>
                            <div>Score</div>
                            <div>icon</div>
                        </div>
                    </div>
                </div>
                <div class="ranking-table-area"> <!--투두리스트 실천-->
                    <table id="execution-ranking">
                        
                    </table>
                </div>
                <div class="ranking-table-area"> <!-- 커뮤니티 활동 -->
                    <table id="community-ranking">
                        
                    </table>
                </div>

            </div>
            
        </div>
    </section>

</body>
</html>