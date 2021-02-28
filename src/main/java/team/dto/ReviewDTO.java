package team.dto;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class ReviewDTO {
	private String review_id;
	private String review_member_id;
	private String review_store_id;
	private String review_content;
	private String review_date;
	private int review_score_service;
	private int review_score_price;
	private int review_menu_no;
	private int review_score_menu;
	private String review_photo;
	private int review_report;
	
	public ReviewDTO() {
		
	}
	
	//테이블 전체데이터 생성자
	public ReviewDTO(String review_id, String review_member_id, String review_store_id, String review_content,
			String review_date, int review_score_service, int review_score_price, int review_menu_no,
			int review_score_menu, String review_photo, int review_report) {
		super();
		this.review_id = review_id;
		this.review_member_id = review_member_id;
		this.review_store_id = review_store_id;
		this.review_content = review_content;
		this.review_date = review_date;
		this.review_score_service = review_score_service;
		this.review_score_price = review_score_price;
		this.review_menu_no = review_menu_no;
		this.review_score_menu = review_score_menu;
		this.review_photo = review_photo;
		this.review_report = review_report;
	}
	
	// REVIEW 데이터 입력 생성자(DATE,REPORT 제외)
	public ReviewDTO(String review_id, String review_member_id, String review_store_id, String review_content,
			int review_score_service, int review_score_price, int review_menu_no, int review_score_menu,
			String review_photo) {
		super();
		this.review_id = review_id;
		this.review_member_id = review_member_id;
		this.review_store_id = review_store_id;
		this.review_content = review_content;
		this.review_score_service = review_score_service;
		this.review_score_price = review_score_price;
		this.review_menu_no = review_menu_no;
		this.review_score_menu = review_score_menu;
		this.review_photo = review_photo;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getReview_member_id() {
		return review_member_id;
	}

	public void setReview_member_id(String review_member_id) {
		this.review_member_id = review_member_id;
	}

	public String getReview_store_id() {
		return review_store_id;
	}

	public void setReview_store_id(String review_store_id) {
		this.review_store_id = review_store_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public int getReview_score_service() {
		return review_score_service;
	}

	public void setReview_score_service(int review_score_service) {
		this.review_score_service = review_score_service;
	}

	public int getReview_score_price() {
		return review_score_price;
	}

	public void setReview_score_price(int review_score_price) {
		this.review_score_price = review_score_price;
	}

	public int getReview_menu_no() {
		return review_menu_no;
	}

	public void setReview_menu_no(int review_menu_no) {
		this.review_menu_no = review_menu_no;
	}

	public int getReview_score_menu() {
		return review_score_menu;
	}

	public void setReview_score_menu(int review_score_menu) {
		this.review_score_menu = review_score_menu;
	}

	public String getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}

	public int getReview_report() {
		return review_report;
	}

	public void setReview_report(int review_report) {
		this.review_report = review_report;
	}

	@Override
	public String toString() {
		return "ReviewDTO [review_id=" + review_id + ", review_member_id=" + review_member_id + ", review_store_id="
				+ review_store_id + ", review_content=" + review_content + ", review_date=" + review_date
				+ ", review_score_service=" + review_score_service + ", review_score_price=" + review_score_price
				+ ", review_menu_no=" + review_menu_no + ", review_score_menu=" + review_score_menu + ", review_photo="
				+ review_photo + ", review_report=" + review_report + "]";
	}
	
	
}
