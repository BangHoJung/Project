package team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import team.dto.ReviewDTO;
import team.dto.StoreDTO;
import team.dto.StoreMenuDTO;
import team.mapper.StoreMapper;

@Service
public class StoreService {
	
	StoreMapper storeMapper;
	
	public StoreService(StoreMapper storeMapper) {
		super();
		this.storeMapper = storeMapper;
	}

	public int registerStore(StoreDTO dto) {
		System.out.println(dto.toString());
		return storeMapper.registerStore(dto);
	}

	public StoreDTO selectStoreDTO(String store_id) {
		return storeMapper.selectStoreDTO(store_id);
	}

	public int updateStoreCode(String store_id, int code) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("store_id", store_id);
		map.put("store_code", code);
		return storeMapper.updateStoreCode(map);
	}

	public int deleteStoreDTO(String store_id) {
		return storeMapper.deleteStoreDTO(store_id);
	}

	public int registerMenu(StoreMenuDTO storeMenuDTO) {
		return storeMapper.registerMenu(storeMenuDTO);
		
	}

	public String selectStoreID(String member_id) {
		return storeMapper.selectStoreID(member_id);
	}

	public List<StoreDTO> selectStoreListCode(int store_code) {
		return storeMapper.selectStoreListCode(store_code);
	}

	public int updateMenuPhoto(String store_id, String menu_name, String originalFileName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("store_id", store_id);
		map.put("menu_name", menu_name);
		map.put("menu_photo", originalFileName);
		return storeMapper.updateMenuPhoto(map);
	}

	public List<StoreMenuDTO> selectStoreMenuList(String store_id) {
		return storeMapper.selectStoreMenuList(store_id);
	}
	public List<StoreMenuDTO> selectStoreMenuListWtihReview(String store_id) {
		return storeMapper.selectStoreMenuListWtihReview(store_id);
	}


	public List<StoreDTO> selectStoreListDetail(String search,String addr, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", "%"+search+"%");
		map.put("addr", "%"+addr+"%");
		map.put("page", page);
		return storeMapper.selectStoreListDetail(map);
	}

	public int deleteMenu(String store_id) {
		return storeMapper.deleteMenu(store_id);
	}
	public List<ReviewDTO> selectStoreReviewList(String store_id) {
			return storeMapper.selectStoreReviewList(store_id);
	}
	public List<StoreDTO> selectStoreListBestScore(int day,int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("day", day);
		map.put("page", page);
		return storeMapper.selectStoreListBestScore(map);
	}
	
	public List<StoreDTO> selectStoreListBestReviewCount(int day,int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("day", day);
		map.put("page", page);
		return storeMapper.selectStoreListBestReviewCount(map);
	}
	public List<ReviewDTO> selectStoreReviewListMore(String store_id, int no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("store_id", store_id);
		map.put("no", no);
		return storeMapper.selectStoreReviewListMore(map);
	}

	public int updateStoreCount(String store_id) {
		return storeMapper.updateStoreCount(store_id);
		
	}

	public StoreDTO selectStoreDetailDTO(String store_id) {
		return storeMapper.selectStoreDTODetail(store_id);
	}
	
	public List<StoreDTO> selectMypageStoreList(String category, String necessary_addr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("store_category", category);
		necessary_addr="%"+necessary_addr+"%";
		map.put("store_addr", necessary_addr);
		return storeMapper.selectMypageStoreList(map);
	}
}
