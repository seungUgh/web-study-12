package web_study_12.controller.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_study_12.controller.Command;
import web_study_12.dto.Board;
import web_study_12.service.BoardService;

public class BoardCheckPassModel implements Command {
	private BoardService service = new BoardService();

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("BoardCheckPass >>  get ");

			String url = null;

			int num = Integer.parseInt(request.getParameter("num").trim());
			String pass = request.getParameter("pass");

			System.out.println("num >>>" + num + "pass>>>" + pass);

			Board board = service.checkPassword(pass, num);
			System.out.println("service num ->> " + num + "service pass ->>" + pass);
			//http://localhost:8080/web_study_12/boardCheckPass.do?num=1&
			if(board !=null) {
				url="board/boardCheckSuccess.jsp";
			}else {
				url="board/boardCheckPass.jsp";
				request.setAttribute("message", "비밀번호가 틀렸습니다.");
			}
			return url;
		}else {
			
		}
		return null;
	}
}