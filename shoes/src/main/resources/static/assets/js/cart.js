/**
 *
 */
$(document).ready(function () {
  /* 종합 정보 섹션 정보 삽입 */
  setTotalInfo();

  /* 이미지 삽입 */
  $("").each(function (i, obj) {
    const bobj = $(obj);

    if (bobj.data("product_id")) {
      const uploadPath = bobj.data("path");
      const uuid = bobj.data("uuid");
      const fileName = bobj.data("filename");

      const fileCallPath = encodeURIComponent(
        uploadPath + "/s_" + uuid + "_" + fileName
      );

      $(this)
        .find("img")
        .attr("src", "/display?fileName=" + fileCallPath);
    } else {
      $(this).find("img").attr("src", "");
    }
  });
});

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function () {
  /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
  setTotalInfo($(".cart_info_td"));
});

$("#cboxAll").click(function () {
  if ($(this).is(":checked")) {
    $("input[name=cbox]").prop("checked", true);
  } else {
    $("input[name=cbox]").prop("checked", false);
  }
});

$(document).on("click", "input:checkbox[name=cbox]", function (e) {
  var chks = document.getElementsByName("cbox");
  var chksChecked = 0;

  for (var i = 0; i < chks.length; i++) {
    var cbox = chks[i];

    if (cbox.checked) {
      chksChecked++;
    }
  }

  if (chks.length == chksChecked) {
    $("#cboxAll").prop("checked", true);
  } else {
    $("#cboxAll").prop("checked", false);
  }
});

// 수량 버튼 조작

let quantity = $(".cart__list__option").val();
$(".plus_btn").on("click", function () {
  $(".cart__list__option").val(++quantity);
});
$(".minus_btn").on("click", function () {
  if (quantity > 1) {
    $(".cart__list__option").val(--quantity);
  }
});

// 장바구니 추가 버튼
$(".btn_cart").on("click", function (e) {
  form.bookCount = $(".cart__list__option").val();
  $.ajax({
    url: "/cart/add",
    type: "POST",
    data: form,
    success: function (result) {
      cartAlert(result);
    },
  });
});

function cartAlert(result) {
  if (result == "0") {
    alert("장바구니에 추가를 하지 못하였습니다.");
  } else if (result == "1") {
    alert("장바구니에 추가되었습니다.");
  } else if (result == "2") {
    alert("장바구니에 이미 추가되어져 있습니다.");
  } else if (result == "5") {
    alert("로그인이 필요합니다.");
  }
}

/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo() {
  let totalPrice = 0; // 총 가격
  let totalCount = 0; // 총 갯수
  let totalKind = 0; // 총 종류
  let deliveryPrice = 0; // 배송비
  let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

  $(".cart_info_td").each(function (index, element) {
    if ($(element).find(".individual_cart_checkbox").is(":checked") === true) {
      //체크여부
      // 총 가격
      totalPrice += parseInt($(element).find(".individual_price_input").val());
      // 총 갯수
      totalCount += parseInt(
        $(element).find(".individual_cart_amount_input").val()
      );
      // 총 종류
      totalKind += 1;
    }
  });

  /* 배송비 결정 */
  if (totalPrice >= 30000) {
    deliveryPrice = 0;
  } else if (totalPrice == 0) {
    deliveryPrice = 0;
  } else {
    deliveryPrice = 3000;
  }

  finalTotalPrice = totalPrice + deliveryPrice;

  /* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

  // 총 가격
  $(".totalPrice_span").text(totalPrice.toLocaleString());
  // 총 갯수
  $(".totalCount_span").text(totalCount);
  // 총 종류
  $(".totalKind_span").text(totalKind);
  // 총 마일리지
  $(".totalPoint_span").text(totalPoint.toLocaleString());
  // 배송비
  $(".delivery_price").text(deliveryPrice);
  // 최종 가격(총 가격 + 배송비)
  $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
}

/* 수량버튼 */
$(".plus_btn").on("click", function () {
  let quantity = $(this).parent("div").find("input").val();
  $(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function () {
  let quantity = $(this).parent("div").find("input").val();
  if (quantity > 1) {
    $(this).parent("div").find("input").val(--quantity);
  }
});

/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function () {
  let cartId = $(this).data("cartid");
  let bookCount = $(this).parent("td").find("input").val();
  $(".update_cartId").val(cartId);
  $(".update_bookCount").val(bookCount);
  $(".quantity_update_form").submit();
});

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function (e) {
  e.preventDefault();
  const cartId = $(this).data("cartid");
  $(".delete_cartId").val(cartId);
  $(".quantity_delete_form").submit();
});

/* 주문 페이지 이동 */
$(".order_btn").on("click", function () {
  let form_contents = "";
  let orderNumber = 0;

  $(".cart_info_td").each(function (index, element) {
    if ($(element).find(".individual_cart_checkbox").is(":checked") === true) {
      //체크여부

      let product_id = $(element).find(".individual_product_id_input").val();
      let cart_amoun = $(element).find(".individual_cart_amoun_input").val();

      let product_id_input =
        "<input name='orders[" +
        orderNumber +
        "].product_id' type='hidden' value='" +
        product_id +
        "'>";
      form_contents += product_id_input;

      let cart_amount_input =
        "<input name='orders[" +
        orderNumber +
        "].cart_amount' type='hidden' value='" +
        cart_amount +
        "'>";
      form_contents += cart_amount_input;

      orderNumber += 1;
    }
  });

  $(".order_form").html(form_contents);
  $(".order_form").submit();
});
