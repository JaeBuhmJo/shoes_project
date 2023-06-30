package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.ListPageDTO;
import com.project.domain.ProductDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public ListPageDTO getProductsList(Criteria cri) {
		List<ProductDTO> list = productMapper.getOnSaleList(cri);
		//리스트 순환하면서 별점이랑 리뷰개수 들고오기
		for (ProductDTO productDTO : list) {
		}
		int productsCount = productMapper.getOnSaleCount(cri);
		
		return new ListPageDTO(productsCount, list);
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
		String priorColor= "";
		for (String color : colorList) {
			if(!color.equals(priorColor)) {
			sb.append(color);
			sb.append(",");
			}
			priorColor = color;
		}
		String colors = sb.delete(sb.length() - 1, sb.length()).toString();
		productDTO.setColors(colors);
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
		if (productDTO.getDetail().isEmpty()) {
			productDTO.setDetail(" ");
		}
		return productMapper.updateProduct(productDTO) == 1 ? true : false;
	}

}
