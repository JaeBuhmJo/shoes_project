package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AttachmentDTO;
import com.project.domain.ColorSize;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.domain.QnaPageDTO;
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
	
	
	
	
	
	
//	
//	
//	// 리턴 total(상품에 대한 후기 전체 개수),  List<ReviewDTO> 
//	
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
	
	
	@PreAuthorize("principal.username == #dto.memberId")
	@DeleteMapping("/{reviewId}")
	public ResponseEntity<String> deleteRid(@PathVariable("reviewId") int reviewId,@RequestBody ReviewDTO dto){
		log.info("리뷰 삭제",reviewId);
		return customerService.deleteRid(reviewId)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping("/get/{reviewId}")
	@PreAuthorize("principal.username == #dto.memberId")
	public ResponseEntity<String> updateReview(@RequestBody ReviewDTO dto,@PathVariable("reviewId") int reviewId){
		return customerService.updateReview(dto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	@GetMapping("/sale")
	public void saleGet() {
		log.info("sale 화면");

	}
// 
	@GetMapping("/detail")
	public void detailRead(Model model,String productId,@ModelAttribute("cri") Criteria cri) {
		log.info("detail 화면");

		// model 은 jsp에서 여기선 product.productId,product.price등의 값들을 주기 위해 사용		
		model.addAttribute("product", service.detail(productId));
		// 색상
		model.addAttribute("color", service.color(productId));		
	}
	
	
	
	//재고 아이디 추출
	@GetMapping("/getInventoryId")
	@ResponseBody
	public String product(@RequestParam("productColor") String productColor,@RequestParam("productSize") String productSize,@RequestParam("productId") String productId) {
		InventoryDTO inventoryDTO = service.inventoryIdGet(productId, productColor, productSize);
		return inventoryDTO!=null?inventoryDTO.getInventoryId():null;
	}
	
	
	//데이터만 넘김
	  @GetMapping("/size")  
	  @ResponseBody 
	  public List<ColorSize> getSize(String productId,String productColor){ 
		  	return service.size(productId, productColor);
	  
	  }
	  
	  // 리뷰 리스트 /review/285/pages/1
	  
	  @GetMapping("/review/{productId}/pages/{page}")	  
	  public ResponseEntity<ReviewPageDTO> reviewList(@PathVariable String productId,@PathVariable int page) {
		  log.info("review list "+productId+", page ="+page);
			
		  Criteria cri = new Criteria(page, 10);
			
		  List<ReviewDTO> list = service.reviewList(cri,productId);
		  int total = service.reviewTotal(cri,productId);
			
		  ReviewPageDTO pageDTO = new ReviewPageDTO(total, list);
			
		  return new ResponseEntity<ReviewPageDTO>(pageDTO, HttpStatus.OK);
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
