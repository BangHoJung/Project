package team;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import team.dto.AdDTO;
import team.dto.MemberAddressDTO;
import team.dto.MemberDTO;
import team.dto.MessageDTO;
import team.dto.NaverSearchBlogDTO;
import team.dto.NoticeDTO;
import team.dto.QnaDTO;
import team.dto.ReviewDTO;
import team.dto.StoreDTO;
import team.dto.StoreMenuDTO;
import team.dto.WishDTO;
import team.service.AdService;
import team.service.MemberService;
import team.service.QnaService;
import team.service.StoreService;
import team.vo.PaggingVO;

@Controller
public class MainController {
	private MemberService memberService;
	private StoreService storeService;
	private QnaService qnaService;
	private AdService adService;

	public MainController(MemberService memberService, StoreService storeService, QnaService qnaService,
			AdService adService) {
		super();
		this.memberService = memberService;
		this.storeService = storeService;
		this.qnaService = qnaService;
		this.adService = adService;
	}
	@RequestMapping("storeDetailView.do")
	   public String storeDetailView(HttpServletRequest request) {
	      String store_id = request.getParameter("store_id");
	      if(store_id == null) {
	         store_id = (String)request.getAttribute("store_id");
	      }
	      System.out.println("여기다"+store_id);
	      String member_id = (String)request.getSession().getAttribute("id");
	      StoreDTO dto = storeService.selectStoreDetailDTO(store_id);
	      List<ReviewDTO> reviewList = storeService.selectStoreReviewList(store_id);
	       for(int i=0;i<reviewList.size();i++) {
	          System.out.println(reviewList.get(i).toString());
	       }
//	      List<StoreMenuDTO> menuList = storeService.selectStoreMenuDetailList(store_id);
	       List<StoreMenuDTO> menuList = null;
	       if(dto.getReview()==0) {
	    	  menuList= storeService.selectStoreMenuList(store_id);
	      }
	      else {
	    	  menuList= storeService.selectStoreMenuListWtihReview(store_id);
	      }   
	      System.out.println(menuList.toString());
	      WishDTO wish =  memberService.selectWishOne(store_id,member_id);
	      request.setAttribute("menuList", menuList);
	      request.setAttribute("dto", dto);
	      request.setAttribute("reviewList",reviewList);
	      request.setAttribute("wish", wish);
	        //네이버 검색 api---------------------------------------------------------------
	        JSONObject obj = new JSONObject();
			//기존 검색하던 내용을 연동
			String clientId = "sjc1sx65MQJH06dOyCof";
			String clientSecret = "OHVbJcT62r";
			String store_name=dto.getStore_name();
			try {
				store_name = URLEncoder.encode(store_name, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//display 부분이 처음에 받아오는 개수 설정하는 부분임
			String apiURL = "https://openapi.naver.com/v1/search/blog?query="+store_name+"&display=5";
			URL url;
			try {
				url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				BufferedReader br;
				int responseCode = con.getResponseCode();
				obj.put("responseCode", responseCode);
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					System.out.println(responseCode);
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				//정상, 에러 json 데이터를 받는 부분
				String result = "";
				while(true) {
					String str = br.readLine();
					if(str==null)break;
					result += str;
				}
				System.out.println(result);
				JSONObject r = new JSONObject(result);
				//검색결과후 진짜 필요한 부분만 뽑아낸 데이터들의 개수 ※(링크,타이틀,요약,블로거링크,작성날짜,작성자)이 합쳐서 1개임
				int jsonArrLength = r.getJSONArray("items").length();
				//json데이터를 jsp파일로 뽑아 낼 수 없어서  dto클래스를 생성후에 Arraylist로 넣어서 request객체에 저장후 jsp파일에서 표현할 생각임
				ArrayList<NaverSearchBlogDTO> NaverBlogList= new ArrayList<NaverSearchBlogDTO>();
				if (responseCode == 200) { // 정상 호출
					//(링크,타이틀,요약,블로거링크,작성날짜,작성자)중에서 링크,타이틀,요약만 필요
					for (int i=0;i<jsonArrLength;i++) {
						System.out.println("블로그 검색결과 링크 "+r.getJSONArray("items").getJSONObject(i).getString("link"));
						System.out.println("블로그 검색결과 타이틀 "+r.getJSONArray("items").getJSONObject(i).getString("title"));
						System.out.println("블로그 검색결과 요약 "+r.getJSONArray("items").getJSONObject(i).getString("description"));
						//리스트에 저장하는 부분
						NaverBlogList.add(new NaverSearchBlogDTO(r.getJSONArray("items").getJSONObject(i).getString("link"), r.getJSONArray("items").getJSONObject(i).getString("title"), r.getJSONArray("items").getJSONObject(i).getString("description"))); 
					}
					request.setAttribute("NaverBlogList",NaverBlogList);
				} else { // 에러 발생
					obj.put("errorCode",r.getString("errorCode"));
					obj.put("errorMessage",r.getString("errorMessage"));
					System.out.println("error : " +obj.toString());
				}
				br.close();
				con.disconnect();
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	      storeService.updateStoreCount(store_id);
	      return "store_detail_view";
	   }
	
	@RequestMapping("/businessReportAction.do")
	   public String businessReportAction(HttpServletRequest request,HttpServletResponse response) {
	      int review_no = Integer.parseInt(request.getParameter("review_no"));
	      System.out.println(review_no);
	      int count=memberService.businessReportAction(review_no);
	      if(count !=0) {
	         try {
	            System.out.println("신고 성공");
	            response.setContentType("text/html;charset=utf-8");
	            response.getWriter().write("true");
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      else {
	         try {
	            System.out.println("신고실패");
	            response.setContentType("text/html;charset=utf-8");
	            response.getWriter().write("false");
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      return null;
	   }
	@RequestMapping("/insertWishList.do")
	public String insertWishList(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
    String store_id=request.getParameter("store_id");
    System.out.println(store_id);
	   String member_id=(String)session.getAttribute("id");
	   System.out.println(member_id);
	   int count=memberService.insertWishList(member_id,store_id);
	   if(count !=0) {
		   try {
			System.out.println("위시리스트 추가 성공");
			response.getWriter().write("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
	   }
	   else {
		   try {
			System.out.println("위시리스트 추가 실패");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	   }
		return null;
	}
	@RequestMapping("/deleteWishList.do")
	public String deleteWishList(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
    String store_id=request.getParameter("store_id");
    System.out.println(store_id);
	   String member_id=(String)session.getAttribute("id");
	   System.out.println(member_id);
	   int count=memberService.deleteWishList(member_id,store_id);
	   if(count !=0) {
		   try {
			System.out.println("위시리스트 삭제 성공");
			response.getWriter().write("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
	   }
	   else {
		   try {
			System.out.println("위시리스트 삭제 실패");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	   }
		return null;
	}
	
	
	@RequestMapping("/selectStoreReviewListMore.do")
	public String selectStoreReviewListMore(HttpServletRequest request,HttpServletResponse response) {
		String store_id=request.getParameter("store_id");
		System.out.println(store_id);
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		List<ReviewDTO> list =storeService.selectStoreReviewListMore(store_id,no);
		JSONObject obj = new JSONObject();
		if(list != null) {
			try {
				JSONArray result = new JSONArray();
				for(int i=0;i<list.size();i++) {
				JSONObject json = new JSONObject();
				json.put("review_no",list.get(i).getReview_no());
				json.put("review_member_id",list.get(i).getReview_member_id());
				json.put("review_store_id",list.get(i).getReview_store_id());
				json.put("review_content",list.get(i).getReview_content());
				json.put("review_date",list.get(i).getReview_date());
				json.put("review_score_service",list.get(i).getReview_score_service());
				json.put("review_score_price",list.get(i).getReview_score_price());
				json.put("review_menu_no",list.get(i).getReview_menu_no());
				json.put("review_score_menu",list.get(i).getReview_score_menu());
				json.put("review_photo",list.get(i).getReview_photo());
				json.put("review_report",list.get(i).getReview_report());				
				result.put(json);
				}
				obj.put("result", result);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(obj.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	@RequestMapping("/")
	public String main(HttpServletRequest request) {
		List<StoreDTO> monthScoreList = storeService.selectStoreListBestScore(30,1);
		List<StoreDTO> weekScoreList = storeService.selectStoreListBestScore(7,1);
		List<StoreDTO> monthReviewCountList = storeService.selectStoreListBestReviewCount(30,1);
		List<StoreDTO> weekReviewCountList = storeService.selectStoreListBestReviewCount(7,1);
		
		System.out.println(monthScoreList);
		System.out.println(weekScoreList);
		System.out.println(monthReviewCountList);
		System.out.println(weekReviewCountList);
		
		request.setAttribute("monthScoreList", monthScoreList);
		request.setAttribute("weekScoreList", weekScoreList);
		request.setAttribute("monthReviewCountList", monthReviewCountList);
		request.setAttribute("weekReviewCountList", weekReviewCountList);
		
		return "main";
	
	
	}
	@RequestMapping("/myPageView.do")
	public String myPageView(HttpSession session, HttpServletRequest request) {
		String[] address = (String[]) session.getAttribute("address").toString().split(" ");
		String necessary_addr = "";
		necessary_addr = address[0] + " " + address[1];
		List<StoreDTO> firstList = null; //
		ArrayList<StoreDTO> firstListFinal = new ArrayList<StoreDTO>();
		List<StoreDTO> secondList = null;//
		ArrayList<StoreDTO> secondListFinal = new ArrayList<StoreDTO>();
		List<StoreDTO> thirdList = null; //
		ArrayList<StoreDTO> thirdListFinal = new ArrayList<StoreDTO>();
		String[] categoryList = (String[]) session.getAttribute("category").toString().split("#");
        //카테고리 하나일때
       if(categoryList.length-1==1) { 
    	   firstList =storeService.selectMypageStoreList("#"+categoryList[1],necessary_addr);
                  if(firstList.size() !=0) { 
                	  if(firstList.size()>4) { 
                		  int a[]= new int[4];
                		  Random r = new Random(); 
                		  for(int i=0;i<4;i++) {
                			  a[i]=r.nextInt(firstList.size()); 
                			  for(int j=0;j<i;j++) { 
                				  if(a[i]==a[j]) i--;
                				  } 
                			  } 
                		  for(int k=0;k<4;k++) { 
                			  firstListFinal.add(firstList.get(a[k])); 
                			  }
                		  request.setAttribute("fisrtList", firstListFinal); 
                		  } else {
                			  request.setAttribute("fisrtList", firstList); 
                			  } 
                	  }else {
                		  request.setAttribute("fisrtList", firstList); 
                		  }
                  request.setAttribute("fisrtcategory", "#"+categoryList[1]); 
                  } // 
       //카테고리 2개일때
       else if(categoryList.length-1 ==2) { 
    	   firstList =storeService.selectMypageStoreList("#"+categoryList[1],necessary_addr); 
    	   //첫번째카테고리 
    	   if(firstList.size() !=0) { 
    		   if(firstList.size()>4) { 
    			   int a[]= new int[4];
    			   Random r = new Random(); 
    			   for(int i=0;i<4;i++) {
    				   a[i]=r.nextInt(firstList.size()); 
    				   for(int j=0;j<i;j++) { 
    					   if(a[i]==a[j])
    						   i--;
    				   		} 
    				   } 
    			   for(int k=0;k<4;k++) { 
    				   firstListFinal.add(firstList.get(a[k])); 
    				   }
    			   request.setAttribute("fisrtList", firstListFinal); 
    			   }else {
    				   request.setAttribute("fisrtList", firstList); 
    				   } 
    		   }else {
    			   request.setAttribute("fisrtList", firstList); 
    		   } 
    	   // 
    	   //2번째 카테고리 
    	   secondList=storeService.selectMypageStoreList("#"+categoryList[2],necessary_addr);
           if(secondList.size() !=0) { 
        	   if(secondList.size()>4) { 
        		   int a[]= new int[4];
        		   Random r = new Random(); 
        		   for(int i=0;i<4;i++) {
        			   a[i]=r.nextInt(secondList.size()); 
        			   for(int j=0;j<i;j++) { 
        				   if(a[i]==a[j]) 
        					   i--;
        			     } 
        			   } 
        		   for(int k=0;k<4;k++) { 
        			   secondListFinal.add(secondList.get(a[k])); 
        			   }
        		   request.setAttribute("secondList", secondListFinal); 
        		   }else {
        			   request.setAttribute("secondList", secondList); 
        		   } 
        	   }else {
        		   request.setAttribute("secondList", secondList); 
        		   }
           //
           request.setAttribute("fisrtcategory", "#"+categoryList[1]);
           request.setAttribute("secondcategory","#"+categoryList[2]); 
           } 
       		// 
       		//카테고리 3개일때
       		else { 
       		//첫번째 카테고리 
       		firstList =storeService.selectMypageStoreList("#"+categoryList[1],necessary_addr);
       		if(firstList.size() !=0) { 
       			if(firstList.size()>4) { 
       				int a[]= new int[4];
       				Random r = new Random();
       				for(int i=0;i<4;i++) {
       					a[i]=r.nextInt(firstList.size()); 
       					for(int j=0;j<i;j++) { 
       						if(a[i]==a[j]) 
       							i--;
       					  } 
       					} 
       				for(int k=0;k<4;k++) { 
       					firstListFinal.add(firstList.get(a[k])); 
       				 }
       				request.setAttribute("fisrtList", firstListFinal); 
       				}else {
       					request.setAttribute("fisrtList", firstList); 
       					} 
       			}else {
       				request.setAttribute("fisrtList", firstList); 
       			} 
       			// 
       		    //2번째 카테고리 
       		secondList=storeService.selectMypageStoreList("#"+categoryList[2],necessary_addr);
       			if(secondList.size() !=0) { 
       				if(secondList.size()>4) { 
       					int a[]= new int[4];
       					Random r = new Random();
       					for(int i=0;i<4;i++) {
       						a[i]=r.nextInt(secondList.size());
       						for(int j=0;j<i;j++) { 
       							if(a[i]==a[j])
       								i--;
       						  }
       						}
       					for(int k=0;k<4;k++) { 
       						secondListFinal.add(secondList.get(a[k])); 
       						}
       					request.setAttribute("secondList", secondListFinal); 
       					}else {
       						request.setAttribute("secondList", secondList); 
       						} 
       				}else {
       					request.setAttribute("secondList", secondList); 
       					} 
       			// 
       			//3번째 카테고리 
       			thirdList=storeService.selectMypageStoreList("#"+categoryList[3],necessary_addr);
       			if(thirdList.size() !=0) {
       				if(thirdList.size()>4) { 
       					int a[]= new int[4];
       					Random r = new Random(); 
       					for(int i=0;i<4;i++) {
       						a[i]=r.nextInt(thirdList.size()); 
       						for(int j=0;j<i;j++) { 
       							if(a[i]==a[j])
       								i--;
       						} 	
       					} 
       					for(int k=0;k<4;k++) { 
       						thirdListFinal.add(thirdList.get(a[k])); 
       						}
       					request.setAttribute("thirdList", thirdListFinal); 
       					}else {
       						request.setAttribute("thirdList", thirdList); 
       						} 
       				}else {
       					request.setAttribute("thirdList", thirdList); }
       			//
       			request.setAttribute("fisrtcategory", "#"+categoryList[1]);
       			request.setAttribute("secondcategory","#"+categoryList[2]);
       			request.setAttribute("thirdcategory", "#"+categoryList[3]); 
       			}
       			request.setAttribute("categoryCount",categoryList.length-1); 
       			//
	  return "mypage";
	}
	@RequestMapping("/loginView.do")
    public String loginView() {
        return "login";
    }
	//2021-02-28 수정
	@RequestMapping("/notice.do")
	public String notice(HttpServletRequest request) {
		int pageNo = 1; int pageOfContentCount =20;
		if(request.getParameter("pageNo") != null)
		pageNo = Integer.parseInt(request.getParameter("pageNo"));
		List<NoticeDTO> list = memberService.selectAllNotice(pageNo);
	    if(list.isEmpty()) {
				request.setAttribute("noticeList", null);
				return "notice";
			}
	    else {
			int count = memberService.selectNoticeCount();
			PaggingVO vo = new PaggingVO(count, pageNo,pageOfContentCount);
			request.setAttribute("noticeList", list);
			request.setAttribute("page", vo);
	      }
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
	@RequestMapping("/memberUpdateAction.do")
    public String memberUpdateAction(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		String name = request.getParameter("name");
		System.out.println(name);
		
		String tel = request.getParameter("tel1")+"-";
		tel += request.getParameter("tel2")+"-";
		tel += request.getParameter("tel3");
		System.out.println(tel);
		 
		 String category="";
		 String [] arr = request.getParameterValues("category");
         for (int i = 0; i < arr.length; i++) {
		category +=arr[i].toString();
      }  
         int count=memberService.memberUpdateAction(new MemberDTO(id,name,tel,category));
        	if(count !=0) {
        		System.out.println("수정 성공");
        		session.setAttribute("id", id);
    			session.setAttribute("name",name );
    			session.setAttribute("tel",tel);
        		session.setAttribute("category",category);
        	}
        	else {
        		System.out.println("수정 실패");
        	}     
		  return"main";
		}
	
	@RequestMapping("memberUpdateView.do")
	public String memberUpdateView() {
		return "member_update";
	}
	
	@RequestMapping("/insertUpdateAddressView.do")
	public String insertUpdateAddressView(HttpSession session) {
		String id = (String)session.getAttribute("id");
		List<MemberAddressDTO> list =memberService.selectMemberAllAddress(id);
		session.setAttribute("list",list);
		return "insert_update_address_view";
	}
	@RequestMapping("/qnaView.do")
	public String qnaView(HttpServletRequest request) {
		int page=1; int pageOfContentCount =20;
		if(request.getParameter("pageNo") != null)
			page = Integer.parseInt(request.getParameter("pageNo"));
		List<QnaDTO> list = qnaService.selectQnaList(page);
		int count = qnaService.selectCount();
		PaggingVO vo = new PaggingVO(count, page,pageOfContentCount);
		request.setAttribute("list", list);
		request.setAttribute("pagging", vo);
		return "qna";
	}
	@RequestMapping("/qnaDetailView.do")
	public String qnaDetailView(HttpServletRequest request) {
		int qno= 0;
		if(request.getParameter("qna_no") != null)
			qno = Integer.parseInt(request.getParameter("qna_no"));
		else
			qno = (int)request.getAttribute("qna_no");
		QnaDTO dto = qnaService.selectQna(qno);
		request.setAttribute("qna", dto);
		return "qna_detail_view";
	}
	@RequestMapping("/qnaUpdateView.do")
	public String qnaUpdate(HttpServletRequest request) {
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		QnaDTO dto = qnaService.selectQna(qna_no);
		request.setAttribute("qna_no", qna_no);
		request.setAttribute("qna", dto);
		System.out.println("qna_no : "+qna_no);
		return "qna_update";
	}
	@RequestMapping("/qnaUpdateAction.do")
	public String qnaUpdateAction(HttpServletRequest request) {
		int qna_no= Integer.parseInt(request.getParameter("qna_no"));
		String qna_title = request.getParameter("qna_title");
		String qna_content= request.getParameter("qna_content");
		int count = qnaService.updateQna(new QnaDTO(qna_no,qna_title,qna_content));
		QnaDTO dto = qnaService.selectQna(qna_no);
		request.setAttribute("qna", dto);
		if(count != 0) {
		    System.out.println("수정 성공");
			request.setAttribute("QnAupdateSuccess",true);
		}
		else {
			System.out.println("수정 실패");
			request.setAttribute("QnAupdateSuccess",false);
		}
			
		return "qna_detail_view";
	}
	@RequestMapping("/qnaWrite.do")
	public String qnaWrite() {
		return "qna_write";
	}
	@RequestMapping("/qnaWriteAction.do")
	public String boardWriteAction(HttpServletRequest request) {
		int qna_no = qnaService.newQno();
		String qna_member_id= request.getParameter("qna_member_id");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		qnaService.insertQna(new QnaDTO(qna_no, qna_member_id,qna_title,qna_content));
		QnaDTO dto = qnaService.selectQna(qna_no);
		request.setAttribute("qna", dto);
		request.setAttribute("qno", qna_no);
		return "qna_detail_view";
	}
	@RequestMapping("/qnaDeleteAction.do")
	public String qnaDeleteAction(HttpServletRequest request) {
		int qna_no= Integer.parseInt(request.getParameter("qna_no"));
		int page =1;
		int pageOfContentCount = 20;
		int count = qnaService.selectCount();
		int act =qnaService.deleteQna(qna_no); 
		if(act != 0) {
			request.setAttribute("deleteAction", true);
		}
		List<QnaDTO> list = qnaService.selectQnaList(page);
		PaggingVO vo = new PaggingVO(count, page,pageOfContentCount);
		request.setAttribute("pagging", vo);
		request.setAttribute("list", list);
		return "qna";
	}
	@RequestMapping("/qnaAnswerView.do")
	public String qnaAnswerView(HttpServletRequest request) {
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
		QnaDTO dto = qnaService.selectQna(qna_no);
		request.setAttribute("qna", dto);
		return "qna_answer";
	}
	@RequestMapping("/qnaAnswerDetailView.do")
	public String qnaAnswerDetailView(HttpServletRequest request) {
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
		QnaDTO dto = qnaService.selectQna(qna_no);
		request.setAttribute("qna", dto);
		return "qna_answer_detail_view";
	}
	@RequestMapping("/qnaAnswerAction.do")
	public String qnaAnswerAction(HttpServletRequest request) {
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
		String qna_response = request.getParameter("qna_response");
		qnaService.qnaAnswer(new QnaDTO(qna_no,qna_response));
		QnaDTO dto = qnaService.selectQna(qna_no);
		int page =1;
		int pageOfContentCount = 20;
		int count = qnaService.selectCount();
		List<QnaDTO> list = qnaService.selectQnaList(page);
		PaggingVO vo = new PaggingVO(count, page,pageOfContentCount);
		request.setAttribute("pagging", vo);
		request.setAttribute("list", list);
		request.setAttribute("qna", dto);
		return "qna";
	}
	@RequestMapping("/qnaMypageView.do")
	public String qnaMypageView(HttpServletRequest request, HttpSession session) {
		int page=1; int pageOfContentCount =20;
		if(request.getParameter("pageNo") != null)
			page = Integer.parseInt(request.getParameter("pageNo"));
		String id = (String) session.getAttribute("id");
		List<QnaDTO> list = qnaService.selectMypageQnaList(page, id);
		int count = qnaService.selectMypageCount(id);
		PaggingVO vo = new PaggingVO(count, page,pageOfContentCount);
		request.setAttribute("list", list);
		request.setAttribute("pagging", vo);
		return "qna_mypage_view";
	}
    @RequestMapping("/loginAction.do")
    public String login(HttpServletRequest request,HttpSession session) {
		System.out.println("login.do");
		String id = request.getParameter("id");
		System.out.println("id: "+id);
		String pass = request.getParameter("pass");
		System.out.println("pass: "+pass);
		int address_status =1;
		try {	
		MemberDTO dto = memberService.loginMember(id,pass);
		if(dto.getMember_id() != null) {
			String addr = memberService.selectMemberAddress(dto.getMember_id(),address_status);
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
			return "redirect:/";
		}
		}catch (NullPointerException e) {
			session.setAttribute("login", false);
			System.out.println("로그인 실패");
		}
		return "redirect:/loginView.do";
	}
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session,HttpServletRequest request) {
		session.invalidate();
		return "redirect:/";
	}
    
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	//2021-02-29 수정
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
        	MemberDTO dto = new MemberDTO(id,pass,name,tel,0,category,0);
        	int count=memberService.registerMember(dto);
        	if(count !=0) {
        		MemberAddressDTO addr = new MemberAddressDTO(id,address,1);
        		int addrCount=memberService.registerMemberAddress(addr);
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
	public String storeRegisterView(HttpServletResponse response, HttpSession session) {
		if(session.getAttribute("login") == null || (boolean)session.getAttribute("login") == false) {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용해주세요');history.back();</script>");
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "store_register";
	}
	
	@RequestMapping("/storeRegisterAction.do")
	public String storeRegisterAction(HttpServletRequest request,MultipartHttpServletRequest mqRequest,HttpServletResponse response, HttpSession session) {
		if(session.getAttribute("login") == null || (boolean)session.getAttribute("login") == false) {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 세션이 종료되었습니다');location.href='"+request.getContextPath()+"/main.jsp';</script>");
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String member_id = (String) session.getAttribute("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String addr = request.getParameter("addr");
		String license = request.getParameter("license");
		MultipartFile mf = mqRequest.getFile("file");
		String time = request.getParameter("time");
		if(time == null) time = " ";
		String introduce = request.getParameter("introduce");
		if(introduce == null) introduce = " ";
		String category = "#"+request.getParameter("category");
		String store_id = name + "_" + license;
		MultipartFile photo = mqRequest.getFile("photo");
		
		System.out.println("mf :"+mf);
		
		String path = "C:\\fileupload\\"+store_id+"\\";
		File pathFile = null;
		try {
			String originalFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			File parentPath = new File(path);
			if(!parentPath.exists()) parentPath.mkdirs();
			pathFile = new File(path + originalFileName);
			mf.transferTo(pathFile);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		File photoFile = null;
		try {
			String photoFileName = photo.getOriginalFilename();
			long fileSize = photo.getSize();
			if(fileSize == 0) {
				photoFile = new File("");
			}
			else {
				File parentPath = new File(path);
				if(!parentPath.exists()) parentPath.mkdirs();
				photoFile = new File(path + photoFileName);
				photo.transferTo(photoFile);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("photoFile : " + photoFile.getName());
		int count = storeService.registerStore(new StoreDTO(store_id, name, addr, license, member_id, time, 
				introduce, tel, category,0,pathFile.getName(),photoFile.getName(),0));
		
		String[] names = request.getParameterValues("menu_name");
		String[] prices =  request.getParameterValues("menu_price");
		List<MultipartFile> fileList = mqRequest.getFiles("menu_photo");
		ArrayList<String> fList = new ArrayList<String>();
		path = "C:\\fileupload\\"+store_id+"\\menu\\";
		
		for(int i=0;i<names.length;i++) {
			String menu_name = names[i];
			int menu_price = Integer.parseInt(prices[i]);
			storeService.registerMenu(new StoreMenuDTO(store_id, menu_name, menu_price, ""));
		}
		for(MultipartFile mf2 : fileList) {
			long fileSize = mf2.getSize();
			if(fileSize == 0) continue;
			String originalFileName = mf2.getOriginalFilename();
			String[] fileName = originalFileName.trim().split("[.]");
			
			File parentPath = new File(path);
			if(!parentPath.exists()) parentPath.mkdirs();
			String menu_name = fileName[0].trim();
			count = storeService.updateMenuPhoto(store_id,menu_name,originalFileName);
			pathFile = new File(path + originalFileName);
			try {
				mf2.transferTo(pathFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/myPageView.do";
	}
	
	@RequestMapping("storeCheckListView.do")
	public String storeCheckListView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if(session.getAttribute("login") == null || (boolean)session.getAttribute("login") == false || (int)session.getAttribute("grade") !=2) {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('관리자만 이용할 수 있는 기능입니다.');history.back();</script>");
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		List<StoreDTO> list = storeService.selectStoreListCode(0);
		request.setAttribute("list", list);
		return "store_check_list";
	}
	
	@RequestMapping("storeCheckView.do")
	public String storeCheckView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if(session.getAttribute("login") == null || (boolean)session.getAttribute("login") == false || (int)session.getAttribute("grade") !=2) {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('관리자만 이용할 수 있는 기능입니다.');history.back();</script>");
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String store_id = request.getParameter("store_id");
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		System.out.println(dto.toString());
		request.setAttribute("dto", dto);
		 
		return "store_check";
	}
	
	@RequestMapping("storeCheckConfirm.do")
	public String storeCheckConfirm(HttpServletRequest request, HttpSession session) {
		String store_id = request.getParameter("store_id");
		String title ="안녕하세요 관리자 입니다.";
		String content="식당 등록 신청 건에 대하여 승인요청이 완료되었습니다.\n";
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		// 식당 등록 신청한 사용자에게 승인결과 전송
		memberService.sendMessage(new MessageDTO(dto.getStore_member_id(),title,content));
		int count = storeService.updateStoreCode(store_id,1);
		count = memberService.updateMemberGrade(storeService.selectStoreDTO(store_id).getStore_member_id(),1);
		
		return "redirect:/myPageView.do"; 
	}
	
	@RequestMapping("storeCheckReject.do")
	public String storeCheckReject(HttpServletRequest request, HttpSession session) {
		String store_id = request.getParameter("store_id");
		String title ="안녕하세요 관리자 입니다.";
		String content="식당 등록 신청 건에 대하여 승인요청이 거절되었습니다.\n자세한 내용을 원하시면 문의사항에 등록해주시기 바랍니다.";
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		// 식당 등록 신청한 사용자에게 승인결과 전송
		memberService.sendMessage(new MessageDTO(dto.getStore_member_id(),title,content));
		int count = storeService.deleteMenu(store_id);
		count = storeService.deleteStoreDTO(store_id);
		
		return "redirect:/myPageView.do";
  }
	
	@RequestMapping("reviewRegisterView.do")
	public String reviewRegisterView(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("login") == null || (boolean)session.getAttribute("login") == false) {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용해주세요');history.back();</script>");
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String store_id = request.getParameter("store_id");
		
		StoreDTO dto = storeService.selectStoreDTO(store_id);
		List<StoreMenuDTO> menuList = storeService.selectStoreMenuList(store_id);
		System.out.println("menuList : " + menuList.toString());
		
		request.setAttribute("store", dto);
		request.setAttribute("menuList", menuList);
		return "review_register";
	}
	
	@RequestMapping("reviewRegisterAction.do")
	public String reviewRegisterAction(MultipartHttpServletRequest mqrequest, HttpServletRequest request, HttpSession session,HttpServletResponse response) {
		String review_store_id = request.getParameter("store_id");
		String review_member_id = (String) session.getAttribute("id");
		String review_content = request.getParameter("review_content");
		int review_menu_no = Integer.parseInt(request.getParameter("menu_no"));
		int review_score_menu = Integer.parseInt(request.getParameter("review_score_menu"))+1;
		int review_score_price = Integer.parseInt(request.getParameter("review_score_price"))+1;
		int review_score_service = Integer.parseInt(request.getParameter("review_score_service"))+1;
		MultipartFile photo = mqrequest.getFile("photo");
		System.out.println(review_score_menu+ "," +review_score_price + "," +review_score_service);
		
		String path = "C:\\fileupload\\"+review_member_id+"\\"+review_store_id+"\\";
		File photoFile = null;
		try {
			String photoFileName = photo.getOriginalFilename();
			long fileSize = photo.getSize();
			if(fileSize == 0) {
				photoFile = new File("");
			}
			else {
				System.out.println("photoFileName : " + photoFileName);
				System.out.println("fileSize : " + fileSize);
				File parentPath = new File(path);
				if(!parentPath.exists()) parentPath.mkdirs();
				
				//파일 업로드
				photoFile = new File(path + photoFileName);
				photo.transferTo(photoFile);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("photoFile : " + photoFile.getName());
			memberService.registerReview(new ReviewDTO(review_member_id, review_store_id, review_content, review_score_service, review_score_price, review_menu_no, review_score_menu, photoFile.getName()));
			request.setAttribute("store_id", review_store_id);
			return "redirect:/storeDetailView.do?store_id="+getUrlEncoder(review_store_id)+"";
	}
	
	@RequestMapping("bestStoreListView.do")
	public String bestStoreListView(HttpServletRequest request) {
		String type = request.getParameter("type");
		List<StoreDTO> list = null;
		if(type.equals("month_score")) {
			list = storeService.selectStoreListBestScore(30,1);
		}
		else if(type.equals("month_review")) {
			list = storeService.selectStoreListBestReviewCount(30,1);
		}
		else if(type.equals("week_score")) {
			list = storeService.selectStoreListBestScore(7,1);
		}
		else {
			list = storeService.selectStoreListBestReviewCount(7,1);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		return "best_store_list_view";
	}
	
	@RequestMapping("bestStoreNextList.do")
	public void bestStoreNextList(HttpServletRequest request, HttpServletResponse response) {
		int nextPage = Integer.parseInt(request.getParameter("nextPage"));
		String type = request.getParameter("type");
		
		List<StoreDTO> list = null;
		if(type.equals("month_score")) {
			list = storeService.selectStoreListBestScore(30,nextPage);
			if(storeService.selectStoreListBestScore(30,nextPage+1).size()==0) {
				nextPage = 0;
			}
			else {
				nextPage++;
			}
		}
		else if(type.equals("month_review")) {
			list = storeService.selectStoreListBestReviewCount(30,nextPage);
			if(storeService.selectStoreListBestReviewCount(30,nextPage+1).size()==0) {
				nextPage = 0;
			}
			else {
				nextPage++;
			}
		}
		else if(type.equals("week_score")) {
			list = storeService.selectStoreListBestScore(7,nextPage);
			if(storeService.selectStoreListBestScore(7,nextPage+1).size()==0) {
				nextPage = 0;
			}
			else {
				nextPage++;
			}
		}
		else {
			list = storeService.selectStoreListBestReviewCount(7,nextPage);
			if(storeService.selectStoreListBestReviewCount(7,nextPage+1).size()==0) {
				nextPage = 0;
			}
			else {
				nextPage++;
			}
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("nextPage",nextPage);
		JSONArray jsonArray = new JSONArray(list);
		jsonObject.put("list",jsonArray);
		//5. writer로 출력
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
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
   //2021-02-28 수정
   @RequestMapping("/messageDetailView.do")  
   public String messageDetailView(HttpServletRequest request,HttpSession session) {
	   int no = Integer.parseInt(request.getParameter("no"));
	   System.out.println("detail_View_No:"+no);
	   int pageNo= Integer.parseInt(request.getParameter("pageNo"));
	   String login_id=(String)session.getAttribute("id");
	   try {
	   MessageDTO dto = memberService.selectUserMessage(no);
	   String messag_id=dto.getMessage_member_id();
	   if(login_id.equals(messag_id)==true){
		   System.out.println(dto.toString());
		   memberService.updateMessageStatus(no,messag_id);
		   request.setAttribute("content",dto.getMessage_content());
		   request.setAttribute("date",dto.getMessage_date());
		   request.setAttribute("pageNo",pageNo);
		   request.setAttribute("message_no", no);
		   request.setAttribute("Invalid_access", false);
		   return "message_detail_view";
	   }
	   else{
	     request.setAttribute("Invalid_access", true);
	   }
	   }
	   catch(NullPointerException e) {
		   System.out.println("너어어얼");
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
   
   @RequestMapping("image_load.do")
	public String imageLoad(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String fileName = request.getParameter("fileName");
		String type = fileName.substring(fileName.lastIndexOf(".")+1);
		
		response.setContentType("image/"+type);
		String divide = request.getParameter("divide");
		
		response.setContentType("image/jpeg");
		File path = null;
		if(divide.equals("menu")) {
			path = new File("C:\\fileupload\\"+writer+"\\menu\\"+fileName);
		}else if(divide.equals("store")) {
			path = new File("C:\\fileupload\\"+writer+"\\"+fileName);
		}
		
	//	File path = new File("C:\\fileupload\\"+writer+"\\"+fileName);
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = response.getOutputStream();
			
			byte[] buffer = new byte[1024*1024];
			while(true) {
				int size = fis.read(buffer);
				if(size == -1) break;
				sos.write(buffer,0,size);
				sos.flush();
			}
			sos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			//e.printStackTrace();
		} catch (IOException e) {
			//e.printStackTrace();
		}
		return null;
	}
   
/*광고>>>-----------------------------------------------------------------------------------------------------*/   
   
   @RequestMapping("/AdListView.do")
	public String adList(HttpServletRequest request) {
		int page = 1;
		int pageOfContentCount = 10;
		//페이지 셋팅
		if(request.getParameter("pageNo") != null)
			page = Integer.parseInt(request.getParameter("pageNo"));
		System.out.println(page);
		List<AdDTO> list = adService.selectAdList(page); //글목록 읽어옴 
		int count = adService.selectCount();
		PaggingVO vo = new PaggingVO(count, page, pageOfContentCount);
		request.setAttribute("list", list);
		request.setAttribute("pagging", vo);
		System.out.println(list.toString());
		return "ad_list_view";
	}
   
   @RequestMapping("/AdView.do")
	public String adView(HttpServletRequest request) {
		//게시글 하나 읽음
		//1. request에서 게시글 번호 읽어옴
		int ad_no;
		if(request.getParameter("ad_no") != null)
			ad_no = Integer.parseInt(request.getParameter("ad_no"));
		else
			ad_no = (int)request.getAttribute("ad_no");
		// 해당 게시글 조회수 증가
		//adService.addCount(ad_no);
		//2. DB 해당 게시글 정보 읽어옴
		AdDTO dto = adService.selectAd(ad_no);
		System.out.println(dto);
				// 첨부파일 로드 부분 필요
		//3. request에 BoardDTO 저장
		request.setAttribute("ad", dto);
		//request.setAttribute("file", );	<< 첨부파일 로드 필요
		
		return "ad_detail_view";
	}
   
   @RequestMapping("/AdWriteView.do")
	public String adWriteView(HttpServletRequest request) {
	   String member_id = (String) request.getSession().getAttribute("id");
	   List<StoreDTO> list = adService.selectMemberStoreList(member_id);
	   request.setAttribute("storeList", list);
	   
		return "ad_write_view";
	}
   
   @RequestMapping("/AdWriteAction.do")
	public String adWriteAction(HttpServletRequest request) {
		int ad_no = adService.newAd_no();
		String ad_store_id = request.getParameter("ad_store_id");
		int ad_status = 0;			// 추후 detail_view에서 버튼으로 변경가능하게
		String ad_content = request.getParameter("ad_content");
		adService.insertAd(new AdDTO(ad_no, ad_store_id, ad_status, ad_content));
		AdDTO dto = adService.selectAd(ad_no);
		request.setAttribute("ad", dto);
		
					//파일 첨부기능 작성 필요 
					
					// 뒤로가기 기능 막기 (게시글 중복작성)
		
		return "mypage";
	}
/*-----------------------------------------------------------------------------------------------------<<<광고*/ 
   //수정 2021-02-25
   @RequestMapping("/insertMemberAddressAction.do")
	public String insertMemberAddressAction(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
	   String id= (String)session.getAttribute("id");
	   System.out.println(id);
	   String address = request.getParameter("address");
	   System.out.println(address);
	   String checkAddress= memberService.selectMemeberAddressCheck(id, address);
	   if(checkAddress == null) {
	   MemberAddressDTO dto = new MemberAddressDTO(id,address,0);
	   int count=memberService.registerMemberAddress(dto);
	   if(count !=0) {
		   System.out.println("주소 추가 성공");   
	   }else {
		   System.out.println("주소 추가 실패");
	   }
	   }
	   else {
		   try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("중복된 주소입니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	   }
	   return null;
   }
@RequestMapping("/deleteAddressAction.do")
public String deleteAddressAction(HttpServletRequest request,HttpSession session) {
	String id=(String)session.getAttribute("id"); 
	String address= request.getParameter("address");
	System.out.println(address);
	int deletecount = memberService.deleteMemberAddress(address,id);
	if(deletecount !=0) {
		System.out.println("삭제 성공");
		  List<MemberAddressDTO> list =memberService.selectMemberAllAddress(id);
		  session.setAttribute("list",list);
		}
	else {
		System.out.println("삭제 실패");
	}
	return "insert_update_address_view";
  }
//수정 2021-02-25
@RequestMapping("/choiceAddressAction.do")
public String choiceAddress(HttpServletRequest request,HttpSession session) {
	String id=(String)session.getAttribute("id"); 
	System.out.println(id);
	String address=request.getParameter("address");
	System.out.println(address);
	int count=memberService.choiceMemberAddress(address,id);
	if(count !=0) {
		session.setAttribute("address", address);
		System.out.println("메인 주소 선택 성공");
		 memberService.notChoiceMemberAddress(address,id);
		 List<MemberAddressDTO> list =memberService.selectMemberAllAddress(id);
		 session.setAttribute("list",list);
	}
	else {
		System.out.println("메인 주소 선택 실패");
	}
	return "insert_update_address_view";
}
//수정 2021-02-26
@RequestMapping("/memberPassUpdateCheckView.do")
public String memberPassUpdateCheckView() {
	return "member_pass_update_check_view";
}
@RequestMapping("/memberPassUpdateCheckAction.do")
public String memberPassUpdateCheckAction(HttpServletRequest request,HttpServletResponse response) {
	String id= request.getParameter("id");
	System.out.println(id);
	String pass = request.getParameter("pass");
	System.out.println(pass);
	MemberDTO dto=memberService.selectMemberPassCheck(id,pass);
	if(dto == null) {
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	else {
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	return null;
}
@RequestMapping("/memberPassUpdateView.do")
public String memberPassUpdateView() {
	return "member_pass_update_view";
}
@RequestMapping("/memberPassUpdateAction.do")
public String memberPassUpdateAction(HttpServletRequest request,HttpServletResponse response) {
	String id= request.getParameter("id");
	System.out.println(id);
	String pass=request.getParameter("pass");
	System.out.println(pass);
	int count=memberService.updateMemberPass(id,pass);
	if(count !=0) {
		try {
			System.out.println("수정완료");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	else {
		try {
			System.out.println("수정 실패");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	return null;
}
@RequestMapping("/adminNoticeWriteView.do")
public String adminNoticeWriteView() {
	return "notice_write_view";
}
@RequestMapping("/adminNoticeWriteAction.do")
public String adminNoticeWriteAction(HttpServletRequest request,HttpServletResponse response) {
	String title = request.getParameter("title");
	System.out.println(title);
	String content =request.getParameter("content");
    System.out.println(content);
    int count=memberService.adminNoticeWrite(title,content);
    if(count !=0) {
    	try {
    		System.out.println("작성 성공");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    else {
    	try {
			System.out.println("작성 실패");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    return null;
}
//2021-02-28 수정
@RequestMapping("/noticeDetailView.do")
public String noticeDetailView(HttpServletRequest request) {
	int notice_no=Integer.parseInt(request.getParameter("notice_no"));
	System.out.println(notice_no);
	int pageNo=Integer.parseInt(request.getParameter("pageNo"));
	System.out.println(pageNo);
	NoticeDTO dto=memberService.selectNotice(notice_no);
	if(dto == null) {
		System.out.println("너어어얼");
		request.setAttribute("Error", true);
	}
	else {
		request.setAttribute("Error", false);
        request.setAttribute("notice", dto);		
        request.setAttribute("pageNo", pageNo);
	}
	return "notice_detail_view";
}
//2021-02-28 추가
@RequestMapping("/adminDeleteNotice.do")
public String adminDeleteNotice(HttpServletRequest request,HttpServletResponse response) {
	int notice_no=Integer.parseInt(request.getParameter("notice_no"));
	System.out.println("delete"+notice_no); 
	int pageNo=Integer.parseInt(request.getParameter("pageNo"));
	System.out.println(pageNo);
	int count = memberService.adminNoticeDelete(notice_no);
	if(count !=0) {
		try {
			System.out.println("삭제성공");
			List<NoticeDTO> list = memberService.selectAllNotice(pageNo);
		    if(list.isEmpty()) {
		    	response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("lastItem");
		    }
		    else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("true");
		    }
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	else {
		try {
			System.out.println("삭제실패");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	return null;
}
@RequestMapping("/adminNoticeUpdateView.do")
public String adminNoticeUpdateView(HttpServletRequest request) {
	try {
		
	int notice_no=Integer.parseInt(request.getParameter("notice_no"));
	System.out.println(notice_no);
	String notice_title=request.getParameter("notice_title");
	System.out.println(notice_title);
	String notice_contente = request.getParameter("notice_content");
	System.out.println(notice_contente);
	int pageNo=Integer.parseInt(request.getParameter("pageNo"));
	System.out.println(pageNo);
	NoticeDTO dto=memberService.selectNotice(notice_no);
	if(dto == null) {
		System.out.println("너어어얼");
		request.setAttribute("Error", true);
	}
	else {
		request.setAttribute("Error", false);
        request.setAttribute("notice", dto);
        request.setAttribute("pageNo", pageNo);
	}
	}catch(NumberFormatException e) {
		System.out.println("너어어얼");
		request.setAttribute("Error", true);
	}
	return "notice_update_view";
}
@RequestMapping("/adminNoticeUpdateAction.do")
public String adminNoticeUpdateAction(HttpServletRequest request,HttpServletResponse response) {
	System.out.println("udpateAction.do");
	int notice_no=Integer.parseInt(request.getParameter("notice_no"));
	System.out.println(notice_no);
	String notice_title=request.getParameter("notice_title");
	System.out.println(notice_title);
	String notice_content = request.getParameter("notice_content");
	System.out.println(notice_content);
	int count=memberService.adminUpdateNotice(notice_no,notice_title,notice_content);
	if(count !=0) {
		try {
			System.out.println("수정 성공");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	else {
		try {
			System.out.println("수정 실패");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	return null;
}
@RequestMapping("/adminReportCheckListView.do")
public String adminReportReviewListView(HttpServletRequest request) {
	   int pageNo = 1; int pageOfContentCount =10;
	   if(request.getParameter("pageNo") != null)
	   pageNo = Integer.parseInt(request.getParameter("pageNo"));
	   List<ReviewDTO> list = memberService.adminSelectReportList(pageNo);
	    if(list.isEmpty()) {
			request.setAttribute("report", null);
			return "report_review_list_view";
		}
		int count = memberService.adminSelectReportCount();
		PaggingVO vo = new PaggingVO(count, pageNo,pageOfContentCount);
		request.setAttribute("report", list);
		request.setAttribute("page", vo);
	    return "report_review_list_view";
}
@RequestMapping("/reviewReportDetailView.do")
public String reviewReportDetailView(HttpServletRequest request) {
	int review_no= Integer.parseInt(request.getParameter("review_no"));
	System.out.println(review_no);
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	System.out.println(pageNo);
	ReviewDTO dto = memberService.adminSelectReport(review_no);
	if (dto !=null) {
		request.setAttribute("error", false);
		request.setAttribute("report", dto);
		request.setAttribute("pageNo", pageNo);
	}
	else {
		request.setAttribute("error", true);
	
	}
	return "report_review_detail_view";
}
@RequestMapping("adminDeleteReportReview.do")
public String adminDeleteReportReview(HttpServletRequest request, HttpServletResponse response) {
	int review_no = Integer.parseInt(request.getParameter("review_no"));
	String message_member_id = request.getParameter("review_member_id");
	ReviewDTO dto = memberService.adminSelectReport(review_no);
	String[] store_name = dto.getReview_store_id().split("_");
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	String message_title = "No." + review_no + " 리뷰는 운영방침을 위반하여 삭제처리를 진행했습니다..";
	String message_content = message_member_id + "님이 " + store_name[0] + "가게에 쓴 리뷰 내용\n\n" + dto.getReview_content()
			+ "\n\n\n\n해당 리뷰를 저희가 자세히 검토한 결과\n운영방침을 위반하는 글을 작성하셔서 삭제처리를 하는 것으로 결정했습니다.\n욕설이나 일방적인 비난은 삼가해주시길 바랍니다\n궁금하신 사항이 있으시면 QnA게시판에 글쓰기를 통해 문의해주세요\n"
			+ "저희 어플을 사용해주셔서 감사합니다~♡";
	MessageDTO message = new MessageDTO(message_member_id, message_title, message_content);
	int count = memberService.adminDeleteReportReview(review_no);
	if (count != 0) {
		try {
			System.out.println("삭제 성공");
			int sendCount = memberService.sendMessage(message);
			if (sendCount != 0) {
				System.out.println("쪽지 보내기 성공");
			} else {
				System.out.println("쪽지 보내기 실패");
			}
			List<ReviewDTO> list = memberService.adminSelectReportList(pageNo);
			if (list.isEmpty()) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("lastItem");
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("true");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	} else {
		try {
			System.out.println("삭제 실패");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	return null;
}
@RequestMapping("/adminCanselReportReview.do")
public String adminCanselReportReview(HttpServletRequest request,HttpServletResponse response) {
	int review_no= Integer.parseInt(request.getParameter("review_no"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	String review_store_id=request.getParameter("review_store_id");
	StoreDTO dto=storeService.selectStoreDTO(review_store_id);
	String message_member_id=dto.getStore_member_id();
	System.out.println(message_member_id);
	String message_title="신고하신 리뷰는 운영방침을 위반하지않아 삭제처리는 불가합니다.";
	String message_content="신고하신 리뷰를 저희가 자세히 검토한 결과\n운영방침을 위반하지않아 삭제처리를 하지 않는것으로 결정했습니다.\n궁금하신 사항이 있으시면 QnA게시판에 글쓰기를 통해 문의해주세요\n"
			+ "저희 어플을 사용해주셔서 감사합니다~♡";
	MessageDTO message = new MessageDTO( message_member_id, message_title, message_content);
	int count=memberService.adminCanselReportReview(review_no);
	if(count !=0) {
		try {
			System.out.println("신고 철회 성공");
			int sendCount=memberService.sendMessage(message);
			if(sendCount !=0) {
				System.out.println("쪽지 보내기 성공");
			}
			else {
				System.out.println("쪽지 보내기 실패");
			}
			List<ReviewDTO> list = memberService.adminSelectReportList(pageNo);
		    if(list.isEmpty()) {
		    	response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("lastItem"); 
		    }
		    else {		    	
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("true");
		    }
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	else {
		try {
			System.out.println("삭제 실패");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	return null;
}

@RequestMapping("/searchDetailView.do")
public String searchDetailView(HttpServletRequest request) {
	String search = request.getParameter("search");
	String addr = null;
	try {
		addr = URLDecoder.decode(request.getParameter("addr"),"UTF-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	System.out.println("search : " + search + " , addr : " + addr);
	List<StoreDTO> storeList = storeService.selectStoreListDetail(search,addr,1);
	request.setAttribute("storeList", storeList);
	request.setAttribute("search", search);
	request.setAttribute("addr", addr);
//	List<StoreDTO> storeList = storeService.selectStore
	
	return "search_detail_view";
}

@RequestMapping("/searchDetailNextList.do")
public void searchDetailNextList(HttpServletRequest request, HttpServletResponse response) {
	int nextPage = Integer.parseInt(request.getParameter("nextPage"));
	String search = request.getParameter("search");
	String addr = request.getParameter("addr");
	
	List<StoreDTO> list = storeService.selectStoreListDetail(search, addr, nextPage);
	
	if(storeService.selectStoreListDetail(search, addr, nextPage+1).size()==0) {
		nextPage = 0;
	}
	else {
		nextPage++;
	}
	//4. JSON으로 변환(QnaDTO, 다음페이지 번호)
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("nextPage",nextPage);
	JSONArray jsonArray = new JSONArray(list);
	jsonObject.put("list",jsonArray);
	//5. writer로 출력
	try {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(jsonObject.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
}

@RequestMapping("review_image_load.do")
	public String reviewImageLoad(HttpServletRequest request, HttpServletResponse response) {
		String review_store_id = request.getParameter("review_store_id");
		String review_member_id = request.getParameter("review_member_id");
		String fileName = request.getParameter("fileName");
		String type = fileName.substring(fileName.lastIndexOf(".")+1);
		
		response.setContentType("image/"+type);
		File path = new File("C:\\fileupload\\"+review_member_id+"\\"+review_store_id+"\\"+fileName);
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = response.getOutputStream();
			
			byte[] buffer = new byte[1024*1024];
			while(true) {
				int size = fis.read(buffer);
				if(size == -1) break;
				sos.write(buffer,0,size);
				sos.flush();
			}
			sos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
@RequestMapping("/wishlistView.do")
	public String wishListView(HttpServletRequest request, HttpSession session) {
	String member_id=(String)session.getAttribute("id");
	List<StoreDTO> list = memberService.selectWishlist(member_id,1);
	request.setAttribute("list", list);
	return "wishlist_view";
}

@RequestMapping("wishListNextList.do")
public void wishListNextList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	int nextPage = Integer.parseInt(request.getParameter("nextPage"));
	String member_id = (String) session.getAttribute("id");
	
	List<StoreDTO> list = memberService.selectWishlist(member_id, nextPage);
	
	if(memberService.selectWishlist(member_id, nextPage+1).size()==0) {
		nextPage = 0;
	}
	else {
		nextPage++;
	}
	//4. JSON으로 변환(QnaDTO, 다음페이지 번호)
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("nextPage",nextPage);
	JSONArray jsonArray = new JSONArray(list);
	jsonObject.put("list",jsonArray);
	//5. writer로 출력
	try {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(jsonObject.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
}
	
@RequestMapping("/mb")
public String mobileMain() {
	return "mobile_main";
}
@RequestMapping("/mbNotice.do")
public String mbNotice(HttpServletRequest request) {
	int pageNo = 1; int pageOfContentCount =20;
	if(request.getParameter("pageNo") != null)
		pageNo = Integer.parseInt(request.getParameter("pageNo"));
	List<NoticeDTO> list = memberService.selectAllNotice(pageNo);
	if(list.isEmpty()) {
		request.setAttribute("noticeList", null);
		return "mobile_notice";
	}
	else {
		int count = memberService.selectNoticeCount();
		PaggingVO vo = new PaggingVO(count, pageNo,pageOfContentCount);
		request.setAttribute("noticeList", list);
		request.setAttribute("page", vo);
	}
	return "mobile_notice";
}
@RequestMapping("/mbIntroduce.do")
public String mbIntroduce() { 
	return "mobile_introduce";
}
@RequestMapping("/mbGuide.do")
public String mbGuide() {
	return "mobile_guide";
}
@RequestMapping("/mbQnaView.do")
public String mbQnaView(HttpServletRequest request) {
	int page=1; int pageOfContentCount =20;
	if(request.getParameter("pageNo") != null)
		page = Integer.parseInt(request.getParameter("pageNo"));
	List<QnaDTO> list = qnaService.selectQnaList(page);
	int count = qnaService.selectCount();
	PaggingVO vo = new PaggingVO(count, page,pageOfContentCount);
	request.setAttribute("list", list);
	request.setAttribute("pagging", vo);
	return "mobile_qna";
}
@RequestMapping("/mbQnaWriteAction.do")
public String mbBoardWriteAction(HttpServletRequest request) {
	int qna_no = qnaService.newQno();
	String qna_member_id= request.getParameter("qna_member_id");
	String qna_title = request.getParameter("qna_title");
	String qna_content = request.getParameter("qna_content");
	qnaService.insertQna(new QnaDTO(qna_no, qna_member_id,qna_title,qna_content));
	QnaDTO dto = qnaService.selectQna(qna_no);
	request.setAttribute("qna", dto);
	request.setAttribute("qno", qna_no);
	return "mobile_qna_detail_view";
}
@RequestMapping("/mbQnaDetailView.do")
public String mbQnaDetailView(HttpServletRequest request) {
	int qno= 0;
	if(request.getParameter("qna_no") != null)
		qno = Integer.parseInt(request.getParameter("qna_no"));
	else
		qno = (int)request.getAttribute("qna_no");
	QnaDTO dto = qnaService.selectQna(qno);
	request.setAttribute("qna", dto);
	return "mobile_qna_detail_view";
}
@RequestMapping("/mbQnaWrite.do")
public String mbQnaWrite() {
	return "mobile_qna_write";
}

public String getUrlEncoder(String str) {
	try {
		str = URLEncoder.encode(str,"UTF-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	return str;
}
	
} 
	   
