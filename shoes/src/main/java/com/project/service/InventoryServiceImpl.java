package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.InventoryRequestDTO;
import com.project.domain.ProductDTO;
import com.project.mapper.InventoryMapper;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private InventoryMapper inventoryMapper;

	@Override
	public boolean stockInventory(InventoryRequestDTO inventoryRequestDTO, String productId) {
		List<String> colorList = inventoryRequestDTO.getColorList();
		List<String> sizeList = inventoryRequestDTO.getSizeList();
		// 색상과 사이즈가 최소 1개 이상 빈칸인 경우 db 작업 생략

		List<InventoryDTO> inventoryDTOList = new ArrayList<>();
		List<Integer> quantityList = inventoryRequestDTO.getQuantityList();
		boolean isQuantityEntered = (quantityList != null && !quantityList.isEmpty());

		int listSize = inventoryRequestDTO.getColorList().size();
		int quantity = 0;
		int quantityidx = 0;
		// 색상 종류만큼 회전하면서 각 색상의 사이즈 리스트를 반복하여 수량과 매칭 + 리스트에 담기
		for (int i = 0; i < listSize; i++) {
			String color = colorList.get(i);
			String[] sizeArr = sizeList.get(i).split(",");
			for (String size : sizeArr) {
				if (isQuantityEntered && quantityList.get(quantityidx) != null) {
					quantity = quantityList.get(quantityidx);
				} else {
					quantity = 0;
				}
				inventoryDTOList.add(new InventoryDTO(productId, color, size, quantity));
				quantityidx += 1;
			}
		}
		return inventoryMapper.insertInventory(inventoryDTOList) == listSize ? true : false;
	}

	@Override
	public List<InventoryDTO> getProductInventories(String productId) {
		return inventoryMapper.getInventories(productId);
	}

	@Override
	public boolean modifyInventory(InventoryDTO inventoryDTO) {
		return inventoryMapper.updateInventory(inventoryDTO) == 1 ? true : false;
	}

	@Override
	public boolean removeInventory(InventoryDTO inventoryDTO) {
		return inventoryMapper.deleteInventory(inventoryDTO) == 1 ? true : false;
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
