package team.dto;

public class WishDTO {
private String   wish_list_member_id;   
private String   wish_list_store_id;


public WishDTO() {
   super();
   // TODO Auto-generated constructor stub
}

public WishDTO(String wish_list_member_id, String wish_list_store_id) {
   super();
   this.wish_list_member_id = wish_list_member_id;
   this.wish_list_store_id = wish_list_store_id;
}


public String getWish_list_member_id() {
   return wish_list_member_id;
}


public void setWish_list_member_id(String wish_list_member_id) {
   this.wish_list_member_id = wish_list_member_id;
}


public String getWish_list_store_id() {
   return wish_list_store_id;
}


public void setWish_list_store_id(String wish_list_store_id) {
   this.wish_list_store_id = wish_list_store_id;
}


@Override
public String toString() {
   return "WishDTO [wish_list_member_id=" + wish_list_member_id + ", wish_list_store_id=" + wish_list_store_id + "]";
} 

}