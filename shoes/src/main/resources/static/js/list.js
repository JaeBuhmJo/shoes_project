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
  document.querySelector("#operForm input[name='page']").value = 1;
  document.querySelector("#operForm input[name='listAmount']").value = listAmount.value;
  operForm.submit();
});

const order = document.querySelector("#order");
order.addEventListener("change", () => {
  document.querySelector("#operForm input[name='order']").value = order.value;
  operForm.submit();
});

