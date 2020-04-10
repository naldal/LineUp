package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantReviewImageDTO {
	private int seq_reivew_img;
	private int seq_member;
	private int seq_restaurant;
	private String image;
	private int seq_review;
	private String subject;
}


