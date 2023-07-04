package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.CartDTO;
import com.project.domain.Criteria;
import com.project.domain.ProductDTO;

@Mapper
public interface ProductMapper {
	public List<ProductDTO> getOnSaleList(Criteria cri);
	public int getOnSaleCount(Criteria cri);
	public List<ProductDTO> getTotalList(Criteria cri);
	public int insertProduct(ProductDTO productDTO);
	public int getCurrentProductSequence();
	public ProductDTO getProduct(String productId);
	public int updateProduct(ProductDTO productDTO);
	public int updateSoldCount(CartDTO cartDTO);
}