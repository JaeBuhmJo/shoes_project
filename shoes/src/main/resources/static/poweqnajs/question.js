// 게시글 등록

const qnaForm = document.querySelector("#qnaForm");
qnaForm.addEventListener("submit", (e) => {
  e.preventDefault();

  const formData = new FormData(qnaForm);

  fetch("/member/qna", {
    body: formData,
    method: "post",
    // headers: {
    //   "X-CSRF-TOKEN": csrfToken,
    // },
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("게시글 등록 실패");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data);
    })
    .catch((error) => console.log(error));
});
