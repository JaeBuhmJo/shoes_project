/**
 *
 */
// 서브밋 버튼 비활성화
const submitButton = document.querySelector("#submitButton");
submitButton.disabled = true;

// 이메일 인증 번호 보내기

const emailInput = document.querySelector("#email");

// 인증코드 저장
let code = undefined;

document.querySelector("#emailConfirm").addEventListener("click", () => {
  //e.preventDefault();
  const email = emailInput.value;

  if (email === "") {
    alert("이메일을 입력해주세요");
    return;
  }

  // 이메일 보내는 컨트롤러로 보내는 패치 코드
  fetch("/member/mailConfirm", {
    method: "post",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
      "X-CSRF-TOKEN": csrfToken,
    },
    body: new URLSearchParams({ email: email }),
  })
    .then((response) => response.text())
    .then((result) => {
      alert("메일을 전송했습니다.");

      //인증코드 전송되면
      console.log(result);
      code = result;
    })
    .catch((error) => {
      alert("메일을 전송을 실패습니다.");
      console.log("Error:", error);
    });
});

// 인증번호와 사용자가 입력된 인증번호 같은 경우
const emailCheckConfirm = document.querySelector("#emailCheckConfirm"); // 인증번호 확인 버튼

emailCheckConfirm.addEventListener("click", () => {
  const checkNumber = document.querySelector("#checkNumber").value; // 사용자가 입력한 인증번호

  if (checkNumber !== "" && code === checkNumber) {
    alert("인증이 확인되었습니다.");
    emailCheckConfirm.disabled = true; // 인증번호 확인 버튼 비활성화
    submitButton.disabled = false;
  } else {
    alert("인증에 실패하였습니다.");
    emailCheckConfirm.disabled = false; // 인증번호 확인 버튼 활성화
  }
});
