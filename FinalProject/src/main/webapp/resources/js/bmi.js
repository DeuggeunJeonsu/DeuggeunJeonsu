

new Chart(document.getElementById("lineChart"), {
    type: 'line',
    data: {
        labels: ["2023-09-01","2023-09-02","2023-09-03","2023-09-04","2023-09-05","2023-09-06","2023-09-07","2023-09-08","2023-09-09","2023-09-10","2023-09-11",],
        datasets: [{ 
            data: [24,23,25,24,23,21,20,18,21,23,25,28,15,35],
            label: "BMI",
            borderColor: "#99E1ED",
            fill: false
            }
        ]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: '내 BMI 히스토리'
            }
        }
    }
});

// 신장 입력 input
const heightInput = document.getElementById("heightInput");
// 체중 입력 input
const weightInput = document.getElementById("weightInput");
// bmi 결과 div
const bmiResult = document.getElementById("bmiResult");
// 계산버튼
const bmiCalculate = document.getElementById("bmiCalculate");
// 초기화버튼
const bmiReset = document.getElementById("bmiReset");
// 내 정보에 저장하기 버튼
const bmiSave = document.getElementById("bmiSave");
// 비만도 아바타
const bmiAvatar = document.getElementById("bmiAvatar");


// 계산버튼이 눌리면
bmiCalculate.addEventListener("click", ()=>{
    const reqExp = /^\d{2,3}(\.\d{1,2})?$/;

    if(heightInput.value.trim().length==0 || !reqExp.test(heightInput.value.trim())){
        alert("신장이 제대로 입력되지 않았습니다");
        return;
    }
    if(weightInput.value.trim().length==0 || !reqExp.test(weightInput.value.trim())){
        alert("체중이 제대로 입력되지 않았습니다");
        return;
    }
    // bmi 결과 div에 표시
    bmiResult.innerText = (weightInput.value/((heightInput.value/100)*(heightInput.value/100))).toFixed(2);
    // 비만도 아바타 색상변경
    if(Number(bmiResult.innerText)<18.5) bmiAvatar.style.color="#8FACCA";
    else if(Number(bmiResult.innerText)<25) bmiAvatar.style.color="#98CB00";
    else if(Number(bmiResult.innerText)<30) bmiAvatar.style.color="#FFD600";
    else if(Number(bmiResult.innerText)<35) bmiAvatar.style.color="#FF8901";
    else bmiAvatar.style.color="#FE2D04";
})

// 초기화 버튼이 눌리면
bmiReset.addEventListener("click", ()=>{
    heightInput.value="";
    weightInput.value="";
    bmiResult.innerText="";
    bmiAvatar.style.color="#ddd";
})

// 저장하기 버튼이 눌리면
bmiSave.addEventListener("click", ()=>{
    
    if(loginMemberNo !=""){ // 로그인 상태일 경우

        if(bmiResult.innerText != ""){  // bmi 계산값이 있으면
            const data = {"loginMemberNo" : loginMemberNo,
                            "myBMI" : bmiResult.innerText};
            // ajax 코드 작성
            fetch("/bmi/addBMI", {
                method : "POST",
                headers : {"Content-Type" : "application/json"},
                body : JSON.stringify(data)
            })
            .then(resp => resp.json() ) // 응답 객체를 필요한 형태로 파싱하여 리턴
            .then(result => {
                console.log("result : "+result);
                alert("오늘의 내 BMI 저장 완료!");
            })
            .catch(err =>{
                console.log("예외 발생");
                console.log(err);
            }) // 예외 발생 시 처리하는 부분
        }
        else{ // bmi 계산 값이 없으면
            alert("저장할 BMI값이 없습니다");
        }
    }
    else{
        alert("로그인 후 저장 가능합니다");
    }

});
