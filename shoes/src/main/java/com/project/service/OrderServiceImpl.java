package com.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderProductDTO;
import com.project.mapper.AttachmentMapper;
import com.project.mapper.CartMapper;
import com.project.mapper.MemberMapper;
import com.project.mapper.OrderMapper;
import com.project.mapper.ProductMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private AttachmentMapper attachmentMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private ProductMapper productMapper;
		

	/*@Override
	@Transactional
	public void order(OrderDTO orderdto) {
		// 사용할 데이터 가져오기
		      회원 정보 
		boolean member = memberMapper.equals(orderdto.getMemberId());
		
		     주문 정보 
		List<OrderProductDTO> ords = new ArrayList<OrderProductDTO>();	
		for(OrderProductDTO opd : orderdto.getOrders()) {
			OrderProductDTO orderProduct = orderMapper.getOrderInfo(opd.getProductId());
			
			 수량 셋팅 
			orderProduct.setPurchaseAmount(opd.getPurchaseAmount());    //주문수량
			
			 기본 셋팅  
			orderProduct.getDiscountPrice();
						
			 List 객체 추가 
			ords.add(orderProduct);
			
		}
		 OrderDTO 셋팅 
		orderdto.setOrders(ords);
		orderdto.getOrderfinalPrice();
		

		DB 주문,주문상품 넣기
		
		 orderId만들기 및 OrderDTO객체 orderId에 저장 
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member + format.format(date);
		orderdto.setOrderId(orderId);
		
		 db넣기 
		orderMapper.Order(orderdto);		//orders 등록
		for(OrderProductDTO opd : orderdto.getOrders()) {		//vam_orderItem 등록
			opd.setOrderId(orderId);
			orderMapper.OrderProduct(opd);			
		}

	}


	@Override
	public List<OrderProductDTO> orderList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}
}

*/
	
	
	public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    public void placeOrder(List<CartDTO> cartId, String memberId, String orderName, String orderAddress, String orderPhone, String orderPayment) {
        // Generate a unique orderId
        String orderId = generateOrderId();

        // Create the order DTO
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setOrderId(orderId);
        orderDTO.setMemberId(memberId);
        orderDTO.setOrderName(orderName);
        orderDTO.setOrderAddress(orderAddress);
        orderDTO.setOrderPhone(orderPhone);
        orderDTO.setOrderPayment(orderPayment);

        // Retrieve the product information from the cart
        List<OrderProductDTO> orderProducts = new ArrayList<>();
        for (CartDTO cartItem : cartId) {
            OrderProductDTO orderProductDTO = OrderProductDTO(orderId, (CartDTO) cartId);
            orderProducts.add(orderProductDTO);
        }
        orderDTO.setOrders(orderProducts);

        // Calculate the total price of the order
        int totalPrice = calculateTotalPrice(orderProducts);
        orderDTO.setTotalPrice(totalPrice);

        // Insert the order information into the database
        orderMapper.insertOrder(orderDTO);

        // Insert the order product information into the database
        for (OrderProductDTO orderProduct : orderProducts) {
            orderMapper.insertOrderProduct(orderProduct);
        }
    }

    private String generateOrderId() {
        // Implement your logic to generate a unique orderId
        return null;
    }

    private OrderProductDTO OrderProductDTO(String orderId, CartDTO cartId) {
        OrderProductDTO orderProductDTO = new OrderProductDTO();
        orderProductDTO.setOrderId(orderId);
        orderProductDTO.setProductId(cartId.getProductId());
        orderProductDTO.setPurchaseAmount(cartId.getCartAmount());
        orderProductDTO.setPrice(cartId.getPrice());
        orderProductDTO.setDiscountPrice(cartId.getDiscountPrice());
        int totalPrice = (cartId.getPrice() - cartId.getDiscountPrice()) * cartId.getCartAmount();
        orderProductDTO.setTotalPrice(totalPrice);
        return orderProductDTO;
    }

    private int calculateTotalPrice(List<OrderProductDTO> orderProducts) {
        int totalPrice = 0;
        for (OrderProductDTO orderProduct : orderProducts) {
            totalPrice += orderProduct.getTotalPrice();
        }
        return totalPrice;
    }

	@Override
	public void order(OrderDTO orderdto) {
		String orderId = generateOrderId();
        orderdto.setOrderId(orderId);
	}
        
     @Override
     public List<OrderProductDTO> orderList(String memberId) {
     return orderMapper.getOrderProductsByMemberId(memberId);
    }
	
	
}