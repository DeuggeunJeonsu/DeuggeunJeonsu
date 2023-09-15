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


// bmi 계산버튼이 눌리면
bmiCalculate.addEventListener("click", ()=>{
    const reqExp = /^\d{3}(\.\d{1,2})?$/;

    if(heightInput.value.trim().length==0){
        alert("신장을 입력해주세요");
        return;
    }
    if(!reqExp.text(heightInput.value.trim())){
        alert("신장이 제대로 입력되지 않았습니다");
        return;
    }

    if(weightInput.value.trim().length==0){
        alert("체중을 입력해주세요");
        return;
    }
    if(!reqExp.text(weightInput.value.trim())){
        alert("체중이 제대로 입력되지 않았습니다");
        return;
    }
})

