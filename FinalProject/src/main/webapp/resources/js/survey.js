const ub = document.getElementById("ex_chk1");
const leg = document.getElementById("ex_chk2");
const btn = document.getElementById("bodyCheck");


const input = document.getElementById("rangeblue");

const fristCheck = document.getElementsByClassName("fristCheck");
const fristList = document.getElementsByClassName("bodycheck0");
const next = document.getElementsByClassName("bodycheck1");
const nextleg = document.getElementsByClassName("bodycheck2");


const header = document.getElementById("fristHeader");
const nextHeader = document.getElementsByClassName("svHeader2")[0];

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


                    }

                } else if (leg.checked == true) {

                    for (let i = 0; i < next.length; i++) {

                        nextleg[i].style.display = "contents";


                        fristList[i].style.display = "none";

                        header.innerHTML = "하체를 하는 날이군요! 그 중 어느 부위를 하시나요?";

                        input.style.transitionDuration = "2s, 1s";
                        input.style.width = "60%";

                        btn.innerHTML = "결과확인";
                    }

                }

            })

        }
    })

}


