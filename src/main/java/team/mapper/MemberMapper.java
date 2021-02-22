package team.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.MemberAddressDTO;
import team.dto.MemberDTO;
import team.dto.MessageDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO loginMember(HashMap<String, Object> map);

	public String selectAddress(HashMap<String, Object> map);

	int insertMember(MemberDTO dto);
	
	public String selectMember(String id);

	public int registerMember(MemberDTO dto);

	public int registerAddress(MemberAddressDTO addr);

	public List<MessageDTO> selectUserMessageList(HashMap<String, Object> map);

	public MessageDTO selectUserMessage(int no);

	public int updateMessageStatus(HashMap<String, Object> map);

	public int deleteMessage(HashMap<String, Object> map);

	public int selectMessageCount(String id);




    
}
