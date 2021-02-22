package team.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import team.dto.StoreDTO;

@Mapper
public interface StoreMapper {

	int storeRegister(StoreDTO dto);

	StoreDTO selectStoreDTO(String store_id);

	int updateStoreCode(HashMap<String, Object> map);

	int deleteStoreDTO(String store_id);
	
}
