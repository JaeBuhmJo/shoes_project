/**
 *
 */

// 목록으로 버튼
document.querySelector(".btn-secondary").addEventListener("click", () => {
  location.href = "/admin/product/list";
});

// 재고 조회 바로가기 버튼
document.querySelector(".btn-outline-success").addEventListener("click", () => {
  location.href = "/admin/inventory/read/" + document.querySelector("#productId").value;
});

const modifyForm = document.querySelector("#modifyForm");

modifyForm.addEventListener("submit", (e) => {
  e.preventDefault();
  let str = "";
  document.querySelectorAll(".cards").forEach((card, idx) => {
    str += "<input type='hidden' name='attachmentList[" + idx + "].uuid' value='" + card.dataset.uuid + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].uploadPath' value='" + card.dataset.path + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].fileName' value='" + card.dataset.filename + "'/>";
  });
  modifyForm.insertAdjacentHTML("beforeend", str);
  modifyForm.submit();
});

discontinue = document.querySelector(".btn-danger").addEventListener("click", (e) => {
  e.preventDefault();
  if (!confirm("상품을 단종 처리할 경우 모든 재고정보가 삭제되며, 추후 재 판매를 원할 시 새로 상품을 등록하셔야 합니다.")) {
    alert("단종이 취소되었습니다.");
    return;
  }
  const reconfirm = prompt("정말 단종시키길 원하시면, '단종'을 입력창에 입력해주세요");
  if (reconfirm != "단종") {
    alert("단종이 취소되었습니다.");
    return;
  }
  document.querySelector("#discontinuer").value = 1;
  modifyForm.submit();
});
