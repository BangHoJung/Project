package team.dto;

import org.apache.ibatis.type.Alias;

@Alias("store")
public class StoreDTO {
	private String store_id;
	private String store_name;
	private String store_addr;
	private String store_license;
	private String store_member_id;
	private String store_time;
	private String store_introduce;
	private String store_tel;
	private int store_category;
	
	public StoreDTO(String store_id, String store_name, String store_addr, String store_license, String store_member_id,
			String store_time, String store_introduce, String store_tel, int store_category) {
		super();
		this.store_id = store_id;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.store_license = store_license;
		this.store_member_id = store_member_id;
		this.store_time = store_time;
		this.store_introduce = store_introduce;
		this.store_tel = store_tel;
		this.store_category = store_category;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_license() {
		return store_license;
	}

	public void setStore_license(String store_license) {
		this.store_license = store_license;
	}

	public String getStore_member_id() {
		return store_member_id;
	}

	public void setStore_member_id(String store_member_id) {
		this.store_member_id = store_member_id;
	}

	public String getStore_time() {
		return store_time;
	}

	public void setStore_time(String store_time) {
		this.store_time = store_time;
	}

	public String getStore_introduce() {
		return store_introduce;
	}

	public void setStore_introduce(String store_introduce) {
		this.store_introduce = store_introduce;
	}

	public String getStore_tel() {
		return store_tel;
	}

	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}

	public int getStore_category() {
		return store_category;
	}

	public void setStore_category(int store_category) {
		this.store_category = store_category;
	}

	@Override
	public String toString() {
		return "StoreDTO [store_id=" + store_id + ", store_name=" + store_name + ", store_addr=" + store_addr
				+ ", store_license=" + store_license + ", store_member_id=" + store_member_id + ", store_time="
				+ store_time + ", store_introduce=" + store_introduce + ", store_tel=" + store_tel + ", store_category="
				+ store_category + "]";
	}
	
	
	
	
}
