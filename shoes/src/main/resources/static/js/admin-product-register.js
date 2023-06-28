/**
 *
 */
// 목록으로 버튼
document.querySelector(".btn-secondary").addEventListener("click", () => {
  location.href = "/admin/product/list";
});

const registerForm = document.querySelector("#registerForm");

registerForm.addEventListener("submit", (e) => {
  e.preventDefault();
  if (isNaN(document.querySelector("#price").value)) {
    alert("가격은 숫자만 입력해주세요");
    return;
  }
  if (isNaN(document.querySelector("#productYear").value)) {
    alert("제조 연도는 숫자만 입력해주세요");
    return;
  }
  if (!sizeCreated) {
    alert("재고입력을 생성해주세요");
    return;
  }

  if (
    document.querySelector("input[name='colorList[0]']").value == "" ||
    document.querySelector("input[name='sizeList[0]']").value == ""
  ) {
    alert("필수 색상과 사이즈를 입력해주세요");
    return;
  }

  let str = "";
  document.querySelectorAll("div.cards").forEach((card, idx) => {
    str += "<input type='hidden' name='attachmentList[" + idx + "].uuid' value='" + card.dataset.uuid + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].uploadPath' value='" + card.dataset.path + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].fileName' value='" + card.dataset.filename + "'/>";
  });
  registerForm.insertAdjacentHTML("beforeend", str);
  registerForm.submit();
});
