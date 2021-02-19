package team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberDTO;
import member.MemberService;

@Controller
public class MainController {
	private MemberService service;
	@RequestMapping("/")
	public String main() {
		return "main";
	}
  
	@RequestMapping("/login")
	public String membership(HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		int grade = Integer.parseInt(request.getParameter("grade"));
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		String category = request.getParameter("category");
		int count = 0;
		JSONObject obj = new JSONObject();
		
		MemberDTO dto = new MemberDTO(id, pass, name, tel, grade, addrNo, category);
		count = service.insertMember(dto);
		return null;
	}
	

}
