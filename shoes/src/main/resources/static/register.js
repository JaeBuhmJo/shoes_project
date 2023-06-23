/**
 *
 */

// 부트스트랩에서 가져온 기능
// 로그인 정규식이 틀릴 때
const form = document.querySelector("#register");

form.addEventListener("submit", (e) => {
  if (!form.checkValidity()) {
    e.preventDefault();
    e.stopPropagation();
  }

  form.classList.add("was-validated");
});

// 중복아이디 확인할 수 있는 ajax

document.querySelector(".btn-danger").addEventListener("click", () => {
  // 사용자가 입력한 userid 가져오기
  const memberId = document.querySelector("#memberId").value;

  fetch("/member/dupid", {
    method: "post",
    headers: {
      "X-CSRF-TOKEN": csrfToken,
    },
    body: new URLSearchParams({ memberId: memberId }),
  })
    .then((response) => response.text())
    .then((result) => {
      console.log(result);
      if (result.trim() === "true") {
        alert("아이디를 사용할 수 없습니다.");
      } else {
        alert("아이디를 사용할 수 있습니다.");
      }
    });
});
