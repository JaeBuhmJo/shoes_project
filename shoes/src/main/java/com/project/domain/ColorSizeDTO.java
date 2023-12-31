package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor
public class ColorSizeDTO {
	private List<String> colorList;
	private List<String> sizeList;
}
