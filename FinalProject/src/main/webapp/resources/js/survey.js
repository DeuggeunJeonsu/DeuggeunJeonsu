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


let str = [];



/* if(btn.innerHTML == "다음"){
    popUp.style.visibility ="hidden";
} */

if (input.style.width == "20%") {
    popUp.style.visibility = "hidden";
}

/* for (let i = 0; i < next.length; i++) {
    if(upChk[0].checked != true &&
        upChk[1].checked != true &&
        upChk[2].checked != true &&
        upChk[3].checked != true ){

        Swal.fire({
            icon: 'error',
            title: '미체크 에러',
            text: '항목을 체크 해주세요!',
          });
    }
} */

btn.addEventListener("click", () => {

    if (leg.checked != true && ub.checked != true) {

        Swal.fire({
            icon: 'error',
            title: '미체크 에러',
            text: '둘 중 하나를 체크 해주세요!',
        });


    }
})

for (let i of fristCheck) {

    i.addEventListener("click", () => {

        if (ub.checked == true || leg.checked == true) {

            btn.addEventListener("click", () => {


                if (leg.checked == true && ub.checked == true) {

                    Swal.fire({
                        icon: 'error',
                        title: '중복 체크 불가',
                        text: '둘 중 하나만 체크 해주세요!',
                    });


                    return;

                } else if (ub.checked == true) {

                    header.innerHTML = "상체를 하는 날이군요! 그 중 어느 부위를 하시나요?";


                    beforeBtn.style.visibility = "visible";
                    beforeBtn.style.cursor = "pointer";

                    input.style.transitionDuration = "2s, 1s";
                    input.style.width = "60%";



                    btn.style.visibility = "hidden";

                    finalCheck.style.visibility = "visible";

                    for (let i = 0; i < next.length; i++) {

                        next[i].style.display = "contents";


                        fristList[i].style.display = "none";

                       


                        finalCheck.addEventListener("click", () => {

                            


                            if (upChk[0].checked != true &&
                                upChk[1].checked != true &&
                                upChk[2].checked != true &&
                                upChk[3].checked != true) {


                                if (leg.checked != true) {

                                    Swal.fire({
                                        icon: 'error',
                                        title: '미체크 에러',
                                        text: '항목을 체크 해주세요!',
                                    });
                                }
                                return;
                            }

                            input.style.transitionDuration = "2s, 1s";
                            input.style.width = "100%";
                            input.style.backgroundColor = "rgb(46, 204, 113)";

                            maindiv1.style.webkitFilter = "blur(2px)";
                            maindiv2.style.webkitFilter = "blur(2px)";

                            popUp.style.visibility = "visible";
                            popUp.style.opacity = "10";
                            popUp.style.height =   "770px";


                            str = [];

                            if(upChk[i].checked == true){
                                
                                switch(i){
                                    case 0 : str = ["턱걸이 8회 4세트","렛풀다운 12회 4세트","바벨로우 12회 4세트", "시티드 로우 15회 4세트" , "데드리프트 12회 4세트" ];
                                        break;
                                    case 1 : str = ["바벨 벤치프레스 12회 4세트","인클라인 벤치 프레스 15회 4세트","딥스 8회 4세트","인클라인 덤벨 플라이 15회 4세트" , "케이블 크로스오버 15회 4세트"];
                                        break;
                                    case 2 : str = ["사이드 레터럴 레이즈 15회 4세트","밀리터리 프레스 12회 4세트","덤벨 숄더프레스 15회 4세트" ,"벤트오버 레터럴 레이즈 20회 4세트"];
                                        break;
                                    case 3 : str = ["이두컬 12회 4세트","해머 컬 15회 4세트","바벨 컬 10회 4세트" , "라잉 트라이셉스 익스텐션 12회 4세트" ,"트라이셉스 킥백 12회 4세트"];
                                }
                            }
                            
                            for(let i=0; i < str.length; i++){
                                const li = document.createElement('li');

                                li.innerText = str[i];
                                li.style.marginBottom = "10px";
                                popList.appendChild(li);
                            }

                        })



                        beforeBtn.addEventListener("click", () => {
                            upChk[i].checked = false;

                           
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
                                popUp.style.visibility = "hidden";

                                maindiv1.style.webkitFilter = "none";
                                maindiv2.style.webkitFilter = "none";
                            })

                        })




                    }

                } else if (leg.checked == true) {

                    

                        header.innerHTML = "하체를 하는 날이군요! 그 중 어느 부위를 하시나요?";

                        input.style.transitionDuration = "2s, 1s";
                        input.style.width = "60%";

                        btn.innerHTML = "결과확인";

                        beforeBtn.style.visibility = "visible";
                        beforeBtn.style.cursor = "pointer";

                        btn.style.visibility = "hidden";

                        finalCheck.style.visibility = "visible";

                    for (let i = 0; i < nextleg.length; i++) {

                        nextleg[i].style.display = "contents";


                        fristList[i].style.display = "none";

                        finalCheck.addEventListener("click", () => {



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

                            input.style.transitionDuration = "2s, 1s";
                            input.style.width = "100%";
                            input.style.backgroundColor = "rgb(46, 204, 113)";

                            maindiv1.style.webkitFilter = "blur(2px)";
                            maindiv2.style.webkitFilter = "blur(2px)";

                            popUp.style.visibility = "visible";
                            popUp.style.opacity =   "10";
                            popUp.style.height =   "770px";

                            str = [];

                            if(legChk[i].checked == true){
                                
                                switch(i){
                                    case 0 : str = ["레그 익스텐션 15회 4세트","파워 레그프레스 12회 4세트","핵스쿼트 12회 4세트","런지 20회 4세트"];
                                        break;
                                    case 1 : str = ["레그컬 15회 4세트","루마니안 데드리프트 12회 4세트","힙 쓰러스트 20회 4세트","스쿼트 12회 5세트"];
                                        break;
                                    case 2 : str = ["시티드 카프레이즈 20회 4세트","스탠딩 카프레이즈 15회 4세트","바벨 카프레이즈 15회 4세트"];
                                }
                            }
                            for(let i=0; i < str.length; i++){
                                const li = document.createElement('li');

                                li.innerText = str[i];
                                li.style.marginBottom = "10px";
                                popList.appendChild(li);
                            }
                            
                           

                        })
                        
                        
                        beforeBtn.addEventListener("click", () => {
                            while (str.length > 0) {
                                str.pop(); // 배열의 마지막 요소를 반복적으로 제거
                              }
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


