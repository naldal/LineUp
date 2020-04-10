package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantReviewDTOWithName {
	private int seq_review;
	private int seq_restaurant;
	private int seq_member;
	private String subject;
	private int score;
	private String content;
	private String real_name;
	private String nickname;
	private String id;
	private String log_time;
}
