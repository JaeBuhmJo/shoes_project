/**
 *
 */

document.querySelector(".cart__bigorderbtn.left").addEventListener("click", () => {
  location.href = "/shop/list";
});

if (document.querySelector("#cartdump")) {
  document.querySelector("#cartdump").addEventListener("click", (e) => {
    e.preventDefault();
    if (confirm("정말 장바구니를 비우시겠습니까?")) {
      location.href = "/cart/dump";
    }
  });
}
