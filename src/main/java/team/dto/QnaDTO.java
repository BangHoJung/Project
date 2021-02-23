package team.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnaDTO {
	private int qna_no;
	private String qna_member_id;
	private String qna_title;
	private String qna_content;
	private String qna_date;
	private int qna_status;
	private String qna_response;
	private String qna_response_date;
	public QnaDTO() {

	}
	public QnaDTO(int qna_no, String qna_member_id, String qna_title, String qna_content, String qna_date,
			int qna_status, String qna_response, String qna_response_date) {
		super();
		this.qna_no = qna_no;
		this.qna_member_id = qna_member_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_status = qna_status;
		this.qna_response = qna_response;
		this.qna_response_date = qna_response_date;
	}
	//작성용
	public QnaDTO(int qna_no, String qna_member_id, String qna_title, String qna_content) {
		super();
		this.qna_no = qna_no;
		this.qna_member_id = qna_member_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_member_id() {
		return qna_member_id;
	}
	public void setQna_member_id(String qna_member_id) {
		this.qna_member_id = qna_member_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_status() {
		return qna_status;
	}
	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
	public String getQna_response() {
		return qna_response;
	}
	public void setQna_response(String qna_response) {
		this.qna_response = qna_response;
	}
	public String getQna_response_date() {
		return qna_response_date;
	}
	public void setQna_response_date(String qna_response_date) {
		this.qna_response_date = qna_response_date;
	}
	@Override
	public String toString() {
		return "QnaDTO [qna_no=" + qna_no + ", qna_member_id=" + qna_member_id + ", qna_title=" + qna_title
				+ ", qna_content=" + qna_content + ", qna_date=" + qna_date + ", qna_status=" + qna_status
				+ ", qna_response=" + qna_response + ", qna_response_date=" + qna_response_date + "]";
	}
	
	
	
	
	
}
