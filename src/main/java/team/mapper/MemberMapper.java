package team.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.MemberAddressDTO;
import team.dto.MemberDTO;
import team.dto.MessageDTO;
import team.dto.NoticeDTO;
import team.dto.ReviewDTO;
import team.dto.WishDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO loginMember(HashMap<String, Object> map);

	public String selectMemberAddress(HashMap<String, Object> map);

	int insertMember(MemberDTO dto);
	
	public String selectMember(String id);

	public int registerMember(MemberDTO dto);

	public int registerMemberAddress(MemberAddressDTO addr);

	public List<MessageDTO> selectUserMessageList(HashMap<String, Object> map);

	public MessageDTO selectUserMessage(int no);

	public int updateMessageStatus(HashMap<String, Object> map);

	public int deleteMessage(HashMap<String, Object> map);

	public int selectMessageCount(String id);
	
	public int memberUpdateAction(MemberDTO memberDTO);

	public List<MemberAddressDTO> selectMemberAllAddress(String id);

	public int deleteMemberAddress(HashMap<String, Object> map);
    //수정 2021-02-25
	public int choiceMemberAddress(HashMap<String, Object> map);
	//수정 2021-02-25
	public int notChoiceMemberAddress(HashMap<String, Object> map);
	//수정 2021-02-25
	public String selectMemeberAddressCheck(HashMap<String, Object> map);
	//수정 2021-02-26
	public MemberDTO selectMemberPassCheck(HashMap<String, Object> map);
	//수정 2021-02-26
	public int updateMemberPass(HashMap<String, Object> map);
	//수정 2021-02-26
	public int adminNoticeWrite(HashMap<String, Object> map);
	//수정 2021-02-28
	public List<NoticeDTO> selectAllNotice(int pageNo);
	//수정 2021-02-26
	public NoticeDTO selectNotice(int notice_no);
	public int registerReview(ReviewDTO reviewDTO);
    
	//2021-02-28추가
	public int selectNoticeCount();

	public int adminNoticeDelete(int notice_no);

	public int adminNoticeUpdate(HashMap<String, Object> map);

	public List<ReviewDTO> adminSelectReportList(int pageNo);

	public int adminSelectReportCount();

	public ReviewDTO adminSelectReport(int review_no);

	public int adminDeleteReportReview(int review_no);

	public int adminCanselReportReview(int review_no);

	public int sendMessage(MessageDTO message);

	public int updateMemberGrade(HashMap<String, Object> map);
	
	List<WishDTO> selectWishlist(String member_id);
}
