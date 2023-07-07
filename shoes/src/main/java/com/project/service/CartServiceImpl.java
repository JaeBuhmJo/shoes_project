package com.project.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int addCart(CartDTO cart) {
		// 장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		// 장바구니 등록 , 에러시 0 반환
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}

	// 장바구니 정보 리스트 
	@Override
	public List<CartDTO> getCartList(String memberId) {
		List<CartDTO> cart = cartMapper.getCart(memberId);
		
		return cart;
	}

	public CartDTO getCartTotal(String memberId) {
		CartDTO cartTotal = cartMapper.getCartTotal(memberId);
		return cartTotal;
	}
	

	@Override
	public int modifyamount(CartDTO cart) {
		return cartMapper.modifyamount(cart);
	}

	@Override
	public boolean deleteCart(String memberId) {
		return cartMapper.deleteCart(memberId)>0?true:false;
	}

}
