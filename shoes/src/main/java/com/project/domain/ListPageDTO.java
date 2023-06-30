package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
public class ListPageDTO {
	private int totalCount;
	private List<ProductDTO> productDTOs;
}
