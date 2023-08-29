const count = document.getElementById("ncTextCount");
const content = document.getElementsByClassName("ncContent")[0];



content.addEventListener("input", e => {

    
    count.innerHTML = content.value.trim().length;

    if(content.value.trim().length ==  0){
        count.style.color = "black";
    }

    if(content.value.trim().length > 0){
        count.style.color = "yellowgreen";
    }

    if(content.value.trim().length > 1000){
        count.style.color = "orange";
    }


    if(content.value.trim().length > 1500){
        count.style.color = "red";
    }


})