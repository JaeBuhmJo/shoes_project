package com.project.service;

import java.util.List;

import com.project.domain.AttachmentDTO;

public interface AttachmentService {
	public List<AttachmentDTO> getAttachmentList(String productId);
	public boolean registerAttachment(AttachmentDTO attachmentDTO);
	public boolean removeAttachmentList(String productId);
}
