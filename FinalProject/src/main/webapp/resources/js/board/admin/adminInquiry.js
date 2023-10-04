/* href="/admin/marketWrite?boardNo=${item.boardNo}"


----------------------------------------------------------------------------------- */

/* 모달창 메인으로 버튼 alert 효과 */
/* $(".iq-update").click(function () {
  Swal.fire({
    title: '답변 하시겠습니까?',
    text: "승인 시 작성 페이지로 이동합니다",
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: '승인',
    cancelButtonText: '취소',
    reverseButtons: true, // 버튼 순서 거꾸로

  }).then((result) => {
    if (result.isConfirmed) {

      location.href = "/adminIqWrite";

    }
  })
}); */

const boardNo = document.getElementsByClassName("boardNo");


const inquiryModal = document.getElementById("inquiryModal");
const closeBtn = document.getElementById("close-button");
const insertBtn = document.getElementById("insert-button");



const inquiryNo = document.getElementsByClassName("inquiryNo");
const modalTitle = document.getElementById("modalTitle");
const modalContent = document.getElementById("modalContent");


const iqUpdate = document.getElementsByClassName("iq-update");
const iqUpdate2 = document.getElementsByClassName("iq-update2");





/* 답변 여부 */
const adminCheckFl = document.getElementsByClassName("adminCheckFl");
const adminCheckFl2 = document.getElementsByClassName("adminCheckFl2");

const inquiryType = document.getElementsByClassName("inquiryType");
const inquiryType2 = document.getElementsByClassName("inquiryType2");





(() => {

  for (let i = 0; i < adminCheckFl.length; i++) {

    if (adminCheckFl2[i].value == 'N') {

      adminCheckFl[i].innerHTML = "미답변";
      adminCheckFl[i].style.color = "#797979";


    } else {
      adminCheckFl[i].innerHTML = "답변 완료";
    }


    if (inquiryType2[i].value == '1') {
      inquiryType[i].innerHTML = "1:1 문의";

    } else if (inquiryType2[i].value == '3') {
      inquiryType[i].innerHTML = "상품/교환";
    } else {
      inquiryType[i].innerHTML = "상품/취소";
    }
  }

})();


const marketIt1 = document.getElementsByClassName("marketIt1");
const marketIt2 = document.getElementsByClassName("marketIt2");

const marketCheckFL1 = document.getElementsByClassName("marketCheckFL1");
const marketCheckFL2 = document.getElementsByClassName("marketCheckFL2");

(() => {

  for (let i = 0; i < marketIt1.length; i++) {

    if (marketIt2[i].value == '1') {

      marketIt1[i].innerHTML = "상품/교환";


    } else if (marketIt2[i].value == '2') {
      marketIt1[i].innerHTML = "상품/취소";
    } else {
      marketIt1[i].innerHTML = "상품/기타";
    }


    if (marketCheckFL2[i].value == 'N') {
      marketCheckFL1[i].innerHTML = "미답변";

    } else if(marketCheckFL2[i].value == 'M') {
      marketCheckFL1[i].innerHTML = "답변완료";
      marketCheckFL1[i].style.color = "#99E1ED";
    }
  }

})()



/* 선택한 문의목록 조회 */
const option1 = document.getElementById("option1");
const option2 = document.getElementById("option2");

const inquiryList = document.getElementById("inquiryList");
const tr = document.getElementsByTagName("tr");
const td = document.getElementsByTagName("td");

