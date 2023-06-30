package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AttachmentDTO;
import com.project.domain.PurchaseDTO;
import com.project.mapper.AttachmentMapper;
import com.project.mapper.OrderMapper;
import com.project.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	private AttachmentMapper attachmentMapper;
	
	@Autowired
	private OrderMapper orderMapper;
	
	private PurchaseMapper purchaseMapper;

	@Override
	public List<PurchaseDTO> getOrderlist(List<PurchaseDTO> orders) {

    List<PurchaseDTO> result = new ArrayList<PurchaseDTO>();
		
		for(PurchaseDTO purchasedto : orders) {
			
			PurchaseDTO Orderlist = purchaseMapper.getOrderlist(purchasedto.getProductId());
			
			Orderlist.setPurchaseAmount(purchasedto.getPurchaseAmount());
			
			Orderlist.getTotalprice();
			
			List<AttachmentDTO> attachmentList = attachmentMapper.getAttachments(Orderlist.getProductId());
			
			Orderlist.setAttachmentList(attachmentList);
			
			result.add(Orderlist);
		}
		return result;

  }
}
