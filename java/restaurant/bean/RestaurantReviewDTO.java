package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantReviewDTO {
	private int seq_review;
	private int seq_restaurant;
	private int seq_member;
	private String name; //이름(real_name / nickname)
	private String id; //이메일
	private String subject;
	private int score;
	private String content;
	private String image;
	private String log_time;
	private String restaurant_name;
}
