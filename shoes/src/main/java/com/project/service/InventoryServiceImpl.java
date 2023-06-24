package com.project.service;

import java.util.ArrayList;
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
	public boolean stockInventory(ProductDTO productDTO) {
		List<InventoryDTO> inventoryDTOList = new ArrayList<InventoryDTO>();
		String productId = productDTO.getProductId();
		int listSize = productDTO.getColorList().size();
		for (int i = 0; i < listSize; i++) {
			inventoryDTOList.add(new InventoryDTO(productId, productDTO.getColorList().get(i), 
												  productDTO.getSizeList().get(i), productDTO.getQuantityList().get(i)));
		}
		return inventoryMapper.insertInventory(inventoryDTOList) == listSize ? true : false;
	}

	@Override
	public boolean modifyInventory(ProductDTO productDTO) {
		List<InventoryDTO> inventoryDTOList = new ArrayList<InventoryDTO>();
		String productId = productDTO.getProductId();
		int listSize = productDTO.getColorList().size();
		for (int i = 0; i < listSize; i++) {
			inventoryDTOList.add(new InventoryDTO(productId, productDTO.getColorList().get(i), 
												  productDTO.getSizeList().get(i), productDTO.getQuantityList().get(i)));
		}
		return inventoryMapper.updateInventory(inventoryDTOList) == listSize ? true : false;
	}

	@Override
	public List<InventoryDTO> getProductInventories(String productId) {
		return inventoryMapper.getInventories(productId);
	}

	@Override
	public boolean closeInventory(String productId) {
		return inventoryMapper.closeInventory(productId) > 0 ? true : false;
	}

	@Override
	public boolean isStocked(InventoryDTO inventoryDTO) {
		return inventoryMapper.checkInventory(inventoryDTO) > 0 ? true : false;
	}

	@Override
	public List<ProductDTO> getAllInventories(Criteria cri) {
		return inventoryMapper.getTotalInventories(cri);
	}
}
