package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AttachmentDTO;
import com.project.domain.ColorSize;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.domain.ReviewDTO;
import com.project.domain.ReviewPageDTO;
import com.project.service.CustomerService;
import com.project.service.DetailService;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shoes")
public class ShoesController {

	@Autowired
	private DetailService service;
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/review")
	public void reviewInsert() {
	}
	
	@PostMapping("/review")
	public String reviewPost(Model model,String productId,ReviewDTO review,RedirectAttributes rttr,Criteria cri) {
		log.info("review post");
		
		model.addAttribute("product", service.detail(productId));
		if(customerService.reviewInsert(review)) {
			rttr.addAttribute("result", review.getReviewId());
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("amount", cri.getListAmount());
			log.info("review write",review);
			return "redirect:/member/memberdetail";
		}
		
		return "redirect:/shoes/detail";
	}
	
	@GetMapping("/sale")
	public void saleGet() {
		log.info("sale 화면");

	}
// 
	@GetMapping("/detail")
	public void detailRead(Model model,String productId,String productColor,String productSize, @ModelAttribute("cri") Criteria cri) {
		log.info("detail 화면");

		// model 은 jsp에서 여기선 product.productId,product.price등의 값들을 주기 위해 사용		
		model.addAttribute("product", service.detail(productId));
		// 색상
		model.addAttribute("color", service.color(productId));
		
//		model.addAttribute("review", customerService.reviewTotal(productId));
		
		log.info("신발 색상 선택");
		List<ReviewDTO> list = service.reviewList(cri);

		model.addAttribute("inventory", service.inventoryIdGet(productId, productColor, productSize));
//		model.addAttribute("inventory", service.inventoryIdGet(dto));
		model.addAttribute("list", list);
//		int total = service.reviewTotal(cri);
		
		model.addAttribute("filePathList", getAttachments(model, productId));
		log.info(productId);

//		model.addAttribute("reviewPage", new ReviewPageDTO(cri, total));
	}

	@GetMapping("/getInventoryId")
	@ResponseBody
	public String product(@RequestParam("productColor") String productColor,@RequestParam("productSize") String productSize,@RequestParam("productId") String productId) {
		InventoryDTO inventoryDTO = service.inventoryIdGet(productId, productColor, productSize);
//		InventoryDTO inventoryDTO = service.inventoryIdGet(null);
		return inventoryDTO!=null?inventoryDTO.getInventoryId():null;
	}

	
	
	
 //데이터만 넘김
	  @GetMapping("/size")  
	  @ResponseBody 
	  public List<ColorSize> getSize(String productId,String productColor){ 
		  	return service.size(productId, productColor);
	  
	  }
	
	  public List<String> getAttachments(Model model, String productId) {
			ProductDTO productDTO = productService.getSingleProduct(productId);
			//상품 하나에 딸린 이미지 목록 로드
			List<String> filePathList = new ArrayList<String>();
			String filePath = "/default/txt-file.png";
			
			if (productDTO.getAttachmentList() != null) {
				for (AttachmentDTO dto : productDTO.getAttachmentList()) {
					filePath = dto.getUploadPath() + "\\" + dto.getUuid() + "_" + dto.getFileName();
					filePathList.add(filePath.replace("\\", "/"));
				}
			}else {
				filePathList.add(filePath);
				return filePathList;
			}
			return filePathList;
	  }
	 
}
