package team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.QnaDTO;


@Mapper
public interface QnaMapper {

	List<QnaDTO> selectQnaList(int page);

	int selectCount();

	QnaDTO selectQna(int qno);



	
}