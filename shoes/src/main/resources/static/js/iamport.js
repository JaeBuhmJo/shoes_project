/**
 * 아임포트 결제 연동 스크립트
 */
IMP.init("imp32727738");

/* 외부 결제 API 연동 위한 Secure 쿠키 설정 */
document.cookie = "safeCookie1=foo; SameSite=Lax";
document.cookie = "safeCookie2=foo";
document.cookie = "crossCookie=bar; SameSite=None; Secure";

document.querySelector("#orderBtn").addEventListener("click", async () => {
  fetch("/payment/info")
    .then((response) => {
      if (!response.ok) {
        throw new Error("결제정보 호출 실패");
      }
      return response.json();
    })
    .then((data) => {
      requestPay(data);
    })
    .catch();
});

function requestPay(info) {
  console.log(info);
  console.log(info);
  IMP.request_pay(
    {
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: info.orderId, // 주문번호
      name: info.orderName, //주문 이름
      amount: info.amount, // 숫자 타입
      buyer_email: info.member.email, //실제 이메일
      buyer_name: info.member.name, // 실제 고객 이름
      buyer_tel: info.member.phone, // 실제 고객 연락처
      buyer_addr: info.member.address, //고객 주소
      buyer_postcode: "01181", // 고객 우편번호
    },
    function (rsp) {
      // callback
      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
      if (rsp.success) {
        // 성공시 처리
        afterPaymentSuccess(info);
      } else {
        alert(`결제에 실패하였습니다. 사유: ${rsp.error_msg}`);
      }
    }
  );
}

function afterPaymentSuccess(data) {
  const formData = new FormData();
  formData.append("orderId", data.orderId);
  formData.append("amount", data.amount);
  formData.append("orderName", data.orderName);
  formData.append("pay_method", "card");
  fetch("/payment/process", {
    method: "POST",
    headers: {
      "X-CSRF-TOKEN": csrfToken,
    },
    body: formData,
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("결제 과정 오류");
      }
      return response.text();
    })
    .then((data) => {
      if (data === "Success") {
        location.href = "/shop/success";
      }
    })
    .catch((error) => console.log(error));
}
