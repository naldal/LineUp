package restaurant.bean;

import lombok.Data;

@Data
public class RestaurantVisitedDTO {
   private int seq_restaurant;
   private String restaurant_name;
   private String real_name;
   private String zipcode;
   private String addr;
   private String tel;
   private String company_num;
   private String category;
   private String log_time;
   private String score;
   private String seq_visited;
   private String seq_review;
}