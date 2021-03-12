package team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import team.dto.MemberAddressDTO;
import team.dto.MemberDTO;
import team.dto.MessageDTO;
import team.dto.NoticeDTO;
import team.dto.ReviewDTO;
import team.dto.WishDTO;
import team.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}
	public List<WishDTO> selectWishlist(String member_id) {
		return mapper.selectWishlist(member_id);
	}

	public MemberDTO loginMember(String id, String pass) {
       System.out.println("Serivce id: "+id);
       System.out.println("Serivce pass: "+pass);
	 HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("id", id);
       map.put("pass", pass);
       return mapper.loginMember(map); 
	}
	public String selectMemberAddress(String id, int address_status) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	       map.put("id", id);
	       map.put("address_status", address_status);
		return mapper.selectMemberAddress(map);
	}
	//회원가입 중복확인.
	public String selectMember(String id) {
		return mapper.selectMember(id);
	}
	public int registerMember(MemberDTO dto) {
        int count=0;
        count = mapper.registerMember(dto);
		return count;		
	}

	public int registerMemberAddress(MemberAddressDTO addr) {
       		int count=0;
       		count = mapper.registerMemberAddress(addr);
       		return count;
	}

	public List<MessageDTO> selectUserMessageList(String id, int pageNo) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("id", id);
	      map.put("pageNo",pageNo);
		return mapper.selectUserMessageList(map);
	}

	public MessageDTO selectUserMessage(int no) {
		return mapper.selectUserMessage(no);
	}

	public int updateMessageStatus(int no, String messag_id) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("no", no);
	      map.put("id",messag_id);
	      return mapper.updateMessageStatus(map);
		
		}

	public int deleteMessage(int message_no, String id) {
		  HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("no", message_no);
	      map.put("id",id);
		return mapper.deleteMessage(map);
	}

	public int selectMessageCount(String id) {
		return mapper.selectMessageCount(id);
	}

	public int memberUpdateAction(MemberDTO memberDTO) {
		return mapper.memberUpdateAction(memberDTO);
		
	}
	public List<MemberAddressDTO> selectMemberAllAddress(String id) {
		return mapper.selectMemberAllAddress(id);
	}

	public int deleteMemberAddress(String address,String id) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("address", address);
	      map.put("id",id);
		return mapper.deleteMemberAddress(map);
	}
    //수정 2021-02-25
	public int choiceMemberAddress(String address, String id) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("address", address);
	      map.put("id",id);
		return mapper.choiceMemberAddress(map);
	}
	//수정 2021-02-25
	public int notChoiceMemberAddress(String address, String id) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("address", address);
	      map.put("id",id);
		return mapper.notChoiceMemberAddress(map);
	}
    //수정 2021-02-25
	public String selectMemeberAddressCheck(String id, String address) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("address", address);
	      map.put("id",id);
		return mapper.selectMemeberAddressCheck(map);
	}
    //수정 2021-02-26
	public MemberDTO selectMemberPassCheck(String id, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("id", id);
	      map.put("pass",pass);
		return mapper.selectMemberPassCheck(map);
	}

	public int updateMemberPass(String id, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("id", id);
	      map.put("pass",pass);
		return mapper.updateMemberPass(map);
	}

	public int adminNoticeWrite(String title, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("title",title);
	      map.put("content",content);
		return mapper.adminNoticeWrite(map);
	}

	public List<NoticeDTO> selectAllNotice(int pageNo) {
		return mapper.selectAllNotice(pageNo);
	}

	public NoticeDTO selectNotice(int notice_no) {
		return mapper.selectNotice(notice_no);
	}
	public int registerReview(ReviewDTO reviewDTO) {
		return mapper.registerReview(reviewDTO);
	}
	//2021-02-28 추가
	public int selectNoticeCount() {
		return mapper.selectNoticeCount();
	}

	public int adminNoticeDelete(int notice_no) {
		return mapper.adminNoticeDelete(notice_no);
	}

	public int adminUpdateNotice(int notice_no, String notice_title, String notice_content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("notice_no",notice_no);
	      map.put("notice_title",notice_title);
	      map.put("notice_content", notice_content);
		return mapper.adminNoticeUpdate(map);
	}

	public List<ReviewDTO> adminSelectReportList(int pageNo) {
		return mapper.adminSelectReportList(pageNo);
	}

	public int adminSelectReportCount() {
		return mapper.adminSelectReportCount();
	}

	public ReviewDTO adminSelectReport(int review_no) {
		return mapper.adminSelectReport(review_no);
	}

	public int adminDeleteReportReview(int review_no) {
		return mapper.adminDeleteReportReview(review_no);
	}

	public int adminCanselReportReview(int review_no) {
		return mapper.adminCanselReportReview(review_no);
	}

	public int sendMessage(MessageDTO message) {
		return mapper.sendMessage(message);
	}

	public int updateMemberGrade(String member_id, int grade) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("member_id",member_id);
	    map.put("grade",grade);
		return mapper.updateMemberGrade(map);
		
	}
	public WishDTO selectWishOne(String store_id, String member_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id",member_id);
		map.put("store_id",store_id);
		return mapper.selectWishOne(map);
	}
	public int businessReportAction(int review_no) {
		return mapper.businessReportAction(review_no);
	}
	public int insertWishList(String member_id, String store_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("member_id",member_id);
	    map.put("store_id",store_id);
		return mapper.insertWishList(map);
	}

	public int deleteWishList(String member_id, String store_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("member_id",member_id);
	    map.put("store_id",store_id);
		return mapper.deleteWishList(map);
	}
	
}
