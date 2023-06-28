package com.project.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.DashboardDataDTO;
import com.project.service.DashboardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/dashboard")
public class DashboardController {
	
	@Autowired
	private DashboardService dashboardService;
	
	@GetMapping("/statistics")
	public ResponseEntity<DashboardDataDTO> statisticsGet() {
		log.info("어드민 대시보드 통계 데이터 요청");
		DashboardDataDTO dashboardData = dashboardService.getDashboardData();
		if(dashboardData!=null) {
			return new ResponseEntity<DashboardDataDTO>(dashboardData, HttpStatus.OK);
		}else {
			return new ResponseEntity<DashboardDataDTO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/areachart")
	public ResponseEntity<Map<String, Integer>> areachartGet(){
		Map<String, Integer> areaChartData = dashboardService.getAreaChart();
		if(areaChartData!=null) {
			return new ResponseEntity<Map<String, Integer>>(areaChartData, HttpStatus.OK);
		}else {
			return new ResponseEntity<Map<String, Integer>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
