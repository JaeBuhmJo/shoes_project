/**
 *
 */
const operForm = document.querySelector("#operForm");

document.querySelector("#shopPagination").addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    document.querySelector("#operForm input[name='page']").value = e.target.getAttribute("href");
    operForm.submit();
  }
});

const listAmount = document.querySelector("#listAmount");
listAmount.addEventListener("change", () => {
  if (listAmount.value == 15) {
    page = page * 2 - 1;
  } else if (listAmount.value == 30) {
    page = Math.floor((page - 1) / 2) + 1;
  }
  document.querySelector("#operForm input[name='page']").value = page;
  document.querySelector("#operForm input[name='listAmount']").value = listAmount.value;
  operForm.submit();
});

const order = document.querySelector("#order");
order.addEventListener("change", () => {
  document.querySelector("#operForm input[name='page']").value = 1;
  document.querySelector("#operForm input[name='order']").value = order.value;
  operForm.submit();
});

const gender = document.querySelector("#gender");
gender.addEventListener("click", (e) => {
  if (e.target.tagName === "INPUT") {
    document.querySelector("#operForm input[name='page']").value = 1;
    document.querySelector("#operForm input[name='gender']").value = e.target.value;
    operForm.submit();
  }
});

const category = document.querySelector("#category");
category.addEventListener("click", (e) => {
  e.preventDefault();
  if (e.target.tagName === "A") {
    document.querySelector("#operForm input[name='page']").value = 1;
    document.querySelector("#operForm input[name='category']").value = e.target.getAttribute("href");
    operForm.submit();
  }
});
