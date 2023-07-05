package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AttachmentDTO;
import com.project.domain.Criteria;
import com.project.domain.OrderListDTO;
import com.project.domain.PaymentDTO;
import com.project.mapper.AttachmentMapper;
import com.project.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private AttachmentMapper attachmentMapper;
	
	// 주문목록 리스트 가져오기
	@Override
	public List<OrderListDTO> list(String memberId, Criteria criteria) {
		List<OrderListDTO> list = orderMapper.orderList(memberId,criteria);
		for (OrderListDTO orderListDTO : list) {
			//if(attachmentMapper.getAttachments(orderListDTO.getProductId()).size()!=0) {				
			
				AttachmentDTO attachmentDTO = attachmentMapper.getAttachments(orderListDTO.getProductId()).get(0);
				StringBuffer sb = new StringBuffer();
				sb.append(attachmentDTO.getUploadPath());
				sb.append("\\");
				sb.append("thumb_");
				sb.append(attachmentDTO.getUuid());
				sb.append("_");
				sb.append(attachmentDTO.getFileName());
				String filePath = sb.toString().replace("\\", "/");
				orderListDTO.setFilePath(filePath);
			//}
		}
		
		return list;
	}

// 주문목록 총 갯수(페이지 나누기)
	@Override
	public int getTotalCnt(String memberId,Criteria cry) {
		return orderMapper.getTotalOrderCount(memberId, cry);
	}

	@Override
	public int getNextOrderSeq() {
		return orderMapper.getOrderSequence();
	}

	@Override
	public boolean placeOrder(PaymentDTO paymentDTO) {
		
		return orderMapper.insertOrder(paymentDTO)==1?true:false;
	}
}