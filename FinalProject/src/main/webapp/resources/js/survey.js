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

let len = next.length;





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

                    leg.checked = false;
                    ub.checked = false;

                    return;

                } else if (ub.checked == true) {

                    for (let i = 0; i < next.length; i++) {

                        next[i].style.display = "contents";


                        fristList[i].style.display = "none";

                        header.innerHTML = "상체를 하는 날이군요! 그 중 어느 부위를 하시나요?";

                        /*  rangeInput.style.transition = "background";
                         rangeInput.style.transition = ""; */

                        beforeBtn.style.visibility = "visible";
                        beforeBtn.style.cursor = "pointer";

                        input.style.transitionDuration = "2s, 1s";
                        input.style.width = "60%";


                        btn.style.visibility = "hidden";

                        finalCheck.style.visibility = "visible";

                        finalCheck.addEventListener("click", () => {

                                if (upChk[0].checked != true &&
                                    upChk[1].checked != true &&
                                    upChk[2].checked != true &&
                                    upChk[3].checked != true) {

                                    Swal.fire({
                                        icon: 'error',
                                        title: '미체크 에러1',
                                        text: '항목을 체크 해주세요!',
                                    });
                                    return;
                                }



                                maindiv1.style.webkitFilter = "blur(2px)";
                                maindiv2.style.webkitFilter = "blur(2px)";

                                popUp.style.visibility = "visible";
                                popUp.style.opacity = "10";

                            })



                        beforeBtn.addEventListener("click", () => {

                            header.innerHTML = "오늘은 어느 부위를 하시나요?";
                            next[i].style.display = "none";

                            btn.style.visibility = "visible";

                            beforeBtn.style.visibility = "hidden";

                            finalCheck.style.visibility = "hidden";


                            fristList[i].style.display = "contents";

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



                    /*  if(btn.innerHTML == "결과확인"){
 
                         btn.addEventListener("click", () => {
                             maindiv1.style.webkitFilter = "blur(2px)";
                             maindiv2.style.webkitFilter = "blur(2px)";
                             popUp.style.visibility ="visible";
                     
                         })
                     
                     }
                     
                     if(btn.innerHTML == "다음"){
                         popUp.style.visibility ="hidden";
                     }
  */




                    for (let i = 0; i < nextleg.length; i++) {

                        nextleg[i].style.display = "contents";


                        fristList[i].style.display = "none";

                        header.innerHTML = "하체를 하는 날이군요! 그 중 어느 부위를 하시나요?";

                        input.style.transitionDuration = "2s, 1s";
                        input.style.width = "60%";

                        btn.innerHTML = "결과확인";

                        beforeBtn.style.visibility = "visible";
                        beforeBtn.style.cursor = "pointer";

                        btn.style.visibility = "hidden";

                        finalCheck.style.visibility = "visible";

                        finalCheck.addEventListener("click", () => {


                                if (legChk[0].checked != true ||
                                    legChk[1].checked != true ||
                                    legChk[2].checked != true ) {

                                    Swal.fire({
                                        icon: 'error',
                                        title: '미체크 에러2',
                                        text: '항목을 체크 해주세요!',
                                    });
                                    return;
                                }
                                next[0].remove();
                            maindiv1.style.webkitFilter = "blur(2px)";
                            maindiv2.style.webkitFilter = "blur(2px)";

                            popUp.style.visibility = "visible";
                            popUp.style.opacity = "10";

                        })

                        beforeBtn.addEventListener("click", () => {

                            header.innerHTML = "오늘은 어느 부위를 하시나요?";

                            nextleg[i].style.display = "none";

                            btn.style.visibility = "visible";

                            finalCheck.style.visibility = "hidden";

                            beforeBtn.style.visibility = "hidden";


                            fristList[i].style.display = "contents";

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
        Swal.fire(
          '승인이 완료되었습니다.',
          '화끈하시네요~!',
          'success'
        )
      }
    })
  });