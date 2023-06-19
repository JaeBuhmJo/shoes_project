/**
 *
 */
const searchForm = document.querySelector("#searchForm");

searchForm.addEventListener("submit", (e) => {
  e.preventDefault();
  searchForm.submit();
});

document.querySelector(".btn-success").addEventListener("click", () => {
  location.href = "/admin/product/register";
});
