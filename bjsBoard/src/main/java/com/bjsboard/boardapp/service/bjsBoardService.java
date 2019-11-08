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
	
	public List<Map<String,Object>> getBoardAllList(){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		result=dao.getAllBoardList();
		
		return result;
	}
}
