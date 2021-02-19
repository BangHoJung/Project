package member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	int insertMember(MemberDTO memberDTO);
	
}
