package com.project.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.AttachmentDTO;
import com.project.domain.Criteria;
import com.project.domain.ListPageDTO;
import com.project.domain.ProductDTO;
import com.project.domain.VisitDTO;
import com.project.mapper.VisitCounterMapper;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ProductService productService;

	@Autowired
	private VisitCounterMapper visitCounterMapper;

	@GetMapping("/visitCounter")
	public void visitCounterGet(HttpServletRequest request, HttpServletResponse response) {
		String clientIpAddress = request.getRemoteAddr();
		Cookie[] cookies = request.getCookies();

		LocalDate currentDate = LocalDate.now();
		// 해당 IP의 쿠키를 이미 가지고 있는 경우 -> 리턴
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("blackpearl_visited_" + currentDate.toString())
						&& cookie.getValue().equals(clientIpAddress)) {
					return;
				}
			}
		}

		// 해당 IP의 쿠키를 가지고 있지 않은 경우
		VisitDTO visitDTO = new VisitDTO(currentDate, clientIpAddress);

		if (visitCounterMapper.wasVisited(visitDTO) == 0 ? true : false) {
			log.info("미방문 고객 쿠키 생성" + visitDTO);
			visitCounterMapper.createVisit(visitDTO);
		}

		// Send a new cookie to the client
		Cookie visitCookie = new Cookie("blackpearl_visited_" + currentDate.toString(), clientIpAddress);
		visitCookie.setComment(currentDate.toString());
		visitCookie.setMaxAge(24 * 60 * 60);
		visitCookie.setPath("/");
		response.addCookie(visitCookie);
	}

	@GetMapping("/list")
	public void listGet(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("list 폼 요청");
	}

	@PostMapping("/list")
	public ResponseEntity<ListPageDTO> listPost(@RequestBody Criteria cri) {
		log.info("list body 요청 "+cri);
		return new ResponseEntity<ListPageDTO>(productService.getProductsList(cri), HttpStatus.OK);
	}
}
