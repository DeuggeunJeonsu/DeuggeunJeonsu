const ub = document.getElementById("ex_chk1");
const leg = document.getElementById("ex_chk2");
const btn = document.getElementById("bodyCheck");


const input = document.getElementById("rangeInput1");
const next = document.getElementsByClassName("bodycheck1");

ub.addEventListener("change", () => {

    if(ub.checked == true){
        
        btn.addEventListener("click", () => {

            for(let i = 0 ; i < next.length ; i++){

                next[i].remove();
            }
        })
        
    }
})

