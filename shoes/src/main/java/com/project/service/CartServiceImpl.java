package com.project.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AttachmentDTO;
import com.project.domain.CartDTO;
import com.project.mapper.AttachmentMapper;
import com.project.domain.ProductImageDTO;
import com.project.mapper.CartMapper;
import com.project.mapper.ProductImageMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private AttachmentMapper attachmentMapper;
	
	@Autowired
	private ProductImageMapper imageMapper;
	
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
		
//		for(CartDTO dto : cart) {
//			
//			// 이미지 정보 얻기(Attachments)
//			String productId = dto.getProductId();
//			
//			List<AttachmentDTO> attachmentDTOList = attachmentMapper.getAttachments(productId);
//			List<ProductImageDTO> imagelist = imageMapper.getProduct_ImageDTOList(productId);
//			
//			dto.setAttachmentList(attachmentDTOList);
//		}
		
		return cart;
	}

	public CartDTO getCartTotal(String memberId) {
		CartDTO cartTotal = cartMapper.getCartTotal(memberId);
		System.out.println(cartTotal);
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
