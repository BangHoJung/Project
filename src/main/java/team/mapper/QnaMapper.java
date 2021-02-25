package team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.dto.QnaDTO;


@Mapper
public interface QnaMapper {

	List<QnaDTO> selectQnaList(int page);

	int selectCount();

	QnaDTO selectQna(int qno);

	int newQno();

	int insertQna(QnaDTO qnaDTO);

	int updateQna(QnaDTO qnaDTO);

	int deleteQna(int qna_no);

	int qnaAnswer(QnaDTO qnaDTO);



	
}
