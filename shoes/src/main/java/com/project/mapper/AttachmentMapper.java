package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.AttachmentDTO;

@Mapper
public interface AttachmentMapper {
	public List<AttachmentDTO> getAttachments(String productId);
	public int insertAttachments(List<AttachmentDTO> attachmentDTOList, String productId);
	public int deleteAttachments(String productId);
}
