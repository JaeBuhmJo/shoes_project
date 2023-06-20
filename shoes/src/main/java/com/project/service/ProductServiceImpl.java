package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
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

	@Override
	public boolean registerProduct(ProductDTO productDTO) {
		return productMapper.insertProduct(productDTO)==1?true:false;
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
