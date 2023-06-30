package com.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		

	@Override
	@Transactional
	public void order(OrderDTO orderdto) {
		// 사용할 데이터 가져오기
		     /* 회원 정보 */
		boolean member = memberMapper.equals(orderdto.getMemberId());
		
		    /* 주문 정보 */
		List<OrderProductDTO> ords = new ArrayList<OrderProductDTO>();	
		for(OrderProductDTO opd : orderdto.getOrders()) {
			OrderProductDTO orderProduct = orderMapper.getOrderInfo(opd.getProductId());
			
			/* 수량 셋팅 */
			orderProduct.setPurchaseAmount(opd.getPurchaseAmount());    //주문수량
			
			/* 기본 셋팅  */
			orderProduct.getDiscountPrice();
						
			/* List 객체 추가 */
			ords.add(orderProduct);
			
		}
		/* OrderDTO 셋팅 */
		orderdto.setOrders(ords);
		orderdto.getOrderfinalPrice();
		

		/*DB 주문,주문상품 넣기*/
		
		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member + format.format(date);
		orderdto.setOrderId(orderId);
		
		/* db넣기 */
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

