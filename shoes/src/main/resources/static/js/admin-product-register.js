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
  document.querySelectorAll(".cards").forEach((card, idx) => {
    str += "<input type='hidden' name='attachmentList[" + idx + "].uuid' value='" + card.dataset.uuid + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].uploadPath' value='" + card.dataset.path + "'/>";
    str += "<input type='hidden' name='attachmentList[" + idx + "].fileName' value='" + card.dataset.filename + "'/>";
  });
  registerForm.insertAdjacentHTML("beforeend", str);
  registerForm.submit();
});

document.querySelector("#addRow").addEventListener("click", () => {
  newRow = "";
  newRow += '<div class="mb-3 row inputForm">';
  newRow += '<div class="col-sm-2">';
  newRow += "</div>";
  newRow += '<div class="col-sm-2">';
  newRow += '<input type="text" name="colorList[' + colorCount + ']" class="form-control" placeholder="색상">';
  newRow += "</div>";
  newRow += '<div class="col-sm-4">';
  newRow +=
    '<input type="text" name="sizeList[' +
    colorCount +
    ']" class="form-control" placeholder="ex)260,270,280 (쉼표로 구분)">';
  newRow += "</div>";
  newRow += '<div class="col-sm-2"> ';
  newRow += '<button type="button" class="removeRow btn btn-outline-danger" tabindex="-1">X</button>';
  newRow += "</div>";
  colorCount += 1;

  document.querySelector("#newRow").insertAdjacentHTML("beforeend", newRow);
});

// Remove row
document.querySelector("#newRow").addEventListener("click", (e) => {
  if (e.target.matches(".removeRow")) {
    e.target.closest(".inputForm").remove();
  }
});
