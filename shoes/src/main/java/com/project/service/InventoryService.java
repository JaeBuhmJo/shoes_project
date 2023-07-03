package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;

public interface InventoryService {
	public boolean stockInventory(ProductDTO productDTO);
	public List<InventoryDTO> getProductInventories(String productId);
	public boolean modifyInventory(ProductDTO productDTO);
	public boolean closeInventory(String productId);
	public boolean isStocked(InventoryDTO inventoryDTO);
	public List<ProductDTO> getAllInventories(Criteria cri);
	public boolean decreaseInventory(CartDTO cartDTO);
}
