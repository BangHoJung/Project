package member;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		super();
		this.mapper = mapper;
	}
	
	public int insertMember(MemberDTO memberDTO) {
		int count = mapper.insertMember(memberDTO);
		return count;
	}
	
}
