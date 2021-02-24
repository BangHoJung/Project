package team.service;

import java.util.List;

import org.springframework.stereotype.Service;

import team.dto.AdDTO;
import team.mapper.AdMapper;


@Service
public class AdService {
	
	private AdMapper mapper;
	
	public AdService(AdMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public List<AdDTO> selectAdList(int page) {
		return mapper.selectAdList(page);
	}
	
	public int selectCount() {
		return mapper.selectCount();
	}
	
	public void addCount(int ad_no) {
		mapper.addCount(ad_no);
	}
	
	public AdDTO selectAd(int ad_no) {
		return mapper.selectAd(ad_no);
	}
	
	public int newAd_no() {
		return mapper.newAd_no();
	}

	public int insertAd(AdDTO dto) {
		return mapper.insertAd(dto);
	}


}
