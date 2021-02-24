package team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.AdDTO;

@Mapper
public interface AdMapper {

	List<AdDTO> selectAdList(int page);
	int selectCount();
	int newAd_no();
	int insertAd(AdDTO dto);
}
