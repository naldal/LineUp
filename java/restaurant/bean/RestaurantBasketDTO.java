package restaurant.bean;

import java.util.Date;
import lombok.Data;

@Data
public class RestaurantBasketDTO {

	private int seq_basket;
	private int seq_restaurant;
	private int seq_member;
	private Date log_time;
	
}
