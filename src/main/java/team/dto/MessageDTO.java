package team.dto;

public class MessageDTO {
private int message_no;
private String message_member_id;
private String message_title;
private String message_content;
private String message_date;
private int message_status;
public MessageDTO() {
 
}
public MessageDTO( int message_no, String message_member_id, String message_title, String message_content,
		String message_date, int message_status) {
	this.message_no = message_no;
	this.message_member_id = message_member_id;
	this.message_title = message_title;
	this.message_content = message_content;
	this.message_date = message_date;
	this.message_status = message_status;
}

//쪽지 보내기용 생성자
public MessageDTO(String message_member_id, String message_title, String message_content) {
	super();
	this.message_member_id = message_member_id;
	this.message_title = message_title;
	this.message_content = message_content;
}
public int getMessage_no() {
	return message_no;
}
public void setMessage_no(int message_no) {
	this.message_no = message_no;
}
public String getMessage_member_id() {
	return message_member_id;
}
public void setMessage_member_id(String message_member_id) {
	this.message_member_id = message_member_id;
}
public String getMessage_title() {
	return message_title;
}
public void setMessage_title(String message_title) {
	this.message_title = message_title;
}
public String getMessage_content() {
	return message_content;
}
public void setMessage_content(String message_content) {
	this.message_content = message_content;
}
public String getMessage_date() {
	return message_date;
}
public void setMessage_date(String message_date) {
	this.message_date = message_date;
}
public int getMessage_status() {
	return message_status;
}
public void setMessage_status(int message_status) {
	this.message_status = message_status;
}
@Override
public String toString() {
	return "MessageDTO [message_no=" + message_no + ", message_member_id=" + message_member_id
			+ ", message_title=" + message_title + ", message_content=" + message_content + ", message_date="
			+ message_date + ", message_status=" + message_status + "]";
}


}



