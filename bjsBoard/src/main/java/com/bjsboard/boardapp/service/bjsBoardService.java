package com.bjsboard.boardapp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsboard.boardapp.dao.bjsBoardDao;

@Service
public class bjsBoardService {
	@Autowired
	private bjsBoardDao dao;
	
	public List<Map<String,Object>> getBoardList(int page){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		int startBoardNum= ((page-1)*10)+1;
		int endBoardNum=page*10;
		System.out.println("startBoardNum: "+startBoardNum);
		System.out.println("endBoardNum: "+endBoardNum);
		result=dao.getBoardList(startBoardNum, endBoardNum);
		return result;
	}
	
	public List<Map<String,Object>> getBoardAllList(){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		result=dao.getAllBoardList();
		return result;
	}
	public int boardWrite(Map<String, Object> board) {
		return dao.boardWrite(board);
	}
	
	public Map<String, Object> getBoardByBoardNum(int boardNum){
		return dao.getBoardByBoardNum(boardNum);
	}
	
	public int boardModify(Map<String, Object> board){
		return dao.boardModify(board);
	}
	
	public int boardDelete(int boardNum){
		return dao.boardDelete(boardNum);
	}
	
}
