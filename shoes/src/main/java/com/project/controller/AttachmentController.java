package com.project.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.domain.AttachmentDTO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@RestController
@RequestMapping("/attachment")
public class AttachmentController {

	@Value("${shoes.uploadPath}")
	private String uploadPath;

	@GetMapping("/show")
	public ResponseEntity<byte[]> getAttachment(String fileName) {
		log.info("상품 이미지 요청 : " + fileName);
		File file = new File(uploadPath+fileName);
		
		ResponseEntity<byte[]> result = null;
		try {
			new HttpHeaders().add("content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@PutMapping("/register")
	public ResponseEntity<List<AttachmentDTO>> registerAttachments(MultipartFile[] attachment) {
		log.info("업로드 요청 : " + attachment);
		List<AttachmentDTO> attachmentList = new ArrayList<AttachmentDTO>();

		String uploadFolderPath = getFolder();
		File uploadFullPath = new File(uploadPath, uploadFolderPath);

		if (!uploadFullPath.exists()) {
			uploadFullPath.mkdirs();
		}

		for (MultipartFile multipartFile : attachment) {
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();

			File saveFile = new File(uploadFullPath, fileName);

			AttachmentDTO attachmentDTO = new AttachmentDTO();
			attachmentDTO.setUuid(uuid.toString());
			attachmentDTO.setFileName(multipartFile.getOriginalFilename());
			attachmentDTO.setUploadPath(uploadFolderPath);

			try {
				multipartFile.transferTo(saveFile);
				BufferedImage origin = ImageIO.read(saveFile);

				// 4배율 축소 썸네일 생성
				int ratio = 4;
				int width = origin.getWidth() / ratio;
				int height = origin.getHeight() / ratio;
				File thumbnail = new File(uploadFullPath, "thumb_" + fileName);
				Thumbnails.of(origin).size(width, height).toFile(thumbnail);

			} catch (Exception e) {
				e.printStackTrace();
			}
			attachmentList.add(attachmentDTO);
		}
		return new ResponseEntity<>(attachmentList, HttpStatus.OK);
	}

	// 날짜별 폴더 경로 가져오기
	public String getFolder() {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return date.replace("-", File.separator);
	}

}
