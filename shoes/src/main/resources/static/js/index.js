/**
 *
 */

const operForm = document.querySelector("#operForm");

const toList = document.querySelector("#toList");
toList.addEventListener("click", (e) => {
  e.preventDefault();
  operForm.action = toList.getAttribute("href");
  operForm.submit();
});

const toAdmin = document.querySelector("#toAdmin");
toAdmin.addEventListener("click", (e) => {
  e.preventDefault();
  operForm.action = toAdmin.getAttribute("href");
  operForm.submit();
});
