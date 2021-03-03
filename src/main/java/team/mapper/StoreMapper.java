package team.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.StoreDTO;
import team.dto.StoreMenuDTO;

@Mapper
public interface StoreMapper {

	int registerStore(StoreDTO dto);

	StoreDTO selectStoreDTO(String store_id);

	int updateStoreCode(HashMap<String, Object> map);

	int deleteStoreDTO(String store_id);

	int registerMenu(StoreMenuDTO storeMenuDTO);

	String selectStoreID(String member_id);

	List<StoreDTO> selectStoreListCode(int store_code);

	int updateMenuPhoto(HashMap<String, Object> map);

	List<StoreMenuDTO> selectStoreMenuList(String store_id);

	List<StoreDTO> selectStoreListDetail(HashMap<String, Object> map);

	int deleteMenu(String store_id);
	
}
