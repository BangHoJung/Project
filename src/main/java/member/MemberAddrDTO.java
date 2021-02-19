package member;

public class MemberAddrDTO {
	private String id;
	private int addrNo;
	private String addrText;
	public MemberAddrDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberAddrDTO(String id, int addrNo, String addrText) {
		super();
		this.id = id;
		this.addrNo = addrNo;
		this.addrText = addrText;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}
	public String getAddrText() {
		return addrText;
	}
	public void setAddrText(String addrText) {
		this.addrText = addrText;
	}
	@Override
	public String toString() {
		return "MemberAddrDTO [id=" + id + ", addrNo=" + addrNo + ", addrText=" + addrText + "]";
	}
	
}
