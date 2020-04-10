package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantReserved {
	private int seq_visited;
	private int seq_member;
	private int seq_restaurant;
	private int seq_review;
	private int seq_reservation;
	private int howmany;
	private String log_time;
	private String accepted;
}
