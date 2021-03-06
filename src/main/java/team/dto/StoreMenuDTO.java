package team.dto;

import org.apache.ibatis.type.Alias;

@Alias("menu")
public class StoreMenuDTO {
	private int menu_no;
	private String menu_store_id;
	private String menu_name;
	private int menu_price;
	private String menu_photo;
	private double menu_score;
	
	
	public StoreMenuDTO() {
		super();
	}
	//모든 데이터 생성자
	public StoreMenuDTO(int menu_no, String menu_store_id, String menu_name, int menu_price, String menu_photo) {
		super();
		this.menu_no = menu_no;
		this.menu_store_id = menu_store_id;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_photo = menu_photo;
	}

	public StoreMenuDTO(String menu_store_id, String menu_name, int menu_price, String menu_photo) {
		super();
		this.menu_store_id = menu_store_id;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_photo = menu_photo;
	}
	
	// 메뉴 정보 + 메뉴별점(DB)
	public StoreMenuDTO(int menu_no, String menu_store_id, String menu_name, int menu_price, String menu_photo,
			double menu_score) {
		super();
		this.menu_no = menu_no;
		this.menu_store_id = menu_store_id;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_photo = menu_photo;
		this.menu_score = menu_score;
	}
	
	public int getMenu_id() {
		return menu_no;
	}

	public void setMenu_id(int menu_no) {
		this.menu_no = menu_no;
	}

	public String getMenu_store_id() {
		return menu_store_id;
	}

	public void setMenu_store_id(String menu_store_id) {
		this.menu_store_id = menu_store_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_photo() {
		return menu_photo;
	}

	public void setMenu_photo(String menu_photo) {
		this.menu_photo = menu_photo;
	}
	public double getMenu_score() {
		return menu_score;
	}
	public void setMenu_score(double menu_score) {
		this.menu_score = menu_score;
	}
	@Override
	public String toString() {
		return "StoreMenuDTO [menu_no=" + menu_no + ", menu_store_id=" + menu_store_id + ", menu_name=" + menu_name
				+ ", menu_price=" + menu_price + ", menu_photo=" + menu_photo + ", menu_score="+menu_score+"]";
	}
	
	
	
}
