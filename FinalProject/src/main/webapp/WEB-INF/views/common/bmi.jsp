<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>BMI 페이지</title>
        <link rel="stylesheet" href="/resources/css/common/bmi-style.css">
        <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    </head>

    <body>

        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <section id="mainContainer">
            <div id="contentContainer">
                <div id="titleArea">
                    <p>BMI</p>
                    <p>비만도 체크하고 건강을 관리 해보세요 </p>
                </div>
    
                <div id="contentArea">
                    <div id="contentHeader">
                        <p>체질량 지수 BMI (Body Mass Index) : 카우프지수</p>
                        비만 판정의 올바른 지표는 체중이 아니라 체지방량이므로 몸의 지방량을 직접 측정하는 것이 이상적이나, 기술적인 어려움 때문에 표준 신장과 체중으로 계산하는 체질량 지수(BMI)가 체지방량을 간접적으로 측정하는 방법으로 가장 널리 사용되고 있습니다.
                    </div>
    
                    <div id="bmiArea">
                        <div id="calculate-container">
                            <div class="calculate-area">
                                <div class="content">
                                    <div class="input-output-area first-input">
                                        <p>신장 <input type="text" id="heightInput" autocomplete="off"> cm</p>
                                        <p>/</p>
                                        <p>체중 <input type="text" id="weightInput" autocomplete="off"> kg</p>
                                    </div>
                                    <div class="buttonArea">
                                        <button class="bmi-btn" id="bmiCalculate">계산</button>
                                        <button class="bmi-btn" id="bmiReset">초기화</button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="calculate-area">
                                <div class="calculus-title">계산법</div>
                                <div class="calculus-content">
                                    <div class="calculus">
                                        <p>체질량지수</p>
                                        <p>(BMI)</p>
                                    </div>
                                    <div class="calculus">
                                        <p>=</p>
                                    </div>
                                    <div class="calculus">
                                        <p>체중(kg)</p>
                                        <p>신장(m)²</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="calculate-area">
                                <div class="content">
                                    <div class="input-output-area my-bmi">
                                        <p>나의 BMI : <div id="bmiResult"></div></p>
                                    </div>
                                    <div class="buttonArea">
                                        <button class="bmi-btn" id="bmiSave">내정보에 저장하기</button>
                                    </div>
                                </div>
                            </div>

                            <div class="calculate-area">
                                <div class="input-output-area">
                                    <div class="obesity-graph obesity-color1">18.4 이하<br>저체중</div>
                                    <div class="obesity-graph obesity-color2">18.5~24.9<br>표준체중</div>
                                    <div class="obesity-graph obesity-color3">25~29.9<br>과체중</div>
                                    <div class="obesity-graph obesity-color4">30~34.9<br>비만</div>
                                    <div class="obesity-graph obesity-color5">35 이상<br>고도비만</div>
                                </div>
                            </div>

                        </div>
                        <div id="bmiAvatarArea">
                            <i class="fa-solid fa-person" id="bmiAvatar"></i>
                            <span>내 비만도</span>
                        </div>
                    </div>

                    <div id="bmiHistoryArea">
                        <canvas id="lineChart" style="height:100%; width:100%"></canvas>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
    <script src="/resources/js/bmi.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>