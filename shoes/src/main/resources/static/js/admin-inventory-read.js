/**
 *
 */

const operForm = document.querySelector("#operForm");

document.querySelector(".btn-secondary").addEventListener("click", () => {
  operForm.action = "/admin/inventory/list";
  operForm.submit();
});

document.querySelector(".btn-success").addEventListener("click", () => {
  location.href = "/admin/product/read/" + productId;
});
