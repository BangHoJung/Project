package team.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import team.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO loginMember(HashMap<String, Object> map);

	public String selectAddress(HashMap<String, Object> map);

	int insertMember(MemberDTO dto);
 
}
