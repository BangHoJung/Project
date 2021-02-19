package team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import team.dto.MemberDTO;
import team.dto.StoreDTO;
import team.service.MemberService;
import team.service.StoreService;

@Controller
public class MainController {
	private MemberService memberService;
	private StoreService storeService;
	
	
	public MainController(MemberService memberService, StoreService storeService) {
		super();
		this.memberService = memberService;
		this.storeService = storeService;
	}

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/loginView.do")
    public String loginView() {
        return "login";
    }

    @RequestMapping("/loginAction.do")
    public String loginAction(HttpServletRequest request,HttpSession session) {
        System.out.println("login.do");
        String id = request.getParameter("id");
        System.out.println("id: "+id);
        String pass = request.getParameter("pass");
        System.out.println("pass: "+pass);
        MemberDTO dto = new MemberDTO();
        dto = memberService.loginMember(id,pass);
        if(dto.getId() != null) {
            String addr = memberService.selectAddress(dto.getId(),dto.getAddressNo());
            System.out.println("member에 저장된:"+addr);
            session.setAttribute("login", true);
            session.setAttribute("id", dto.getId());
            session.setAttribute("name", dto.getName());
            session.setAttribute("tel",dto.getTel());
            session.setAttribute("address",addr);
            session.setAttribute("point",dto.getPoint());
            session.setAttribute("grade",dto.getGrade());
            System.out.println("로그인 성공");
            return "main";
        }
        else {
            session.setAttribute("login", false);
            System.out.println("로그인 실패");
        }
        return "login";
    }
	
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	
	@RequestMapping("/registerAction.do")
	public String registerAction(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		String category = request.getParameter("category");
		int count = 0;
		JSONObject obj = new JSONObject();
		
		MemberDTO dto = new MemberDTO(id, pass, name, tel, 0, addrNo, category);
		count = memberService.insertMember(dto);
		return null;
		
	}
	
	@RequestMapping("/store_registerView.do")
	public String storeRegisterView() {
		return "store_register";
	}
	
	@RequestMapping("/store_registerAction.do")
	public String storeRegisterAction(HttpServletRequest request, HttpSession session) {
//		String member_id = (String) session.getAttribute("id");
		String member_id = "testId";
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String license = request.getParameter("license");
		String time = request.getParameter("time");
		if(time == null) time = "";
		String introduce = request.getParameter("introduce");
		if(introduce == null) introduce = "";
		int category = Integer.parseInt(request.getParameter("category"));
		String store_id = (String) session.getAttribute("id") + "_" + license;
		
		storeService.storeRegister(new StoreDTO(store_id, name, addr, license, member_id, time, introduce, tel, category));
		
		return "main";
	}
	

}
