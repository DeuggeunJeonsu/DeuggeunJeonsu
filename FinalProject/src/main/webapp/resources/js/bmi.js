if(loginMemberNo !=""){ // 로그인 상태일 경우 bmi 히스토리 불러오기
    const data = {"loginMemberNo" : loginMemberNo};
    // ajax
    fetch("/bmi/loadBMI", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.json() )
    .then(bmiHistorys => {
        let i=0;
        let bmis = [];
        let bmiDates = [];
        for(memberBMI of bmiHistorys){
            bmis[i]= memberBMI.bmi;
            bmiDates[i]= memberBMI.bmiDate;
            i++;
        }
        drawingChart(bmis,bmiDates); // 불러온 정보로 차트 그리기
    })
    .catch(err =>{
        console.log("예외 발생");
        console.log(err);
    })
}

// 차트 그리기 함수 내용
const drawingChart = (bmis, bmiDates)=>{
    new Chart(document.getElementById("lineChart"), {
        type: 'line',
        data: {
            labels: bmiDates,
            datasets: [{ 
                data: bmis,
                label: "my BMI",
                backgroundColor: 'transparent',
                borderColor: "#99E1ED",
                pointBackgroundColor: '#99E1ED',
                fill: false
                }]
        },
        options: {
            responsive: true,
            pointRadius: 6,
            plugins: {
                legend: {display: false},
                title: {
                    display: true,
                    text: 'My BMI History'
                }
            }
        }
    });
}

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
        Swal.fire({
            icon: 'error',                     
            title: '신장이 제대로 입력되지 않았습니다',    
        });
        return;
    }
    if(weightInput.value.trim().length==0 || !reqExp.test(weightInput.value.trim())){
        Swal.fire({
            icon: 'error',                     
            title: '체중이 제대로 입력되지 않았습니다',    
        });
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
    
    if(loginMemberNo !=""){ // 로그인 상태일 경우만

        if(bmiResult.innerText != ""){  // bmi 계산값이 있으면
            const data = {"loginMemberNo" : loginMemberNo,
                            "myBMI" : bmiResult.innerText};
            // ajax
            fetch("/bmi/addBMI", {
                method : "POST",
                headers : {"Content-Type" : "application/json"},
                body : JSON.stringify(data)
            })
            .then(resp => resp.json() )
            .then(result => {
                if(result>0){
                    Swal.fire({
                        icon: 'success',                     
                        title: '오늘의 내 BMI 저장 완료!',
                        text: '당일 가장 마지막 저장으로 최신화 됩니다.'
                    });
                    location.reload();
                }
            })
            .catch(err =>{
                console.log("예외 발생");
                console.log(err);
            })
        }
        else{ // bmi 계산 값이 없으면
            Swal.fire({
                icon: 'error',                     
                title: '저장할 BMI값이 없습니다',    
                text: '신장(키) 와 체중(몸무게) 를 입력하고 BMI를 계산해보세요!'
            });
        }
    }
    else{
        Swal.fire({
            icon: 'error',                     
            title: '로그인 후 저장 가능합니다' 
        });
    }

});