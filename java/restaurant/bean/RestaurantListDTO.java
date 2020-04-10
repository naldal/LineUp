
package restaurant.bean;

import lombok.Data;
//this is for index list and restaurantList
@Data
public class RestaurantListDTO {
	private String restaurant_name;
	private String main_img;
	private String category;
	private String addr;
	private String zipcode;
	private String score;
	private String tel;
	private String seq_restaurant;
	private String company_num;
	private String seq_member;
	private String vegan;

	
}
