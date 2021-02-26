package team.dto;

public class AdDTO {
	private int ad_no;
	private String ad_store_id;
	private int ad_status;
	private String ad_content;
	
	
	public AdDTO(int ad_no, String ad_store_id, int ad_status, String ad_content) {
		super();
		this.ad_no = ad_no;
		this.ad_store_id = ad_store_id;
		this.ad_status = ad_status;
		this.ad_content = ad_content;
	}

	public int getAd_no() {
		return ad_no;
	}

	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}

	public String getAd_store_id() {
		return ad_store_id;
	}

	public void setAd_store_id(String ad_store_id) {
		this.ad_store_id = ad_store_id;
	}

	public int getAd_status() {
		return ad_status;
	}

	public void setAd_status(int ad_status) {
		this.ad_status = ad_status;
	}


	public String getAd_content() {
		return ad_content;
	}

	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}

	@Override
	public String toString() {
		return "AdDTO [ad_no=" + ad_no + ", ad_store_id=" + ad_store_id + ", ad_status="
				+ ad_status + ", ad_content=" + ad_content + "]";
	}

	
	
}
