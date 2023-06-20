package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.mapper.InventoryMapper;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private InventoryMapper inventoryMapper;
	
	@Override
	public boolean stockInventory(InventoryDTO inventoryDTO) {
		return inventoryMapper.insertInventory(inventoryDTO)>0?true:false;
	}

	@Override
	public List<InventoryDTO> getProductInventories(String productId) {
		return inventoryMapper.getInventories(productId);
	}

	@Override
	public boolean modifyInventory(InventoryDTO inventoryDTO) {
		return inventoryMapper.updateInventory(inventoryDTO)==1?true:false;
	}

	@Override
	public boolean removeInventory(InventoryDTO inventoryDTO) {
		return inventoryMapper.deleteInventory(inventoryDTO)==1?true:false;
	}

	@Override
	public boolean isStocked(InventoryDTO inventoryDTO) {
		return inventoryMapper.checkInventory(inventoryDTO)>0?true:false;
	}

	@Override
	public List<ProductDTO> getAllInventories(Criteria cri) {
		return inventoryMapper.getTotalInventories(cri);
	}
}
