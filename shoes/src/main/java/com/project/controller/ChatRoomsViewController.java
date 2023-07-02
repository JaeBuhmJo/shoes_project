package com.project.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mapper.ChatRoomMapper;

@Controller
@RequestMapping("/chat")
public class ChatRoomsViewController {
	
	@Autowired
	private ChatRoomMapper chatRoomMapper;

	@GetMapping("/list")
	@PreAuthorize("isAuthenticated()")
	public String getList(Authentication authentication) {
		return isAdmin(authentication) ? "/admin/chat/list" : "/chat/list";
	}

	@GetMapping("/room/{chatRoomId}")
	@PreAuthorize("isAuthenticated()")
	public String getRoom(@PathVariable String chatRoomId, Principal principal, Model model,
			Authentication authentication) {
		if(isAdmin(authentication)) {
			model.addAttribute("chatRoomId", chatRoomId);
			model.addAttribute("memberId", principal.getName());
			return "/admin/chat/room";
		}
		//URL 강제접속 희망자가 방 개설자가 맞는지 확인
		if(chatRoomMapper.getMemberId(chatRoomId).equals(principal.getName())) {
		model.addAttribute("chatRoomId", chatRoomId);
		model.addAttribute("memberId", principal.getName());
		return "/chat/room";
		}
		return "redirect:/chat/list";
	}

	public boolean isAdmin(Authentication authentication) {
		for (GrantedAuthority grantedAuthority : authentication.getAuthorities()) {
			if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
				return true;
			}
		}
		return false;
	}
}
