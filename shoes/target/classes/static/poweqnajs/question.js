// 게시글 등록

const qnaForm = document.querySelector("#qnaForm");
qnaForm.addEventListener("submit", (e) => {
  e.preventDefault();
  qnaForm.submit();
  // if ((document.querySelector("#memberId").value = "")) {
  //   alert("아이디를 입력해주세요");
  //   return;
  // }

  // if ((document.querySelector("#title").value = "")) {
  //   alert("제목을 입력해주세요");
  //   return;
  // }
  // if ((document.querySelector("#question").value = "")) {
  //   alert("질문 내용을 입력해 주세요");
  //   return;
  // }

  //  const formData = new FormData(qnaForm);

  // fetch("/member/qna", {
  //   body: formData,
  //   method: "post",
  //   // headers: {
  //   //   "X-CSRF-TOKEN": csrfToken,
  //   // },
  // })
  //   .then((response) => {
  //     if (!response.ok) {
  //       throw new Error("게시글 등록 실패");
  //     }
  //     return response.json();
  //   })
  //   .then((data) => {
  //     console.log(data);
  //   })
  //   .catch((error) => console.log(error));
});
