package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.ProductImageDTO;

@Mapper
public interface ProductImageMapper {
	
	// 이미지 데이터 반환
	public List<ProductImageDTO> getProduct_ImageDTOList(String productId);

}
