fetch("/dashboard/statistics")
  .then((response) => {
    if (!response.ok) {
      throw new Error("통계 데이터 불러오기 실패");
    }
    return response.json();
  })
  .then((data) => {
    document.querySelector("#onSaleProductsCount").innerHTML = data.onSaleProductsCount + " 건";
    document.querySelector("#offSaleProductsCount").innerHTML = data.offSaleProductsCount + " 건";
    document.querySelector("#dayPurchaseCount").innerHTML = data.dayPurchaseCount + " 건";
    document.querySelector("#daySalesAmount").innerHTML = data.daySalesAmount + " 건";
    document.querySelector("#dayCustomerCount").innerHTML = data.dayCustomerCount + " 명";
    document.querySelector("#notAnsweredCount").innerHTML = data.notAnsweredCount + " 건";
    document.querySelector("#totalMemberCount").innerHTML = data.totalMemberCount + " 명";
    document.querySelector("#todayVisitCount").innerHTML = data.todayVisitCount + " 명";
    document.querySelector("#dailyVisitCount").innerHTML = data.dailyVisitCount + " 명";
    document.querySelector("#totalVisitCount").innerHTML = data.totalVisitCount + " 명";
  })
  .catch((error) => console.log(error));
