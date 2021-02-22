package team.service;

import org.springframework.stereotype.Service;

import team.dto.StoreDTO;
import team.mapper.StoreMapper;

@Service
public class StoreService {
	
	StoreMapper storeMapper;
	
	public StoreService(StoreMapper storeMapper) {
		super();
		this.storeMapper = storeMapper;
	}

	public void storeRegister(StoreDTO dto) {
		System.out.println(dto.toString());
		int count = storeMapper.storeRegister(dto);
	}

	public StoreDTO selectStoreDTO(String store_id) {
		return storeMapper.selectStoreDTO(store_id);
	}
}
