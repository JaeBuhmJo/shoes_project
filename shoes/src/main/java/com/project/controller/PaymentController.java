package com.project.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.domain.PaymentDTO;
import com.project.service.CartService;
import com.project.service.InventoryService;
import com.project.service.MemberService;
import com.project.service.OrderService;
import com.project.service.ProductService;
import com.project.service.PurchaseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/info")
	public ResponseEntity<PaymentDTO> getPaymentInfo(Principal principal){
		log.info("결제 정보 요청");
		PaymentDTO paymentDTO = new PaymentDTO();
		//추후 하나의 서비스 임플로 정리
		//주문 이름 만들어서 보내자
		String memberId = principal.getName();
		List<CartDTO> cartList = cartService.getCartList(memberId);
		StringBuffer sb = new StringBuffer();
		sb.append("[BLACKPEARL] ");
		sb.append(cartList.get(0).getProductName());
		if(cartList.size()>1) {
			sb.append(" 외 ");
			sb.append(cartList.size()-1);
			sb.append("건");
		}
		paymentDTO.setOrderName(sb.toString());
		int amount = cartService.getCartTotal(memberId).getTotalPrice();
		paymentDTO.setAmount(amount);
		MemberDTO memberDTO= memberService.getMemberInfo(memberId);
		paymentDTO.setMember(memberDTO);
		String orderId = getOrderId();
		paymentDTO.setOrderId(orderId);
		return new ResponseEntity<PaymentDTO>(paymentDTO, HttpStatus.OK);
	}

	// 이건 무조건 포스트여야지
	@PostMapping("/process")
	public ResponseEntity<String> paymentProcessPost(Principal principal, PaymentDTO paymentDTO) {
		//오더 정보 생성하고 정면에 정보 보내주기
		log.info("결제 성공, 후 프로세스 요청"+paymentDTO);
		String memberId = principal.getName();
		List<CartDTO> cartList = cartService.getCartList(memberId);
		//추후 리팩토링 요함
		for (CartDTO cartDTO : cartList) {
			// 산것들은 재고 감소시키고
			inventoryService.decreaseInventory(cartDTO);
			productService.increaseSoldCount(cartDTO);
			// 구매 목록에 전부 담고
			purchaseService.savePurchaseLog(cartDTO);
		}
		// 카트는 비우고
		cartService.deleteCart(memberId);
		// 주문 정보 생성
		paymentDTO.setMember(memberService.getMemberInfo(memberId));
		//오더아이디 멤버아이디 오더네임 결제금액 결제수단
		orderService.placeOrder(paymentDTO);
		return new ResponseEntity<String>("Success", HttpStatus.OK);
	}
	
	public String getOrderId() {
		LocalDateTime now = LocalDateTime.now();
        // 시, 분, 초, 밀리세컨트 값을 얻습니다.
        int hour = now.getHour();
        int minute = now.getMinute();
        int second = now.getSecond();
        int millisecond = now.getNano() / 1_000_000;
        int seq = orderService.getNextOrderSeq();
        StringBuffer sb = new StringBuffer();
        sb.append(hour);
        sb.append(minute);
        sb.append(second);
        sb.append(millisecond);
        sb.append(seq);
        return sb.toString();
	}
}
