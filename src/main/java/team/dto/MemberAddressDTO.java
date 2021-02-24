package team.dto;

public class MemberAddressDTO {
	private String address_Member_Id;
	private String address_Text;
	private int address_status;

	public MemberAddressDTO() {

	}

	public MemberAddressDTO(String address_Member_Id, String address_Text, int address_status) {
		super();
		this.address_Member_Id = address_Member_Id;
		this.address_Text = address_Text;
		this.address_status = address_status;
	}

	public String getAddress_Member_Id() {
		return address_Member_Id;
	}

	public void setAddress_Member_Id(String address_Member_Id) {
		this.address_Member_Id = address_Member_Id;
	}
	public String getAddress_Text() {
		return address_Text;
	}

	public void setAddress_Text(String address_Text) {
		this.address_Text = address_Text;
	}

	public int getAddress_status() {
		return address_status;
	}

	public void setAddress_status(int address_status) {
		this.address_status = address_status;
	}

	@Override
	public String toString() {
		return "MemberAddressDTO [address_Member_Id=" + address_Member_Id + ", address_Text=" + address_Text + ", address_status=" + address_status + "]";
	}
    
	
}
