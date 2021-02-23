package team;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import team.dto.MemberAddressDTO;
import team.dto.MemberDTO;
import team.dto.MessageDTO;
import team.dto.QnaDTO;
import team.dto.StoreDTO;
import team.service.MemberService;
import team.service.QnaService;
import team.service.StoreService;
import team.vo.PaggingVO;

@Controller
public class MainController {
	private MemberService memberService;
	private StoreService storeService;
	private QnaService qnaService;
	

	public MainController(MemberService memberService, StoreService storeService, QnaService qnaService) {
		super();
		this.memberService = memberService;
		this.storeService = storeService;
		this.qnaService = qnaService;
	}
	
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	@RequestMapping("/myPageView.do")
	public String myPageView() {
		return "mypage";
	}
	@RequestMapping("/loginView.do")
    public String loginView() {
        return "login";
    }
	@RequestMapping("/notice.do")
	public String notice() {
		return "notice";
	}
	@RequestMapping("/introduce.do")
	public String introduce() {
		return "introduce";
	}
	@RequestMapping("/guide.do")
	public String guide() {
		return "guide";
	}
	@RequestMapping("/insertUpdateAddressView.do")
	public String insertUpdateAddressView() {
		return "insert_update_address_view";
	}
	@RequestMapping("/qnaView.do")
	public String qnaView(HttpServletRequest request) {
		int page=1; int pageOfContentCount =20;
		//페이지 셋팅
		if(request.getParameter("pageNo") != null)
			page = Integer.parseInt(request.getParameter("pageNo"));
		System.out.println(page);
		List<QnaDTO> list = qnaService.selectQnaList(page);//글목록 읽어옴
		int count = qnaService.selectCount();
		PaggingVO vo = new PaggingVO(count, page,pageOfContentCount);
		request.setAttribute("list", list);
		request.setAttribute("pagging", vo);
		System.out.println(list.toString());
		return "qna";
	}
	@RequestMapping("/qnaDetailView.do")
	public String qnaDetailView(HttpServletRequest request) {
		int qno= 0;
		if(request.getParameter("qno") != null)
			qno = Integer.parseInt(request.getParameter("qno"));
		else
			qno = (int)request.getAttribute("qno");
		QnaDTO dto = qnaService.selectQna(qno);
		
		request.setAttribute("qna", dto);
		return "qna_detail_view";
	}
    @RequestMapping("/loginAction.do")
    public String login(HttpServletRequest request,HttpSession session) {
		System.out.println("login.do");
		String id = request.getParameter("id");
		System.out.println("id: "+id);
		String pass = request.getParameter("pass");
		System.out.println("pass: "+pass);
		try {	
		MemberDTO dto = memberService.loginMember(id,pass);
		if(dto.getMember_id() != null) {
			String addr = memberService.selectAddress(dto.getMember_id(),dto.getMember_addressNo());
			System.out.println("member에 저장된 주소:"+addr);
			session.setAttribute("login", true);
			session.setAttribute("id", dto.getMember_id());
			session.setAttribute("name", dto.getMember_name());
			session.setAttribute("tel",dto.getMember_tel());
			session.setAttribute("address",addr);
			session.setAttribute("point",dto.getMember_point());
			session.setAttribute("grade",dto.getMember_grade());
			session.setAttribute("category",dto.getMember_category());
			System.out.println("로그인 성공");
			return "main";
		}
		}catch (NullPointerException e) {
			session.setAttribute("login", false);
			System.out.println("로그인 실패");
		}
		return "login";
	}
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "main";
	}
    
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	
	@RequestMapping("/registerAction.do")
	public String registerAction(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		String pass = request.getParameter("pass");
		System.out.println(pass);
		String name = request.getParameter("name");
		System.out.println(name);
		String tel = request.getParameter("tel1")+"-";
		 tel += request.getParameter("tel2")+"-";
		 tel += request.getParameter("tel3");
		 System.out.println(tel);
		 String address = request.getParameter("roadAddress");
		 address +=" "+request.getParameter("detailAddress");
		 System.out.println(address);
         String category="";
         String [] arr = request.getParameterValues("category");
         for (int i = 0; i < arr.length; i++) {
			category +=arr[i].toString();
		}
        System.out.println(category);
        String checkID =memberService.selectMember(id);
        if(checkID !=null) {
        	try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("회원가입이 실패했습니다");
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        else {
        	MemberDTO dto = new MemberDTO(id,pass,name,tel,0,1,category,0);
        	int count=memberService.registerMember(dto);
        	if(count !=0) {
        		MemberAddressDTO addr = new MemberAddressDTO(id, 1, address);
        		int addrCount=memberService.registerAddress(addr);
        		if(addrCount !=0) {
        			   try {
               			response.setContentType("text/html;charset=utf-8");
       					response.getWriter().write("회원가입이 성공했습니다");
       				} catch (IOException e) {
       					e.printStackTrace();
       				}
               		}
        	
        	}
        }
		return null;
	}
	
	@RequestMapping("/checkID.do")
	public String checkID(HttpServletRequest request,HttpServletResponse response) {
		String id= request.getParameter("id");
		System.out.println(id);
		if(id.length()<4) {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("아이디는 4글자 이상으로 작성해주세요.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			
		 String checkID =memberService.selectMember(id);
	        if(checkID !=null) {
               try {
            	response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("중복된 아이디입니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
	        }
	        else {
				try {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("사용가능한 아이디입니다.");
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
		}
		return null;
	}
	
	
	@RequestMapping("/storeRegisterView.do")
	public String storeRegisterView() {
		return "store_register";
	}
	
	@RequestMapping("/storeRegisterAction.do")
	public String storeRegisterAction(HttpServletRequest request,MultipartHttpServletRequest mqRequest) {
//		String member_id = (String) session.getAttribute("id");
		String member_id = "admin";
		String name = request.getParameter("name");
		String tel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String addr = request.getParameter("addr");
		String license = request.getParameter("license");
		MultipartFile mf = mqRequest.getFile("file");
		String time = request.getParameter("time");
		if(time == null) time = " ";
		String introduce = request.getParameter("introduce");
		if(introduce == null) introduce = " ";
		int category = Integer.parseInt(request.getParameter("category"));
		String store_id = name + "_" + license;
		
		System.out.println("mf :"+mf);
		
		String path = "C:\\fileupload\\"+store_id+"\\";
		File pathFile=null;
		try {
			String originalFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			System.out.println("originalFileName : " + originalFileName);
			System.out.println("fileSize : " + fileSize);
			File parentPath = new File(path);
			if(!parentPath.exists()) parentPath.mkdirs();
			
			//파일 업로드
			pathFile = new File(path + originalFileName);
			mf.transferTo(pathFile);
		} catch(Exception e) {
			e.printStackTrace();
		}
		storeService.storeRegister(new StoreDTO(store_id, name, addr, license, member_id, time, introduce, tel, category,0,pathFile.getName()));
		
		return "main";
	}
	
	@RequestMapping("storeCheckView.do")
	public String storeCheckView(HttpServletRequest request) {
//		String store_id = request.getParameter("store_id");
		String store_id = "식당이름_1";
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		System.out.println(dto.toString());
		
		request.setAttribute("dto", dto);
		 
		return "store_check";
	}
	
	@RequestMapping("storeCheckConfirm.do")
	public String storeCheckConfirm(HttpServletRequest request) {
		String store_id = request.getParameter("store_id");
		String title ="안녕하세요 관리자 입니다.";
		String content="식당 등록 신청 건에 대하여 승인요청이 완료되었습니다.마이페이지에서 메뉴 등록 신청서를 작성해주시기 바랍니다.\n";
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		// 식당 등록 신청한 사용자에게 승인결과 전송
//		memberService.sendMessage(dto.getStore_member_id(),title,content);
		int count = storeService.updateStoreCode(store_id,1);
		
		return "store_check";
	}
	
	@RequestMapping("storeCheckReject.do")
	public String storeCheckReject(HttpServletRequest request) {
		String store_id = request.getParameter("store_id");
		String title ="안녕하세요 관리자 입니다.";
		String content="식당 등록 신청 건에 대하여 승인요청이 거절되었습니다.\n자세한 내용을 원하시면 문의사항에 등록해주시기 바랍니다.";
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		// 식당 등록 신청한 사용자에게 승인결과 전송
//		memberService.sendMessage(dto.getStore_member_id(),title,content);
		int count = storeService.deleteStoreDTO(store_id);
		
		return "store_check";
  }
	
	@RequestMapping("menuRegisterView.do")
	public String menuRegisterView() {
		return "menu_register";
	}
	
	@RequestMapping("menuRegisterAction.do")
	public String menuRegisterAction(HttpServletRequest request) {
		return "menu_register";
	}
	
   @RequestMapping("adminMessageView.do")
   public String adminMessageView() {
	   return "admin_message";
   }
   @RequestMapping("userMessageView.do")
   public String userMessageView(HttpSession session,HttpServletRequest request) {
	   String id=(String)session.getAttribute("id");
	   int pageNo = 1; int pageOfContentCount =10;
	   if(request.getParameter("pageNo") != null)
	   pageNo = Integer.parseInt(request.getParameter("pageNo"));
	   List<MessageDTO> list = memberService.selectUserMessageList(id,pageNo);
		if(list.isEmpty()) {
			request.setAttribute("message", null);
			return "user_message";
		}
		int count = memberService.selectMessageCount(id);
		PaggingVO vo = new PaggingVO(count, pageNo,pageOfContentCount);
		request.setAttribute("message", list);
		request.setAttribute("page", vo);
	    return "user_message";
	   }   
   @RequestMapping("/messageDetailView.do")  
   public String messageDetailView(HttpServletRequest request,HttpSession session) {
	   int no = Integer.parseInt(request.getParameter("no"));
	   System.out.println("detail_View_No:"+no);
	   int pageNo= Integer.parseInt(request.getParameter("pageNo"));
	   String login_id=(String)session.getAttribute("id");
	   MessageDTO dto = memberService.selectUserMessage(no);
	   String messag_id=dto.getMessage_member_id();
	   if(login_id.equals(messag_id)==true){
		   System.out.println(dto.toString());
		   memberService.updateMessageStatus(no,messag_id);
		   request.setAttribute("content",dto.getMessage_content());
		   request.setAttribute("date",dto.getMessage_date());
		   request.setAttribute("pageNo",pageNo);
		   request.setAttribute("message_no", no);
		   return "message_detail_view";
	   }
	   else{
	     request.setAttribute("Invalid_access", true);
	   }
	   return "message_detail_view";  
   }
   @RequestMapping("/deleteMessage.do")
   public String deleteMessage(HttpServletRequest request,HttpSession session) {
	   String checkRow= request.getParameter("checkRow");
	   String [] message_no_str = checkRow.split(",");
	   String id=(String)session.getAttribute("id");
	   List<MessageDTO> list;
	   int message_no;
	   int pageNo = 1; int pageOfContentCount =10;
	   if(request.getParameter("pageNo") != null)
	   pageNo = Integer.parseInt(request.getParameter("pageNo"));
	   for(int i=0;i<message_no_str.length;i++) {
		   System.out.println(message_no_str[i].toString());
		   message_no=Integer.parseInt(message_no_str[i]);
		   int complete=memberService.deleteMessage(message_no,id);
		   if(complete !=0) {
			   System.out.println("삭제 성공");
			   request.setAttribute("deleteComplete",true);   
		   }
		   else {
			   System.out.println("삭제 실패");
			   request.setAttribute("deleteComplete",false);
		   }
			list = memberService.selectUserMessageList(id,pageNo);
			if(list.isEmpty()) {
				request.setAttribute("message", null);
				return "user_message";
			}
			int count = memberService.selectMessageCount(id);
			PaggingVO vo = new PaggingVO(count, pageNo,pageOfContentCount);
			request.setAttribute("message", list);   	 
			request.setAttribute("page", vo);			
	   }
	   return "user_message";
   }
   
   @RequestMapping("file_download.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//다운로드 할 파일명
		String fileName = request.getParameter("fileName");
		String writer = request.getParameter("writer");
		//다운로드할 파일 전체 경로
		String path = "C:\\fileupload\\"+writer+"\\"+fileName;
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		
		fileName = URLEncoder.encode(fileName,"utf-8");
		
		//다운로드시 나타낼 기본파일명
		response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLengthLong(file.length());
		
		//사용자에게 파일을 전송
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		//버퍼 생성
		byte[] buffer = new byte[1024*1024];
		 
		while(true) {
			int size = fis.read(buffer); // 읽어온 바이트수
			if(size == -1) {
				break;
			}
			bos.write(buffer,0,size);
			bos.flush();
		}
		
		fis.close();
		bos.close();
	}
} 
	   
