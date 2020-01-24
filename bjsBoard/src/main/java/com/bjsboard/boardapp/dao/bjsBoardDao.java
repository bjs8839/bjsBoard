package com.bjsboard.boardapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface bjsBoardDao {
	public List<Map<String, Object>> getAllBoardList();
	public List<Map<String, Object>> getBoardList(@Param("startBoardNum")int startBoardNum, @Param("endBoardNum")int endBoardNum);
	public int boardWrite(Map<String, Object> board);
	public Map<String, Object> getBoardByBoardNum(int boardNum);
	public int boardModify(Map<String, Object> board);
	public int boardDelete(int boardnum);
}
