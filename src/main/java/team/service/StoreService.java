package team.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

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

	public void registerStore(StoreDTO dto) {
		System.out.println(dto.toString());
		int count = storeMapper.registerStore(dto);
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
}
