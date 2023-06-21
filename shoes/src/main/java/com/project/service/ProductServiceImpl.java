package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.AttachmentDTO;
import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.mapper.AttachmentMapper;
import com.project.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private AttachmentMapper attachmentMapper;
	
	@Override
	public List<ProductDTO> getSaleProducts(Criteria cri) {
		return productMapper.getOnSaleList(cri);
	}

	@Override
	public int getSaleCount() {
		return productMapper.getOnSaleCount();
	}

	@Override
	public List<ProductDTO> getAllProducts(Criteria cri) {
		return productMapper.getTotalList(cri);
	}

	@Transactional
	@Override
	public boolean registerProduct(ProductDTO productDTO) {
		boolean insertFlag = productMapper.insertProduct(productDTO)==1?true:false;
		if(productDTO.getAttachmentList()==null || productDTO.getAttachmentList().size()==0) {
			return insertFlag;
		}
		productDTO.setProductId(String.valueOf(getCurrentProductId()));
		for (AttachmentDTO attachmentDTO: productDTO.getAttachmentList()) {
			attachmentDTO.setProductId(productDTO.getProductId());
			attachmentMapper.insertAttachments(attachmentDTO);
		}
		return insertFlag;
	}

	@Override
	public int getCurrentProductId() {
		return productMapper.getCurrentProductSequence();
	}

	@Override
	public ProductDTO getSingleProduct(String productId) {
		return productMapper.getProduct(productId);
	}

	@Override
	public boolean modifyProduct(ProductDTO productDTO) {
		return productMapper.updateProduct(productDTO)==1?true:false;
	}
}
