package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;

@Mapper
public interface InventoryMapper {
	public int insertInventory(InventoryDTO inventoryDTO);
	public List<InventoryDTO> getInventories(String productId);
	public int updateInventory(InventoryDTO inventoryDTO);
	public int deleteInventory(InventoryDTO inventoryDTO);
	public int checkInventory(InventoryDTO inventoryDTO);
	public List<ProductDTO> getTotalInventories(Criteria cri);
}
