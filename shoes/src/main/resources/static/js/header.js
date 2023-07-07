/**
 *
 */
const logout = document.querySelector("#logout");
if (logout) {
  logout.addEventListener("click", (e) => {
    e.preventDefault();
    document.querySelector("#logoutForm").submit();
  });
}
document.querySelector("#searchForm").addEventListener("submit", (e) => {
  e.preventDefault();
  const keyword = document.querySelector("#searchKeyword").value;
  location.href = "/shop/list?keyword=" + keyword;
});
