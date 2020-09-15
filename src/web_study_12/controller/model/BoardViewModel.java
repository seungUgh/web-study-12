package web_study_12.controller.model;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import web_study_12.controller.Command;
import web_study_12.dto.Board;
import web_study_12.service.BoardService;

public class BoardViewModel implements Command {
	private BoardService service = new BoardService();

@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int num = Integer.parseInt(request.getParameter("num").trim());
		System.out.println("num > " + num);
		
		Board board = service.getBoard(num);
		service.readCount(num);
		request.setAttribute("board", board);
		return "board/boardView.jsp";
	}
}