package team.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import team.dto.MemberDTO;
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
	public String selectAddress(String id, int addressNo) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	       map.put("id", id);
	       map.put("addressNo", addressNo);
		return mapper.selectAddress(map);
	}
	
	public int insertMember(MemberDTO memberDTO) {
		int count = mapper.insertMember(memberDTO);
		return count;
	}

	
	
}
