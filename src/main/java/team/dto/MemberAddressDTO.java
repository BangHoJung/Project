package team.dto;

public class MemberAddressDTO {
	private String address_Member_Id;
	private int address_No;
	private String address_Text;

	public MemberAddressDTO() {

	}

	public String getAddress_Member_Id() {
		return address_Member_Id;
	}

	public void setAddress_Member_Id(String address_Member_Id) {
		this.address_Member_Id = address_Member_Id;
	}

	public int getAddress_No() {
		return address_No;
	}

	public void setAddress_No(int address_No) {
		this.address_No = address_No;
	}

	public String getAddress_Text() {
		return address_Text;
	}

	public void setAddress_Text(String address_Text) {
		this.address_Text = address_Text;
	}

	@Override
	public String toString() {
		return "MemberAddressDTO [address_Member_Id=" + address_Member_Id + ", address_No=" + address_No
				+ ", address_Text=" + address_Text + "]";
	}

    
	
}
