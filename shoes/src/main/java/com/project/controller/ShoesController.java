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
import com.project.service.AttachmentService;
import com.project.service.CustomerService;
import com.project.service.DetailService;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shoes")
public class ShoesController {

	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private DetailService service;
	
	@Autowired
	private CustomerService customerService;
	
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
			return "/member/memberPage?page=1&listAmount=10&searchType=&keyword=";
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
		log.info("신발 색상 선택");
		
		List<AttachmentDTO> attachmentDTOs = attachmentService.getAttachmentList(productId);
		List<String> filePathList = new ArrayList<String>();
		for (AttachmentDTO attachmentDTO : attachmentDTOs) {
			StringBuffer sb = new StringBuffer();
			sb.append(attachmentDTO.getUploadPath());
			sb.append("\\");
			sb.append(attachmentDTO.getUuid());
			sb.append("_");
			sb.append(attachmentDTO.getFileName());
			String filePath = sb.toString().replace("\\", "/");
			filePathList.add(filePath);
		}
		model.addAttribute("filePathList", filePathList);
		model.addAttribute("listLength", filePathList.size());

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
	  
	  
	  
	  
	  
	  
	  @GetMapping("/review/{reviewId}")	
	public ResponseEntity<ReviewDTO> getReview(@PathVariable String reviewId){
		log.info("review 가져오기 "+ reviewId);
		return  new ResponseEntity<ReviewDTO>(customerService.reviewGet(reviewId), HttpStatus.OK);
	}
	  
	  
	  
	@PutMapping("/review/{reviewId}")
//	@PreAuthorize("principal.username == #dto.memberId")
	public ResponseEntity<String> updateReview(@RequestBody ReviewDTO dto){
		log.info("review 수정 "+dto);
		return customerService.updateReview(dto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	  
	@GetMapping("/review")
	public void getReview() {
		
	}
	  
	  
	  
	
}
