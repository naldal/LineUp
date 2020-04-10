package index.bean;

import lombok.Data;

@Data
public class IndexReviewDTO {
//		select distinct rev.seq_restaurant,rev.seq_member, mem.nickname, rev.subject, rev.content, res.restaurant_name, img.main_img, rev.log_time

	private String nickname;
	private String subject;
	private String content;
	private String restaurant_name;
	private String main_img;
	private String seq_member;
	private String seq_restaurant;
	
	
	
}
