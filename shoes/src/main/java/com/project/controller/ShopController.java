package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.AttachmentDTO;
import com.project.domain.Criteria;
import com.project.domain.ListPageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ProductService productService;

	@GetMapping("/list")
	public void listGet(@ModelAttribute("cri") Criteria cri, Model model, @RequestHeader("User-agent") String userAgent) {
		log.info("list 요청");
		int total = productService.getSaleCount(cri);
		List<ProductDTO> list = productService.getSaleProducts(cri);
		log.info("크라이"+cri);
		for (ProductDTO productDTO : list) {
			String filePath = "/default/txt-file.png";
			if (productDTO.getAttachmentList().get(0).getUuid() != null) {
				AttachmentDTO dto = productDTO.getAttachmentList().get(0);
				filePath = dto.getUploadPath() + "\\" + dto.getUuid() + "_" + dto.getFileName();
			}
			productDTO.setFilePath(filePath.replace("\\", "/"));
		}
		model.addAttribute("productListPage", new ListPageDTO(cri, total));
		model.addAttribute("list", list);
	}

//	아래로는 리스트 ajax화의 흔적
//	@GetMapping("/list")
//	public void listGet(@ModelAttribute("cri") Criteria cri, Model model) {
//		log.info("list 요청");
//		int total = productService.getSaleCount();
//		model.addAttribute("productListPage",new ListPageDTO(cri, total));
//	}
//	
//	@GetMapping("/getlist")
//	public ResponseEntity<List<ProductDTO>> listGet(Criteria cri) {
//		log.info("fetch list");
//		List<ProductDTO> productList = productService.getSaleProducts(cri);
//		return new ResponseEntity<List<ProductDTO>>(productList, HttpStatus.OK);
//	}
}
