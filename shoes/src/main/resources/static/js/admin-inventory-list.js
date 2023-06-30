/**
 *
 */
const searchForm = document.querySelector("#searchForm");

searchForm.addEventListener("submit", (e) => {
  e.preventDefault();
  document.querySelector("input[name='searchType']").value = searchForm.submit();
});

const operForm = document.querySelector("#operForm");

const table = document.querySelector(".inventory-list-table");
table.addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    searchForm.action = e.target.getAttribute("href");
    searchForm.submit();
  }
});
