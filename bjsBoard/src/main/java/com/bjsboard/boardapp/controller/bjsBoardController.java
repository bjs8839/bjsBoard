package com.bjsboard.boardapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bjsboard.boardapp.service.bjsBoardService;

@Controller
public class bjsBoardController {
	@Autowired
	private bjsBoardService service;

	@RequestMapping(value = "/boardWriteRe", method = RequestMethod.GET)
	public String boardWrite() {

		for(int i=0; i<30; i++) {
			Map<String, Object> board = new HashMap<String, Object>();
			board.put("nickname", "백종석"+i);
			board.put("password", "1234"+i);
			board.put("title", "제목입니다"+i);
			board.put("content", "내용입니다"+i);
			
			service.boardWrite(board);
			
		}
		return "main";
	}

	@RequestMapping(value = "/main",  method = RequestMethod.GET)
	public String main(Model model, @RequestParam(required=false, defaultValue = "1") int page ) {
		
		List<Map<String, Object>> result;
		result = service.getBoardList(page);
//		System.out.println(result);
		model.addAttribute("boardList", result);
		
		Map<String, Object> pageResult = service.getPageNum(page);
		System.out.println(pageResult);
		model.addAttribute("pageResult", pageResult);
		
		return "main";
	}

	@RequestMapping(value = "/boardWriteView", method = RequestMethod.GET)
	public String boardWriteView() {
		return "boardWriteView";
	}

	@RequestMapping(value = "/boardDetailView", method = RequestMethod.GET)
	public String boardDetail(@RequestParam("boardNum") int boardNum, Model model) {
		Map<String, Object> result = service.getBoardByBoardNum(boardNum);
		model.addAttribute("boardDetail", result);
		return "boardDetailView";
	}

	@RequestMapping(value = "/boardModifyView", method = RequestMethod.GET)
	public String boardModifyView(@RequestParam("boardNum") int boardNum, Model model) {
		Map<String, Object> result = service.getBoardByBoardNum(boardNum);
		System.out.println("result:" + result);
		model.addAttribute("boardDetail", result);
		return "boardModifyView";
	}

	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardWrite(@RequestParam(value = "nickname") String nickname, @RequestParam("password") String password,
			@RequestParam("title") String title, @RequestParam("content") String content) {

		Map<String, Object> board = new HashMap<String, Object>();
		board.put("nickname", nickname);
		board.put("password", password);
		board.put("title", title);
		board.put("content", content);

		int result = service.boardWrite(board);
		if (result == 1) {
			System.out.println("글쓰기성공");
			return "redirect:/main";
		} else {
			System.out.println("글쓰기실패!!");
			return "main";
		}
	}

	@RequestMapping(value = "/boardModify", method = RequestMethod.GET)
	public String boardModify(@RequestParam("boardNum") int boardNum, @RequestParam("nickname") String nickname,
			@RequestParam("password") String password, @RequestParam("title") String title, @RequestParam("content") String content) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNum", boardNum);
		paramMap.put("nickname", nickname);
		paramMap.put("password", password);
		paramMap.put("title", title);
		paramMap.put("content", content);
		int result = service.boardModify(paramMap);
		if (result == 1) {
			System.out.println("글수정성공");
			return "redirect:/main";
		} else {
			return "boardModifyView";
		}
	}

	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("boardNum") int boardNum) {

		int result = service.boardDelete(boardNum);
		if (result == 1) {
			System.out.println("글삭제성공");
			return "redirect:/main";
		} else {
			return "boardModifyView";
		}
	}

//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//	public String test(Model model) {
//		List<Map<String,Object>> result;
//		result= service.getBoardAllList();
//		model.addAttribute("boardList",result);
//		return "main";
//	}
}
