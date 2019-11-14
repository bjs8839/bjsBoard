package com.bjsboard.boardapp.dao;

import java.util.List;
import java.util.Map;

public interface bjsBoardDao {
	public List<Map<String, Object>> getAllBoardList();
	public int boardWrite(Map<String, Object> board);
	public Map<String, Object> getBoardByBoardNum(int boardNum);
	public int boardModify(Map<String, Object> board);
	public int boardDelete(int boardnum);
}
