const ub = document.getElementById("ex_chk1");
const leg = document.getElementById("ex_chk2");
const btn = document.getElementById("bodyCheck");
const beforeBtn = document.getElementById("beforeBtn");

const finalCheck = document.getElementById("finalCheck");

const upChk = document.getElementsByClassName("up_chk");
const legChk = document.getElementsByClassName("leg_chk");

const popChk = document.getElementsByClassName("pop_chk");

const maindiv1 = document.getElementsByClassName("sv1")[0];
const maindiv2 = document.getElementsByClassName("sv2")[0];
const checks = document.getElementsByClassName("checks")[0];


const input = document.getElementById("rangeblue");

const fristCheck = document.getElementsByClassName("fristCheck");
const fristList = document.getElementsByClassName("bodycheck0");
const next = document.getElementsByClassName("bodycheck1");
const nextleg = document.getElementsByClassName("bodycheck2");


const header = document.getElementById("fristHeader");
const nextHeader = document.getElementsByClassName("svHeader2")[0];
const bodyList = document.getElementsByClassName("bodyList");
const bodyListLeg = document.getElementsByClassName("bodyList-leg")[0];

const popUp = document.getElementsByClassName("popUp")[0];
const popList = document.getElementsByClassName("popList")[0];

const confirmStart2 = document.getElementById("confirmStart2");

let listCount = 0;

let str = [];


btn.addEventListener("click", () => {

    if(ub.checked == false && leg.checked == false){
        
        Swal.fire({
            icon: 'error',
            title: '미체크 에러',
            text: '항목을 체크 해주세요!',
        });
    } 

    return;
    
})



const noMember = document.getElementById("noMember");

if (input.style.width == "20%") {
    popUp.style.visibility = "hidden";
}

