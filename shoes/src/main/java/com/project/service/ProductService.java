package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;

public interface ProductService {
	public List<ProductDTO> getSaleProducts(Criteria cri);
	public int getSaleCount();
	public List<ProductDTO> getAllProducts(Criteria cri);
	public boolean registerProduct(ProductDTO productDTO);
	public boolean stockInventory(InventoryDTO inventoryDTO);
	public int getCurrentProductId();
}
