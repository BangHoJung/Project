package team.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
 private String member_id;
 private String member_pass;
 private String member_name;
 private String member_tel;
 private int member_grade;
 private int member_addressNo;
 private String member_category;
 private int member_point;
public MemberDTO() {

}
public MemberDTO(String member_id, String member_pass, String member_name, String member_tel, int member_grade,
		int member_addressNo, String member_category, int member_point) {
	super();
	this.member_id = member_id;
	this.member_pass = member_pass;
	this.member_name = member_name;
	this.member_tel = member_tel;
	this.member_grade = member_grade;
	this.member_addressNo = member_addressNo;
	this.member_category = member_category;
	this.member_point = member_point;
}
public String getMember_id() {
	return member_id;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public String getMember_pass() {
	return member_pass;
}
public void setMember_pass(String member_pass) {
	this.member_pass = member_pass;
}
public String getMember_name() {
	return member_name;
}
public void setMember_name(String member_name) {
	this.member_name = member_name;
}
public String getMember_tel() {
	return member_tel;
}
public void setMember_tel(String member_tel) {
	this.member_tel = member_tel;
}
public int getMember_grade() {
	return member_grade;
}
public void setMember_grade(int member_grade) {
	this.member_grade = member_grade;
}
public int getMember_addressNo() {
	return member_addressNo;
}
public void setMember_addressNo(int member_addressNo) {
	this.member_addressNo = member_addressNo;
}
public String getMember_category() {
	return member_category;
}
public void setMember_category(String member_category) {
	this.member_category = member_category;
}
public int getMember_point() {
	return member_point;
}
public void setMember_point(int member_point) {
	this.member_point = member_point;
}
@Override
public String toString() {
	return "MemberDTO [member_id=" + member_id + ", member_pass=" + member_pass + ", member_name=" + member_name
			+ ", member_tel=" + member_tel + ", member_grade=" + member_grade + ", member_addressNo=" + member_addressNo
			+ ", member_category=" + member_category + ", member_point=" + member_point + "]";
}

 
}
