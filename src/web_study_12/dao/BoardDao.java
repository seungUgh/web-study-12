package web_study_12.dao;

import java.util.List;

import web_study_12.dto.Board;

public interface BoardDao {
	
	List<Board> selectBoardByAll();
	
	int insertBoard(Board board);
	
	void updateReadCount(int num);
	
	Board selectBoardByNum(int num); //파라미터 parseInt안하고 넘겨주겟다고...! 
	
	int updateBoard(Board board);
	
	Board checkPassword(String pass, int num); //해당 글쓴이인지 판단하기 위한
	
	int deleteBoard(int num);
}
