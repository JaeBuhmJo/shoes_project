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
      name: "BLACKPEARL 결제 테스트",
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
        // axios로 HTTP 요청
        axios({
          url: "결제 프로세스의 엔드포인트",
          method: "post",
          headers: { "Content-Type": "application/json" },
          data: {
            imp_uid: rsp.imp_uid,
            merchant_uid: rsp.merchant_uid,
          },
        }).then((data) => {
          afterPaymentSuccess(data);
          // 서버 결제 API 성공시 로직
        });
      } else {
        alert(`결제에 실패하였습니다. 사유: ${rsp.error_msg}`);
      }
    }
  );
}

function afterPaymentSuccess() {
  location.href = "/shop/success";
}
