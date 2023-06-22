/**
 *
 */

document.querySelector(".btn-secondary").addEventListener("click", () => {
  location.href = "/admin/product/list";
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
