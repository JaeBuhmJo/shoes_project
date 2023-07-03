package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.CartDTO;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;

@Mapper
public interface InventoryMapper {
	public int insertInventory(List<InventoryDTO> inventoryDTOList);
	public List<InventoryDTO> getInventories(String productId);
	public int updateInventory(List<InventoryDTO> inventoryDTOList);
	public int closeInventory(String productId);
	public int checkInventory(InventoryDTO inventoryDTO);
	public List<ProductDTO> getTotalInventories(Criteria cri);
	public int decreaseInventory(CartDTO cartDTO);
}
