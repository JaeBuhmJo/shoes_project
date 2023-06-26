package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.Product_ImageDTO;

@Mapper
public interface Product_ImageMapper {
	
	// 이미지 데이터 반환
	public List<Product_ImageDTO> getProduct_ImageDTOList(int product_id);

}
