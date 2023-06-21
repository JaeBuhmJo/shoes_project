package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor @NoArgsConstructor
public class AttachmentDTO {
	private String uuid;
	private String productId;
	private String uploadPath;
	private String fileName;
}
