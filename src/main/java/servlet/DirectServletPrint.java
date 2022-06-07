package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//JSP를 View로 쓰지 않고 서블릿이 View의 역할까지 해야하는 경우에 사용하는 방식으로
//HTML을 출력하는데 이 교안처럼 사용하는 경우는 없고 JSON등의 라이브러리를 이용해서 사용한다.
//서블릿에서 직접 출력해야 할때가 생기면 사용될 수 있다.
//JSON을 이용해서 안드로이드와 통신하는등 데이터와 직접 통신해야 할때 사용된다.

//서블릿 생성을 위해 첫번째로 HttpServlet을 상속한다.
public class DirectServletPrint extends HttpServlet {

	/*
	사용자의 요청을 처리할 메서드를 오버라이딩 한다.
	여기서는 post방식의 요청이므로 doPost()를 오버라이딩 하면된다.
	*/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//서블릿에서 직접 HTML태그를 출력하기위해 문서의 컨텐츠 타입을 설정한다.
		resp.setContentType("text/html;charset=UTF-8");
		//직접 출력을 위해 PrintWriter객체를 생성한다.
		PrintWriter writer = resp.getWriter();
		//출력할 내용을 기술한다.
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다.</h2>");
		writer.println("<p>jsp로 포워드하지 않습니다.</p>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
}
