package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.ColorSizeDTO;
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
	public int getSaleCount(Criteria cri) {
		return productMapper.getOnSaleCount(cri);
	}

	@Override
	public List<ProductDTO> getAllProducts(Criteria cri) {
		return productMapper.getTotalList(cri);
	}

	@Transactional
	@Override
	public boolean registerProduct(ProductDTO productDTO, List<String> colorList) {
		StringBuilder sb = new StringBuilder();
		if (colorList != null && !colorList.isEmpty()) {
			for (String string : colorList) {
				sb.append(string);
				sb.append(",");
			}
			String colors = sb.delete(sb.length() - 1, sb.length()).toString();
			productDTO.setColors(colors);
		}
		// 상세설명을 등록 원치 않을 경우, DB Null 인서트 방지
		if (productDTO.getDetail().isEmpty()) {
			productDTO.setDetail(" ");
		}
		return productMapper.insertProduct(productDTO) == 1 ? true : false;
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
		return productMapper.updateProduct(productDTO) == 1 ? true : false;
	}
}
