package member;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String tel;
	private int grade;
	private int addrNo;
	private String category;
	private int point;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String id, String pass, String name, String tel, int grade, int addrNo, String category,
			int point) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.grade = grade;
		this.addrNo = addrNo;
		this.category = category;
		this.point = point;
	}
	
	
	public MemberDTO(String id, String pass, String name, String tel, int grade, int addrNo, String category) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.grade = grade;
		this.addrNo = addrNo;
		this.category = category;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", grade=" + grade
				+ ", addrNo=" + addrNo + ", category=" + category + ", point=" + point + "]";
	}
	
}