package team.mapper;

import org.apache.ibatis.annotations.Mapper;

import team.dto.StoreDTO;

@Mapper
public interface StoreMapper {

	int storeRegister(StoreDTO dto);

	StoreDTO selectStoreDTO(String store_id);
	
}
