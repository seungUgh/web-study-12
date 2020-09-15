package web_study_12.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//http://localhost:8080/web_study_12/boardList.do입력, boardList.do --- >controller에서 상반되는 boarderListModel 불러옴.. 어쩌고저쩌고
@WebServlet(urlPatterns = { "*.do" },
			loadOnStartup = 1, //controller가 여러개 띄어지면 이거....
			initParams = {
					@WebInitParam(/*name = "loadOnStartup", value = "1"*/
									name = "configFile", 
									value = "/WEB-INF/commandHandler.properties")
					})

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> handlerMap = new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("configFile"); //상단의 configFile의 value가져옴...!
		try (InputStream is = config.getServletContext().getResourceAsStream(configFile)) {//commandhandler.properties주소가져오기
			Properties props = new Properties();
			props.load(is);

			for (Entry<Object, Object> entry : props.entrySet()) {
				// System.out.println(entry.getKey() + " : "+ entry.getValue());
				Class<?> cls = Class.forName((String) entry.getValue());
				Command command = (Command) cls.newInstance();
				handlerMap.put((String) entry.getKey(), command);
			}

			for (Entry<String, Command> e : handlerMap.entrySet()) {
				System.out.println(e.getKey() + " : " + e.getValue());
//	  /boardList.do : web_study_12.controller.model.BoardListModel@53185edb -> @뒤에 16진수 주소가 출력되었다는것은 객체가 생성되엇다는 의미! !!!!
			}
		} catch (IOException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getRequestURI();
		String contextPath = request.getContextPath();

		System.out.println("command > " + command + " contextPath > " + contextPath);
		System.out.println(command.substring(contextPath.length()));
		if (command.indexOf(contextPath) == 0) {
			//0 존재한다 , -1존재 x command->boardList.do 
			command = command.substring(contextPath.length());
		}

		Command commandHandler = handlerMap.get(command);
		System.out.println(commandHandler); //getListModel 리턴됨

		String viewPage = commandHandler.process(request, response); 
		//boarderListModel에 pocess의 리턴값(redirection,포워딩 null로 return[<->ajax ])
		System.out.println("viewPage > " + viewPage);
		
		if (viewPage != null) {
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}

}