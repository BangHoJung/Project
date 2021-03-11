package team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.AdDTO;
import team.dto.StoreDTO;

@Mapper
public interface AdMapper {

	List<AdDTO> selectAdList(int page);
	int selectCount();
	void addCount(int ad_no);
	AdDTO selectAd(int ad_no);
	List<StoreDTO> selectMemberStoreList(String member_id);
	int newAd_no();
	int insertAd(AdDTO dto);
}
