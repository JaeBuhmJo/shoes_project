/**
 *
 */

document.querySelector(".btn-secondary").addEventListener("click", () => {
  location.href = "/admin/inventory/list";
});

document.querySelector(".btn-success").addEventListener("click", () => {
  location.href = "/admin/product/read/" + productId;
});
