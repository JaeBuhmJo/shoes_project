package com.project.service;

import java.util.ArrayList;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderPageDTO;
import com.project.domain.OrderPageProductDTO;
import com.project.domain.OrderProductDTO;
import com.project.domain.ProductImageDTO;
import com.project.mapper.CartMapper;
import com.project.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	
	//@Autowired
	//private ProductMapper productMapper;

	@Override
	public List<OrderPageProductDTO> getorder_list(List<OrderPageProductDTO> orders) {
		
		List<OrderPageProductDTO> result = new ArrayList<OrderPageProductDTO>();
		
		for(OrderPageProductDTO opd : orders) {
			
			OrderPageProductDTO orderInfo = orderMapper.getOrder_list(opd.getProductId());
			
			orderInfo.setCartamount(opd.getCartamount());
			
			//List<Product_ImageDTO> imageList = Product_ImageDTO.getimageList(orderInfo.getProduct_id());
			
			//orderInfo.setImagelist(imageList);
			
			result.add(orderInfo);
		}
		return result;
	}
	
	
	@Override
	@Transactional
	public void order(OrderDTO ord) {
		// 사용할 데이터 가져오기
		     /* 회원 정보 */
		// MemberDTO member = memberMapper.getMemberInfo(orderdto.getmember_id);
		
		    /* 주문 정보 */
		List<OrderProductDTO> ords = new ArrayList<OrderProductDTO>();
		
//		for(OrderProductDTO opd : ord.get) {
//			OrderProductDTO orderProduct = orderMapper.getOrderInfo(opd.getProduct_id());
//			/* 수량 셋팅 */
//			orderProduct.setPurchase_amount(opd.getPurchase_amount());    //주문수량
//			
//			/* 기본정보 셋팅 */
//			orderProduct.getTotalprice();
//			
//			/* List 객체 추가 */
//			ords.add(orderProduct);
//			
		}
		/* OrderDTO 셋팅 */
		

	}


