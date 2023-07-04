/*
 *
 */

// 부트스트랩에서 가져온 기능
// 로그인 정규식이 틀릴 때
const form = document.querySelector("#register");
const submitButton = document.querySelector("#join");

form.addEventListener("submit", (e) => {
  if (!form.checkValidity()) {
    e.preventDefault();
    e.stopPropagation();
  }
  form.classList.add("was-validated");
});

document.querySelector("#dupcheck").addEventListener("click", () => {
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
        submitButton.disabled = true; // submit 버튼 비활성화
      } else {
        alert("아이디를 사용할 수 있습니다.");
        submitButton.disabled = false; // submit 버튼 활성화
      }
    })
    .catch((error) => console.log(error));
});

// 아이디 입력하면 중복 아이디 체크 알람 띄우기
const memberIdInput = document.querySelector("#memberId");
memberIdInput.addEventListener("change", () => {
  const memberId = memberIdInput.value;
  if (memberId !== "") {
    alert("중복 아이디 버튼 눌러주세요");
  }
});

// 비밀번호와 확인비밀번호 확인하기
const passwordInput = document.querySelector("#password");
const confirmPasswordInput = document.querySelector("#confirmPassword");

confirmPasswordInput.addEventListener("change", () => {
  const password = passwordInput.value;
  const confirmPassword = confirmPasswordInput.value;

  if (password === confirmPassword) {
    alert("비밀번호가 확인되었습니다.");
  } else {
    alert("비밀번호를 확인해주세요");
    return;
  }
});

//이메일 인증 번호 보내기

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
  } else {
    alert("인증에 실패하였습니다.");
    emailCheckConfirm.disabled = false; // 인증번호 확인 버튼 활성화
  }
});
