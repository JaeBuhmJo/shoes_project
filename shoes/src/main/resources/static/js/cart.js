/**
 *
 */

const operForm = document.querySelector("#operForm");

document.querySelector(".cart__bigorderbtn.left").addEventListener("click", (e) => {
  e.preventDefault();
  operForm.action = "/shop/list";
  operForm.submit();
});
