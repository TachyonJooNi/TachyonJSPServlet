package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

//MVC패턴으로 회원인증을 처리하기 위한 서블릿 정의
public class MemberAuth extends HttpServlet{
	
	//서블릿에서 멤버변수 선언.
	MemberDAO dao;
	
	/*
	클라이언트가 최초로 요청했을때 서블릿 객체가 생성된 후 최초 1번만 실행되는
	init()메서드에서 DB연결 처리를 한다.
	*/
	@Override
	public void init() throws ServletException {
		/*
		서블릿 내에서 application내장객체를 얻어온다. 모델2 방식에서는 서블릿이
		먼저 요청을 받기 때문에 모델1방식과 같이 JSP에서 매개변수 형태로 내장객체를
		전달할 수 없다. 따라서 각 내장객체를 얻어올 수 있는 메서드가 존재한다.
		--즉, 모델1에서는 JSP가 요청을 받고, 모델2에서는 서블릿이 요청을 받기 때문에
		내장객체를 얻어 오는 방식이 다르다.
		--getServletContext()메서드를 이용해서 서블릿에서 application내장객체를 얻어옴.
		*/
		ServletContext application = this.getServletContext();
		
		//web.xml에 저장된 컨텍스트 초기화 파라미터를 얻어온다.
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
	
	/*
	service()메서드는 get방식 post방식 둘다 요청을 받을 수 있으므로
	해당 메서드 내에서 요청을 처리할 수 있다.
	--즉, 이전 챕터인 서블릿의 라이프 사이클에서 봤듯이 service()메서드는 get, post를
	판단해서 분기해주는 역할을 하기 때문에 요청을 받아 처리가 가능한 것이다.
	같은 이유로 하나의 서블릿에서 doGet(), doPost()를 다 사용해야하는 경우에는 사용할
	수 없다.
	*/
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//서블릿 초기화 파라미터를 얻어온다. 해당 서블릿에서만 사용할 수 있다.
		String admin_id = this.getInitParameter("admin_id");
		
		//쿼리스트링으로 전달된 파라미터를 얻어온다.
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		//DAO의 회원인증을 위한 메서드를 호출한다.
		/*
		아이디, 패스워드를 통해 회원인증을 진행한 후 일치하는 정보가 있다면
		회원레코드를 DTO에 저장한 후 반환한다. 만약 정보가 일치하지 않는다면
		내용이 없는 DTO를 반환하게 될것이다.
		*/
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		//회원이름을 통해 로그인 성공 여부를 판단한다.
		String memberName = memberDTO.getName();
		//로그인에 성공한 경우
		//-- 나중에는 그냥 session영역에 로그인을 성공한 회원정보를 저장만 하면된다.
		if (memberName != null) {
			req.setAttribute("authMessage", memberName + " 회원님 방가방가^^*");
		}
		//로그인에 실패한 경우라면 초기화 파라미터와 비교해서 최고관리자인지 확인한다.
		else {
			if(admin_id.equals(id))
				req.setAttribute("authMessage", admin_id + " 는 최고 관리자 입니다.");
			else
				req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
		}
		//처리한 메세지를 request영역에 저장한 후 JSP로 포워드한다.
		req.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(req, resp);
	}
	
	//서블릿 종료시 DAO객체도 같이 자원해제한다.
	@Override
	public void destroy() {
		dao.close();
	}
}
