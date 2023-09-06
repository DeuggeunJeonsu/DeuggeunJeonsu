const ub = document.getElementById("ex_chk1");
const leg = document.getElementById("ex_chk2");
const btn = document.getElementById("bodyCheck");
const beforeBtn = document.getElementById("beforeBtn");

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
const bodyListLeg = document.getElementsByClassName("bodyList-leg");

const popUp = document.getElementsByClassName("popUp")[0];

let len = next.length;


if (leg.checked == true && ub.checked == true) {


}


for (let i of fristCheck) {
 console.log(i);
    i .addEventListener("click", () => {
        
        if (ub.checked == true || leg.checked == true) {
            
            btn.addEventListener("click", () => {
                console.log("ww");

                if (leg.checked == true && ub.checked == true) {

                    alert("하나만 선택 해주세요.");

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

                        input.style.transitionDuration = "2s, 1s";
                        input.style.width = "60%";

                        btn.innerHTML = "결과확인";


                            btn.addEventListener("click", () => {
                                maindiv1.style.webkitFilter = "blur(2px)";
                                maindiv2.style.webkitFilter = "blur(2px)";
                                popUp.style.visibility ="visible";
                            })

                        beforeBtn.addEventListener("click", () => {
                            next[i].style.display = "none";

                            fristList[i].style.display = "contents";

                            bodyList[i].style.marginTop = "35px";
                            bodyListLeg[i].style.marginTop = "17px";

                            popUp.style.visibility ="visible";
                            popUp.style.opacity ="10";

                            btn.innerHTML = "다음";
                            ub.checked = false;

                            popUp.style.visibility ="hidden";

                        })


                    }

                } else if (leg.checked == true) {

                    for (let i = 0; i < next.length; i++) {

                        nextleg[i].style.display = "contents";


                        fristList[i].style.display = "none";

                        header.innerHTML = "하체를 하는 날이군요! 그 중 어느 부위를 하시나요?";

                        input.style.transitionDuration = "2s, 1s";
                        input.style.width = "60%";

                        btn.innerHTML = "결과확인";

                            btn.addEventListener("click", () => {
                                maindiv1.style.webkitFilter = "blur(2px)";
                                maindiv2.style.webkitFilter = "blur(2px)";

                                popUp.style.visibility ="visible";
                                popUp.style.opacity ="10";

                                
                            })

                        beforeBtn.addEventListener("click", () => {
                            nextleg[i].style.display = "none";

                            fristList[i].style.display = "contents";

                            bodyList[i].style.marginTop = "35px";
                            bodyListLeg[i].style.marginTop = "17px";


                            input.style.width = "20%";

                            btn.innerHTML = "다음";

                            leg.checked = false;

                            popUp.style.visibility ="hidden";
                        })
                    }

                }

            })

        }
    })

}


