package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantMenuDTO {
	private int seq_restaurant;
	private String menu_name;
	private String menu_price;
	private String vegan;
	private String spicy;
}
