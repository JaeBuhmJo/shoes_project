package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderPageProductDTO;

@Mapper
public interface PurchaseMapper {
	
	//최초 주문 등록
	public void Purchase(OrderDTO orderdto);
		
	//주문 상세 등록
	public void PurchaseDetail(OrderPageProductDTO orderpageproductdto);
	
	//주문한 카트 id 삭제
	public void cartDelete(int cartId);
	


}
