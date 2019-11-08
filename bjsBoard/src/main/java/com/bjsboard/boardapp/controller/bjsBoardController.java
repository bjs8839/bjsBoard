package com.bjsboard.boardapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bjsboard.boardapp.service.bjsBoardService;

@Controller
public class bjsBoardController {
	@Autowired
	private bjsBoardService service;
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		List<Map<String,Object>> result;
		result= service.getBoardAllList();
		model.addAttribute("boardList",result);
		return "main";
	}
//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//	public String test(Model model) {
//		List<Map<String,Object>> result;
//		result= service.getBoardAllList();
//		model.addAttribute("boardList",result);
//		return "main";
//	}
}
