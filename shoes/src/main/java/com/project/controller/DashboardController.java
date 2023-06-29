package com.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.DashboardStatisticsDTO;
import com.project.service.DashboardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/dashboard")
public class DashboardController {
	
	@Autowired
	private DashboardService dashboardService;
	
	@GetMapping("/statistics")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public ResponseEntity<DashboardStatisticsDTO> statisticsGet() {
		log.info("어드민 대시보드 통계 데이터 요청");
		DashboardStatisticsDTO dashboardData = dashboardService.getDashboardData();
		if(dashboardData!=null) {
			return new ResponseEntity<DashboardStatisticsDTO>(dashboardData, HttpStatus.OK);
		}else {
			return new ResponseEntity<DashboardStatisticsDTO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	} 
	
	@GetMapping("/areachart")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public ResponseEntity<Map<String, Integer>> areachartGet(){
		Map<String, Integer> areaChartData = dashboardService.getAreaChartData();
		if(areaChartData!=null) {
			return new ResponseEntity<Map<String, Integer>>(areaChartData, HttpStatus.OK);
		}else {
			return new ResponseEntity<Map<String, Integer>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/piechart")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public ResponseEntity<List<String>> piechartGet(){
		List<String> pieChartData = dashboardService.getPieChartData();
		if(pieChartData!=null) {
			return new ResponseEntity<List<String>>(pieChartData, HttpStatus.OK);
		}else {
			return new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
