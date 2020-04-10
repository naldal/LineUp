package restaurant.dao;

import java.util.List; 
import java.util.Map;

import member.bean.MemberDTO;
import restaurant.bean.RestaurantMenuDTO;
import restaurant.bean.RestaurantOwnerDTO;
import restaurant.bean.RestaurantReserved;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewDTOWithName;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantImageDTO;
import restaurant.bean.RestaurantInfoDTO;
import restaurant.bean.RestaurantListDTO;
import restaurant.bean.RestaurantDTO;

public interface RestaurantDAO {
	public Map<String, Object> getStoreInformationManagement(String company_num, String date);

	public Map<String, Object> getReservationList(String company_num, String date);

	public List<RestaurantDTO> todayRestaurant();
	
	public void restaurant_register_imgs(RestaurantImageDTO restaurantImageDTO);

	public List<RestaurantListDTO> restaurantList(Map<String, Integer> map);

	public int getRestaurantTotalA();

	public int getResSeq(String company_num);

	public void restaurant_register_info(RestaurantDTO restaurantDTO);

	public List<RestaurantListDTO> restaurantSearchList(Map<String, String> map);

	public void restaurantRegister(List<RestaurantMenuDTO> list);

	public List<RestaurantImageDTO> restaurantImgList();

	public String getRestaurantSeq(String string);

	public void restaurantDelete(MemberDTO memberDTO);

	public void reservation(Map<String, String> map);

	public void reservation2(Map<String, String> map);

	public void reservation3(Map<String, String> map);

	public List<RestaurantListDTO> restaurantHomeList();

	public RestaurantDTO getRestaurantAllInfo(String seq_restaurant);

	public int getStarValue(String seq_restaurant);

	public String getResSeqWithMemberSeq(int seq_member);

	public RestaurantInfoDTO restaurantInfo(String seq_restaurant);

	public List<RestaurantMenuDTO> restaurantMenu(String seq_restaurant);

	public List<RestaurantImageDTO> restaurantImage(String seq_restaurant);

	public RestaurantOwnerDTO verifyResOwner(String seq_restaurant);

	public List<RestaurantReviewDTOWithName> restaurantReview(String seq_restaurant);


	public int getRestaurantSearchTotalA(Map<String, String> map);

	public void getIntoBasket(Map<String, String> map);

	public int cancelReservation(Map<String, String> map);

	public void cancelReservation2(Map<String, String> map);


	public void restaurantUpdate(Map<String, Object> map,  List<RestaurantImageDTO> finalIMG_list, List<RestaurantMenuDTO> menu_list);

	public void reviewRegister(RestaurantReviewDTO restaurantReviewDTO);

	public void reviewImgRegister(RestaurantReviewImageDTO restaurantReviewImageDTO);

	public int getReviewSeq(int seq_member);

	public List<RestaurantReviewImageDTO> getRestaurantReviewImage(String seq_restaurant);

	public String hasRestaurant(String id);

	public RestaurantReserved visitCheckYes1(Map<String, String> map);

	public void visitCheckYes2(Map<String, String> map);

	public void visitCheckYes3(RestaurantReserved reserved);

	public void visitCheckNo(Map<String, String> map);


	public MemberDTO reservationCheck(Map<String, String> map);

	public Map<String, Object> getReservedRestaurantList(String company_num, String date);

	public String acceptCheck(Map<String, Integer> map);

//	public void doReserve(Map<String, Integer> map);

	public void reservation4(Map<String, String> map);

	public String getRestaurantMainIMAGE(String seq_restaurant);

	public void deleteRestaurantIMAGE(String seq_restaurant);

}