if(loginMember == ''){
    noMember.addEventListener("click", () => {
    
        if(confirm("로그인 하시겠습니까?")){
            location.href = "/member/login";
        }
    })
}else{
    





for (let i = 0 ;  i <  fristCheck.length ; i++) {

    fristCheck[i].addEventListener("click", () => {
        str = [];
        if (ub.checked == true || leg.checked == true) {

            btn.addEventListener("click", () => {
                str = [];

               
                

                if (leg.checked == true && ub.checked == true) {

                    Swal.fire({
                        icon: 'error',
                        title: '중복 체크 불가',
                        text: '둘 중 하나만 체크 해주세요!',
                    });


                    return;
                 /* 상체를 선택 한 경우 */
                }else if (ub.checked == true) {
                    str = [];
                    header.innerHTML = "상체를 하는 날이군요! 그 중 어느 부위를 하시나요?";


                    beforeBtn.style.visibility = "visible";
                    beforeBtn.style.cursor = "pointer";

                    input.style.transitionDuration = "2s, 1s";
                    input.style.width = "60%";

                    maindiv1.style.height = "500px";
                    checks.style.height = "370px";

                    btn.style.visibility = "hidden";

                    finalCheck.style.visibility = "visible";

                    for (let i = 0; i < next.length; i++) {

                        next[i].style.display = "contents";


                        fristList[i].style.display = "none";

                        /* 이전 버튼 클릭 시 */
                        beforeBtn.addEventListener("click", () => {
                            str = [];

                            for (let i = 0; i < upChk.length; i++) {
                                upChk[i].checked = false;
                            }
                            leg.checked = false;

                            // 나머지 초기화 작업을 수행합니다.
                            ub.checked = false;
                            leg.checked = false;

                            console.log(str.length);

                            upChk[i].checked = false;

                            maindiv1.style.height = "300px";
                            checks.style.height = "170px";

                            header.innerHTML = "오늘은 어느 부위를 하시나요?";
                            next[i].style.display = "none";

                            btn.style.visibility = "visible";

                            beforeBtn.style.visibility = "hidden";

                            finalCheck.style.visibility = "hidden";


                            fristList[i].style.display = "contents";

                            fristList[i].checked = false;

                            bodyList[i].style.marginTop = "35px";
                            bodyListLeg.style.marginTop = "17px";

                            popUp.style.visibility = "visible";
                            popUp.style.opacity = "10";

                            input.style.width = "20%";

                            btn.innerHTML = "다음";
                            ub.checked = false;

                            popUp.style.visibility = "hidden";

                            btn.addEventListener("click", () => {

                                str = [];
                                popUp.style.visibility = "hidden";

                                maindiv1.style.webkitFilter = "none";
                                maindiv2.style.webkitFilter = "none";
                            })

                        })

                    }

                /* 하체를 선택 한 경우 */
                } else if (leg.checked == true) {


                    header.innerHTML = "하체를 하는 날이군요! 그 중 어느 부위를 하시나요?";

                    input.style.transitionDuration = "2s, 1s";
                    input.style.width = "60%";

                    btn.innerHTML = "결과확인";

                    beforeBtn.style.visibility = "visible";
                    beforeBtn.style.cursor = "pointer";

                    maindiv1.style.height = "500px";
                    checks.style.height = "370px";

                    btn.style.visibility = "hidden";

                    finalCheck.style.visibility = "visible";

                    for (let i = 0; i < nextleg.length; i++) {

                        nextleg[i].style.display = "contents";


                        fristList[i].style.display = "none";


                        /* 이전 버튼 클릭 시 */
                        beforeBtn.addEventListener("click", () => {

                            for (let i = 0; i < upChk.length; i++) {
                                upChk[i].checked = false;
                            }

                            maindiv1.style.height = "300px";
                            checks.style.height = "170px";

                            header.innerHTML = "오늘은 어느 부위를 하시나요?";

                            nextleg[i].style.display = "none";

                            btn.style.visibility = "visible";

                            finalCheck.style.visibility = "hidden";

                            beforeBtn.style.visibility = "hidden";


                            fristList[i].style.display = "contents";

                            fristList[i].checked = false;

                            bodyList[i].style.marginTop = "35px";
                            bodyListLeg.style.marginTop = "17px";


                            input.style.width = "20%";

                            btn.innerHTML = "다음";

                            leg.checked = false;

                            popUp.style.visibility = "hidden";

                            /* 이전 버튼 클릭 후 다시 다음 버튼 클릭 시 */
                            btn.addEventListener("click", () => {
                                popUp.style.visibility = "hidden";

                                maindiv1.style.webkitFilter = "none";
                                maindiv2.style.webkitFilter = "none";
                            })
                        })
                        beforeBtn.visibility = "hidden";


                    }

                }

            })

        }
    })

}





finalCheck.addEventListener("click", () => {

    str = [];

    /* 상체 상세부위 추천 운동 */
    if(ub.checked == true){

            if (upChk[0].checked != true &&
                upChk[1].checked != true &&
                upChk[2].checked != true &&
                upChk[3].checked != true) {


                    Swal.fire({
                        icon: 'error',
                        title: '미체크 에러',
                        text: '항목을 체크 해주세요!',
                    });
                    
                    return;
            }

        input.style.transitionDuration = "2s, 1s";
        input.style.width = "100%";
        input.style.backgroundColor = "rgb(46, 204, 113)";

        maindiv1.style.webkitFilter = "blur(2px)";
        maindiv2.style.webkitFilter = "blur(2px)";

        popUp.style.visibility = "visible";
        popUp.style.opacity = "10";
        popUp.style.height = "770px";

        for(let i = 0 ; i < upChk.length ; i ++ ){

            if (upChk[i].checked == true) {
        
                switch (i) {
                    case 0: str.push("턱걸이 8회 4세트", "렛풀다운 12회 4세트", "바벨로우 12회 4세트", "시티드 로우 15회 4세트", "데드리프트 12회 4세트");
                        break;
                    case 1: str.push("바벨 벤치프레스 12회4세트", "인클라인 벤치프레스 15회 4세트", "딥스 8회 4세트", "인클라인 덤벨플라이 15회 4세트", "케이블 크로스오버 15회 4세트");
                        break;
                    case 2: str.push("사이드 레터럴레이즈 15회4세트", "밀리터리 프레스 12회 4세트", "덤벨 숄더프레스 15회 4세트", "페이스풀 15회 4세트");
                        break;
                    case 3: str.push("이두컬 12회 4세트", "해머 컬 15회 4세트", "바벨 컬 10회 4세트", "트라이셉스 익스텐션 12회 4세트", "덤벨 킥백 12회 4세트");
                        break;
                }
            }
        }

        for (let i = 0; i < str.length; i++) {
            // 운동 항목을 li 요소에 추가합니다.
            const li = document.createElement('li');
            li.innerText = str[i];
            li.style.marginBottom = "10px";

            // 운동 항목에 대한 버튼을 생성하고 추가합니다.
            const button = document.createElement('button');
            button.classList.add("todoBtn");
            // li 요소에 버튼을 추가
            li.appendChild(button);

            // li 요소를 popList에 추가
            popList.appendChild(li);

            if (listCount < 10) {
                button.addEventListener('click', () => {

                    console.log(li.innerText);

                    const routine = li.innerText;

                    fetch("/survey/todoList?routine=" + routine)
                        .then(resp => resp.json())
                        .then(result => {

                            if (result > '0') {
                                // 버튼 클릭 시 실행될 동작을 정의합니다.
                                alert('TodoList에 추가되었습니다.'); // 원하는 동작으로 변경
                                li.remove(button);
                                return;

                            } else {

                                alert('TodoList 개수가 꽉 찼습니다. 삭제 후 이용해주세요.');
                            }
                        })
                        .catch()


                });

            }

        }
        
    }else{  /* 상체 상세부위 추천 운동 */

            for(let i = 0 ; i < legChk.length ; i++){

            
                if (legChk[0].checked != true &&
                    legChk[1].checked != true &&
                    legChk[2].checked != true &&
                    ub.checked != true
                    ) {
                        
                        Swal.fire({
                            icon: 'error',
                            title: '미체크 에러',
                            text: '항목을 체크 해주세요!',
                        });
                        return;
                    }
                }
        
            input.style.transitionDuration = "2s, 1s";
            input.style.width = "100%";
            input.style.backgroundColor = "rgb(46, 204, 113)";
        
            maindiv1.style.webkitFilter = "blur(2px)";
            maindiv2.style.webkitFilter = "blur(2px)";
        
            popUp.style.visibility = "visible";
            popUp.style.opacity = "10";
            popUp.style.height = "770px";
        
        
        
            for(let i = 0 ; i < legChk.length ; i++){
        
        
            if (legChk[i].checked == true) {
        
                switch (i) {
                    case 0: str.push("레그 익스텐션 15회 4세트", "파워 레그프레스 12회 4세트", "핵스쿼트 12회 4세트", "런지 20회 4세트");
                        break;
                    case 1: str.push("레그컬 15회 4세트", "루마니안 데드리프트 12회 4세트", "힙 쓰러스트 20회 4세트", "스쿼트 12회 5세트");
                        break;
                    case 2: str.push("시티드 카프레이즈 20회 4세트", "스탠딩 카프레이즈 15회 4세트", "바벨 카프레이즈 15회 4세트");
                }
            }
        }
            for (let i = 0; i < str.length; i++) {

                // 운동 항목을 li 요소에 추가
                const li = document.createElement('li');
                li.innerText = str[i];
                li.style.marginBottom = "10px";
        
                // li 요소를 popList에 추가
                popList.appendChild(li);
        
                // 버튼 생성
                const button = document.createElement('button');

                // 운동 항목에 대한 버튼을 생성하고 추가
                button.classList.add("todoBtn");

                // li 요소에 버튼을 추가
                li.appendChild(button);
        
        
                if (listCount < 10) {
                    button.addEventListener('click', () => {
        
                        console.log(li.innerText);
        
                        const routine = li.innerText;
        
                        fetch("/survey/todoList?routine=" + routine)
                            .then(resp => resp.json())
                            .then(result => {
        
                                if (result > '0') {
                                    // 버튼 클릭 시 실행될 동작을 정의합니다.
                                    alert('TodoList에 추가되었습니다.'); // 원하는 동작으로 변경
                                    li.remove(button);
                                    return;
        
                                } else {
        
                                    alert('TodoList 개수가 꽉 찼습니다. 삭제 후 이용해주세요.');
                                }
                            })
                            .catch()
        
        
                    });
                }
        
        
            }
    

    }

})


}