const inquiryHeader = document.getElementById("inquiryHeader");
let marketNo = document.getElementsByClassName("marketNo")[0];
option1.addEventListener("click", () => {
  option1.style.color = "#99E1ED";
  option2.style.color = "#797979";
  fetch("/admin/selectInquiry1")
    .then(resp => resp.json())
    .then(data => {
      marketNo.innerHTML = "문의글 번호";


      const inquiryList = document.getElementById("inquiryList");

      inquiryList.innerHTML = ""; // 테이블 내용 초기화

      data.boardList.forEach(item => {
        const row = document.createElement("tr");

        row.innerHTML = `
             <td>${item.boardNo}</td>
             <td><a class="iq-update">${item.boardTitle}</a></td>
             <td>${item.inquiryType === 1 ? "1:1문의" : "에러"}</td>
             <td>${item.memberEmail}</td>
             <td style="color: ${item.adminCheckFl === 'N' ? '#797979' : '#99E1ED'}">${item.adminCheckFl === 'N' ? '미답변' : '답변 완료'}</td>
             <input type="hidden" class="boardNo2" value="${item.boardNo}" />
             <input type="hidden" class="boardCode" value="${item.inquiryType}" />
               
             
           `;
        inquiryList.appendChild(row);
      });

      inquiryHeader.innerHTML = "회원 1:1문의 목록";
      const boardNo2 = document.getElementsByClassName("boardNo2");
      const boardCode = document.getElementsByClassName("boardCode");
      /* -------------------- */
      /* modal 창 */
      for (let i = 0; i < iqUpdate.length; i++) {

        iqUpdate[i].addEventListener("click", () => {

          inquiryModal.style.visibility = "visible";

          fetch("/admin/adminInquiryDetail?boardNo=" + boardNo2[i].value)
            .then(resp => resp.json())
            .then(data => {
              console.log(data.inquiryType);

              modalTitle.value = data.boardTitle;
              modalContent.value = data.boardContent;


              /* ------------------------------------------------ */

              for (let i = 0; i < data.boardTitle.length; i++) {
                insertBtn.addEventListener("click", e => {
                  e.preventDefault();

                  if (data.inquiryType == '1') {

                    Swal.fire({
                      title: '답변 하시겠습니까?',
                      text: "승인 시 작성 페이지로 이동합니다",
                      icon: 'success',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: '승인',
                      cancelButtonText: '취소',
                      reverseButtons: true, // 버튼 순서 거꾸로

                    }).then((result) => {
                      if (result.isConfirmed) {
                        window.location.href = '/admin/adminQnAWrite?boardNo=' + data.boardNo;
                      }
                    })

                  } else if (data.inquiryType == '3' || boardCode[i].inquiryType == '4') {

                    Swal.fire({
                      title: '답변 하시겠습니까?',
                      text: "승인 시 작성 페이지로 이동합니다",
                      icon: 'success',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: '승인',
                      cancelButtonText: '취소',
                      reverseButtons: true, // 버튼 순서 거꾸로

                    }).then((result) => {
                      if (result.isConfirmed) {

                        window.location.href = '/admin/marketWrite?boardNo=' + data.boardNo;

                      }
                    })
                  }

                })
              }

              /* ------------------------------------------------ */



            })
            .catch(error => console.log(error))
        })
      }

      closeBtn.addEventListener("click", () => {

        inquiryModal.style.visibility = "hidden";
      })
      /* -------------------- */
      // 답변 화면으로 이동







    })
    .catch(error => console.log(error))

})

option2.addEventListener("click", () => {

  option2.style.color = "#99E1ED";
  option1.style.color = "#797979";

  fetch("/admin/selectInquiry2")
    .then(resp => resp.json())
    .then(data => {
      marketNo.innerHTML = "상품 번호";

      // 배열 내의 각 객체에서 boardNo 속성을 추출하여 문자열로 변환
      /*      const boardNoList = list.boardList.map(item => item.boardNo.toString());
     
     
      // 문자열로 변환된 boardNo를 콘솔에 출력하거나 원하는 곳에 추가할 수 있습니다.
      /*  console.log(boardNoList); */

      const inquiryList = document.getElementById("inquiryList");
      /*  inquiryList.innerHTML = boardNoList.join(", "); */

      inquiryList.innerHTML = ""; // 테이블 내용 초기화

      data.boardList.forEach(item => {
        const row = document.createElement("tr");


        let inquiryTypeText = '';

        if (item.inquiryType === 1) {
          inquiryTypeText = '상품/교환';
          
        } else if (item.inquiryType === 2) {
          inquiryTypeText = '상품/취소';
        } else {
          inquiryTypeText = '상품/기타';
        }
        row.innerHTML = `
             <td>${item.productNo}</td>
             <td><a class="iq-update"  >${item.inquiryTitle}</a></td>
             <td>${inquiryTypeText}</td>
             <td>${item.memberEmail}</td>
             <td style="color: ${item.marketCheckFl === 'N' ? '#797979' : '#99E1ED'}">${item.marketCheckFl === 'N' ? '미답변' : '답변 완료'}</td>
             <input type="hidden" class="boardNo2" value="${item.productNo}" />
             <input type="hidden" class="boardCode" value="${item.inquiryType}" />
             <input type="hidden" class="marketTitle" value="${item.inquiryTitle}" />
             `;
        inquiryList.appendChild(row);

      });

      inquiryHeader.innerHTML = "회원 상품문의 목록";
      const boardNo2 = document.getElementsByClassName("boardNo2");
      const marketTitle = document.getElementsByClassName("marketTitle");
      
      /* -------------------- */
      /* modal 창 */
      for (let i = 0; i < iqUpdate.length; i++) {
        
        iqUpdate[i].addEventListener("click", () => {
          inquiryModal.style.visibility = "visible";

          fetch("/admin/marketDetail?marketTitle=" + marketTitle[i].value)
            .then(resp => resp.json())
            .then(data => {
              console.log(data.inquiryTitle);

              modalTitle.value = data.inquiryTitle;
              modalContent.value = data.inquiryContent;

              /* -------------------- */

              // 답변 화면으로 이동

              for (let i = 0; i < data.inquiryTitle.length; i++) {
                insertBtn.addEventListener("click", e => {
                  e.preventDefault();


                    Swal.fire({
                      title: '답변 하시겠습니까?',
                      text: "승인 시 작성 페이지로 이동합니다",
                      icon: 'success',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: '승인',
                      cancelButtonText: '취소',
                      reverseButtons: true, // 버튼 순서 거꾸로

                    }).then((result) => {
                      if (result.isConfirmed) {
                        window.location.href = '/admin/marketWrite?marketTitle=' + data.inquiryTitle;
                      }
                    })

                  

                })
              }

              /* ---------------------------------------- */

            })
            .catch(error => console.log(error))
        })
      }

      closeBtn.addEventListener("click", () => {

        inquiryModal.style.visibility = "hidden";
      })


    })
    .catch(error => console.log(error))

})







