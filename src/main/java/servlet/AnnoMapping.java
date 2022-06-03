package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
web.xml에 매핑을 하는 대신 @WebServlet 어노테이션을 사용하여
요청명에 대한 매핑을 한다. 편한 방식이지만 차후 유지보수를 위해서는
요청명과 서블릿 클래스의 관계를 명확히 해둔 상태에서 사용해야 한다.

즉, web.xml을 사용하면 요청명을 확인하고 web.xml에 들어가서 찾으면 바로 찾을수
있지만, 어노테이션을 사용했을때는 패키지, 서블릿, 클래스의 일정한 규칙을 정의해 놓지
않으면 해당 요청명의 서블릿을 찾기 굉장히 어려워질수 있다.
*/
@WebServlet("/13Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//request영역에 속성값 저장
		req.setAttribute("message", "@WebServlet으로 매핑");
		//JSP로 포워드를 걸어준다.
		req.getRequestDispatcher("/13Servlet/AnnoMapping.jsp").forward(req, resp);
	}
}