/* 모달창 메인으로 버튼 alert 효과 */
$("#confirmStart").click(function () {
    Swal.fire({
        title: '메인으로 이동 하시겠습니까?',
        text: "다시 되돌릴 수 없습니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true, // 버튼 순서 거꾸로

    }).then((result) => {
        if (result.isConfirmed) {
            location.href = "/";
            /*  Swal.fire(
               '승인이 완료되었습니다.',
               '화끈하시네요~!',
               'success'
     
               ) */
        }
    })
});

/* 모달창 닫기 버튼 */
confirmStart2.addEventListener("click", () => {


    str = [];

    for (let i = 0; i < upChk.length; i++) {
        upChk[i].checked = false;
    }

    for (let i = 0; i < legChk.length; i++) {
        legChk[i].checked = false;
    }

    input.style.transitionDuration = "2s, 1s";
    input.style.width = "60%";
    input.style.backgroundColor = "#99E1ED";

    maindiv1.style.webkitFilter = "blur(0px)";
    maindiv2.style.webkitFilter = "blur(0px)";

    popUp.style.visibility = "hidden";
    popUp.style.opacity = "0";
    popUp.style.transition = "none";
    popList.innerHTML = '';
})

/* 이전 버튼 누를 시 */
beforeBtn.addEventListener("click", () => {

    str = [];

   

    for (let i = 0; i < upChk.length; i++) {
        upChk[i].checked = false;
    }

    for (let i = 0; i < legChk.length; i++) {
        legChk[i].checked = false;
    }
    popList.innerHTML = '';
})

