package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.InventoryRequestDTO;
import com.project.domain.ProductDTO;

public interface InventoryService {
	public boolean stockInventory(InventoryRequestDTO inventoryRequestDTO, String productId);
	public List<InventoryDTO> getProductInventories(String productId);
	public boolean modifyInventory(InventoryDTO inventoryDTO);
	public boolean removeInventory(InventoryDTO inventoryDTO);
	public boolean isStocked(InventoryDTO inventoryDTO);
	public List<ProductDTO> getAllInventories(Criteria cri);
}