/* 전체 목록 modal 창 */
for (let i = 0; i < iqUpdate.length; i++) {

  iqUpdate[i].addEventListener("click", () => {

    inquiryModal.style.visibility = "visible";

    fetch("/admin/adminInquiryDetail?boardNo=" + boardNo[i].value)
      .then(resp => resp.json())
      .then(data => {
        console.log(data.boardTitle);

        modalTitle.value = data.boardTitle;
        modalContent.value = data.boardContent;


        /* ---------------------------------- */

        for (let i = 0; i < adminCheckFl.length; i++) {
          insertBtn.addEventListener("click", e => {
            console.log(boardNo[i] + 'asdasd')
            e.preventDefault();

            if (inquiryType2[i].value == '1') {

              Swal.fire({
                title: '답변 하시겠습니까?',
                text: "승인 시 작성 페이지로 이동합니다",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true, // 버튼 순서 거꾸로

              }).then((result) => {
                if (result.isConfirmed) {
                  window.location.href = '/admin/adminQnAWrite?boardNo=' + data.boardNo;
                }
              })

            } else if (inquiryType2[i].value == '3' || inquiryType2[i].value == '4') {

              Swal.fire({
                title: '답변 하시겠습니까?',
                text: "승인 시 작성 페이지로 이동합니다",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true, // 버튼 순서 거꾸로

              }).then((result) => {
                if (result.isConfirmed) {

                  window.location.href = '/admin/marketWrite?boardNo=' + data.boardNo;

                }
              })
            }

          })
        }




        /* ---------------------------------- */



      })
      .catch(error => console.log(error))
  })
}


const marketTitle = document.getElementsByClassName("marketTitle");

/* 전체 목록 modal 창 */
for (let i = 0; i < inquiryNo.length; i++) {

  iqUpdate2[i].addEventListener("click", () => {

    inquiryModal.style.visibility = "visible";

    fetch("/admin/marketDetail?inquiryNo=" + inquiryNo[i].value)
      .then(resp => resp.json())
      .then(data => {

        modalTitle.value = data.inquiryTitle;
        modalContent.value = data.inquiryContent;


        /* ---------------------------------- */

        for (let i = 0; i < data.inquiryTitle.length; i++) {
          insertBtn.addEventListener("click", e => {
            e.preventDefault();


              Swal.fire({
                title: '답변 하시겠습니까?',
                text: "승인 시 작성 페이지로 이동합니다",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true, // 버튼 순서 거꾸로

              }).then((result) => {
                if (result.isConfirmed) {
                  window.location.href = '/admin/marketWrite?marketTitle=' + data.inquiryTitle;
                }
              })

            

          })
        }




        /* ---------------------------------- */



      })
      .catch(error => console.log(error))
  })
}


closeBtn.addEventListener("click", () => {

  inquiryModal.style.visibility = "hidden";
}) 
