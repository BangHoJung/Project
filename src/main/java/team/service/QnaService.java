package team.service;

import java.util.HashMap;
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

	public int updateQna(QnaDTO qnaDTO) {
		return qnaMapper.updateQna(qnaDTO);
	}

	public int deleteQna(int qna_no) {
		return qnaMapper.deleteQna(qna_no);
		
	}

	public int qnaAnswer(QnaDTO qnaDTO) {
		return qnaMapper.qnaAnswer(qnaDTO);
		
	}

	public List<QnaDTO> selectMypageQnaList(int page, String id) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
	       map.put("page", page);
	       map.put("id", id);
	       return qnaMapper.selectMypageQnaList(map); 
	}

	public int selectMypageCount(String id) {
		return qnaMapper.selectMypageCount(id);
	}

}
