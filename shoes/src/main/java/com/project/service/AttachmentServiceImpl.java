package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AttachmentDTO;
import com.project.mapper.AttachmentMapper;

@Service
public class AttachmentServiceImpl implements AttachmentService {

	@Autowired
	private AttachmentMapper attachmentMapper;

	@Override
	public List<AttachmentDTO> getAttachmentList(String productId) {
		return attachmentMapper.getAttachments(productId);
	}

	@Override
	public boolean registerAttachment(AttachmentDTO attachmentDTO) {
		return attachmentMapper.insertAttachments(attachmentDTO)==1? true:false;
	}

	@Override
	public boolean removeAttachmentList(String productId) {
		return attachmentMapper.deleteAttachments(productId)>0?true:false;
	}
	
	
}
