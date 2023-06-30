// 페이지 넘어가는 기능

const pagination = document.querySelector(".pagination");
const operForm = document.querySelector("#operForm");

pagination.addEventListener("click", (e) => {
  e.preventDefault();

  let href = e.target.getAttribute("href");

  operForm.firstElementChild.value = href;

  operForm.submit();
});

// 제목 클릭시 해당 qnaid에 해당하는 글읽으러 가기
const qnas = document.querySelectorAll(".qna");

qnas.forEach((question) => {
  question.addEventListener("click", (e) => {
    e.preventDefault();

    const href = e.target.getAttribute("href");
    const qnaId = "<input type='hidden' name='qnaId' value='" + href + "'>";

    operForm.insertAdjacentHTML("beforeend", qnaId);
    operForm.action = "/customer/qnaread";
    operForm.submit();
  });
});

window.onpageshow = function (e) {
  if (e.persisted) {
    location.reload();
  }
};
