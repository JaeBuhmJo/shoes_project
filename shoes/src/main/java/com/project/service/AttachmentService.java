package com.project.service;

import java.util.List;

import com.project.domain.AttachmentDTO;
import com.project.domain.ProductDTO;

public interface AttachmentService {
	public List<AttachmentDTO> getAttachmentList(String productId);
	public boolean registerAttachment(ProductDTO productDTO);
	public boolean modifyAttachment(ProductDTO productDTO);
	public boolean removeAttachmentList(String productId);
}
