// 팔로잉, 언팔로우 버튼 토글
const customBtns = document.querySelectorAll('.customBtn');

customBtns.forEach((button) => {

    button.addEventListener('click', () => {

        if (button.classList.contains('unfollowBtn')) {
            button.classList.remove('unfollowBtn');
            button.classList.add('followingBtn');
            button.querySelector('div').textContent = 'following';

        } else {
            button.classList.remove('followingBtn');
            button.classList.add('unfollowBtn');
            button.querySelector('div').textContent = 'follow';
        }

    });

});

// 뱃지 캐러셀
const CAROUSEL_LENGTH = document.querySelectorAll(".badgeImg").length - 1;
let current = 0;

const $carousel = document.querySelector(".carousel");
const $prevBtn = document.querySelector(".prev-btn");
const $nextBtn = document.querySelector(".next-btn");

const nextEvent = () => {
    if (current !== CAROUSEL_LENGTH) {
      $carousel.style.transform = `translateX(${(current + 1) * -121}px)`;
      current++;
    } else {
      current = 0;
      $carousel.style.transform = `translateX(0px)`;
    }
  };
  
  const prevEvent = () => {
    if (current !== 0) {
      current--;
      $carousel.style.transform = `translateX(${current * -121}px)`;
    } else {
      current = CAROUSEL_LENGTH;
      $carousel.style.transform = `translateX(${CAROUSEL_LENGTH * -100}px)`;
    }
  };
  
  $nextBtn.addEventListener("click", nextEvent);
  $prevBtn.addEventListener("click", prevEvent);


  const container = document.getElementsByClassName("container")[0];
  const offsetLeft = container.offsetLeft;
  
  console.log(offsetLeft + 619);

  console.log($carousel.lastElementChild.offsetLeft + 120);
  