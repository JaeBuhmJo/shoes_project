package com.project.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatRoomsViewController {
	 
	@GetMapping("/list")
	@PreAuthorize("isAuthenticated()")
	public void getList() {
	}
	  
	@GetMapping("/room/{chatRoomId}")
	@PreAuthorize("isAuthenticated()") 
	public String getRoom(@PathVariable String chatRoomId, Principal principal ,Model model) {
		model.addAttribute("chatRoomId", chatRoomId);
		model.addAttribute("memberId", principal.getName());
		return "/chat/room";
	}
}
