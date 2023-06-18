package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ProductDTO;

public interface ProductService {
	public List<ProductDTO> getSaleProducts(Criteria cri);
	public int getSaleCount();
}
