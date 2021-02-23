package team.service;

import java.util.List;

import org.springframework.stereotype.Service;

import team.dto.QnaDTO;
import team.mapper.QnaMapper;

@Service
public class QnaService {
	
	QnaMapper qnaMapper;

	public QnaService(QnaMapper qnaMapper) {
		super();
		this.qnaMapper = qnaMapper;
	}

	public List<QnaDTO> selectQnaList(int page) {
		
		return qnaMapper.selectQnaList(page);
	}

	public int selectCount() {
		return qnaMapper.selectCount();
	}

	public QnaDTO selectQna(int qno) {
		return qnaMapper.selectQna(qno);
	}

	public int newQno() {
		return qnaMapper.newQno();
	}

	public int insertQna(QnaDTO qnaDTO) {
		return qnaMapper.insertQna(qnaDTO);
	}

	
}
