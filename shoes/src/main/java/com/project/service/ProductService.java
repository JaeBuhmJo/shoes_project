package com.project.service;

import java.util.List;

import com.project.domain.ColorSizeDTO;
import com.project.domain.Criteria;
import com.project.domain.ProductDTO;

public interface ProductService {
	public List<ProductDTO> getSaleProducts(Criteria cri);
	public int getSaleCount(Criteria cri);
	public List<ProductDTO> getAllProducts(Criteria cri);
	public boolean registerProduct(ProductDTO productDTO, List<String> colorList);
	public int getCurrentProductId();
	public ProductDTO getSingleProduct(String productId);
	public boolean modifyProduct(ProductDTO productDTO);
}
