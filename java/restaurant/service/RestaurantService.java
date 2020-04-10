package restaurant.service;

import java.util.List;  
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import member.bean.MemberDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantPaging;
import restaurant.bean.RestaurantReserved;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewDTOWithName;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantImageDTO;
import restaurant.bean.RestaurantInfoDTO;
import restaurant.bean.RestaurantListDTO;
import restaurant.bean.RestaurantMenuDTO;
import restaurant.bean.RestaurantOwnerDTO;


public interface RestaurantService {

	public Map<String, Object> getStoreInformationManagement(String company_num, String date);

	public Map<String, Object> getReservationList(String company_num, String date);

	public void restaurant_register_imgs(RestaurantImageDTO restaurantImageDTO);

	public void restaurant_menu(Map<String, String> menu);

	public int getResSeq(String string);

	public void restaurant_register_info(RestaurantDTO restaurantDTO);

	//List & paging & searh
	public List<RestaurantListDTO> restaurantList(String pg); //List for RestaurantList
	
	public List<RestaurantListDTO> restaurantHomeList(); //List for index
	
	public RestaurantPaging restaurantListPaging(String pg); //List paging
	
	public List<RestaurantListDTO> restaurantSearchList(Map<String, String> map); //Search list

	public RestaurantPaging restaurantSearchListPaging(Map<String, String> map); //Search paging

	public void reservation(Map<String, String> map);

	public void reservation2(Map<String, String> map);

	public void reservation3(Map<String, String> map);

	public List<RestaurantImageDTO> restaurantImgList();

	public RestaurantDTO getRestaurantAllInfo(String restaurnat_seq);

	public int getStarValue(String restaurant_seq);

	public String getResSeqWithMemberSeq(int mem_seq);

	public RestaurantInfoDTO restaurantInfo(String seq_restaurant);

	public List<RestaurantMenuDTO> restaurantMenu(String seq_restaurant);

	public List<RestaurantImageDTO> restaurantImage(String seq_restaurant);

	public RestaurantOwnerDTO verifyResOwner(String seq_restaurant);

	public List<RestaurantReviewDTOWithName> restaurantReview(String seq_restaurant);

	public void getIntoBasket(Map<String, String> map);

	public int cancelReservation(Map<String, String> map);

	public void cancelReservation2(Map<String, String> map);

	public void restaurantUpdate(Map<String, Object> map, MultipartFile img_main,List<String> default_img_sub, List<MultipartFile> img_list);

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

	public String acceptCheck(Map<String, Integer> map);

	/* public void doReserve(Map<String, Integer> map); */

	public void reservation4(Map<String, String> map);

}
