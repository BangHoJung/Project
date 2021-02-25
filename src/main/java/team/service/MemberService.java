package team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import team.dto.MemberAddressDTO;
import team.dto.MemberDTO;
import team.dto.MessageDTO;
import team.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
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

	
	
}
