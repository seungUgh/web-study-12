package web_study_12.controller.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_study_12.controller.Command;
import web_study_12.dto.Board;
import web_study_12.service.BoardService;

public class BoardListModel implements Command {
   private BoardService service = new BoardService();

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      List<Board> list = service.getBoards();
      request.setAttribute("list", list);
      return "board/boardList.jsp";
   }
}