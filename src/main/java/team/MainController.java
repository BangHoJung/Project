package team;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String main() {
		return "main";
	}
  
	@RequestMapping("/login")
	public String membership(HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	

}
