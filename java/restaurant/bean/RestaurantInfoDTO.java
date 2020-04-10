package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantInfoDTO {

	private int seq_restaurant;
	private String restaurant_name;
	private String category;
	private String addr;
	private String tel;
	private String seq_member;
	private String content;
	private int starValue;
	
}
