package team.dto;

public class MemberAddressDTO {
	private String MemberId;
	private int AddressNo;
	private String Address;

	public MemberAddressDTO() {

	}

	public MemberAddressDTO(String memberId, int addressNo, String address) {
		super();
		MemberId = memberId;
		AddressNo = addressNo;
		Address = address;
	}
   
	//주소를 조회할때 사용
	public MemberAddressDTO(String memberId, int addressNo) {
		super();
		MemberId = memberId;
		AddressNo = addressNo;
	}

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
	}

	public int getAddressNo() {
		return AddressNo;
	}

	public void setAddressNo(int addressNo) {
		AddressNo = addressNo;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	@Override
	public String toString() {
		return "MemberAddressDTO [MemberId=" + MemberId + ", AddressNo=" + AddressNo + ", Address=" + Address + "]";
	}
    
	
}
