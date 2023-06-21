/**
 *
 */

document.querySelector(".btn-secondary").addEventListener("click", () => {
  location.href = "/admin/product/list";
});

const registerForm = document.querySelector("#registerForm");

registerForm.addEventListener("submit", (e) => {
  e.preventDefault();
  let str = "";
  const cards = document.querySelectorAll(".cards");
  cards.forEach((card, idx) => {
    str +=
      "<input type='hidden' name='attachmentList[" +
      idx +
      "].uuid' value='" +
      card.dataset.uuid +
      "'/>";
    str +=
      "<input type='hidden' name='attachmentList[" +
      idx +
      "].uploadPath' value='" +
      card.dataset.path +
      "'/>";
    str +=
      "<input type='hidden' name='attachmentList[" +
      idx +
      "].fileName' value='" +
      card.dataset.filename +
      "'/>";
  });
  registerForm.insertAdjacentHTML("beforeend", str);
  registerForm.submit();
});
