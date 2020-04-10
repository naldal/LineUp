package restaurant.service;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Multipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import member.bean.MemberDTO;
import restaurant.bean.RestaurantMenuDTO;
import restaurant.bean.RestaurantOwnerDTO;
import restaurant.bean.RestaurantPaging;
import restaurant.bean.RestaurantReserved;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantImageDTO;
import restaurant.bean.RestaurantInfoDTO;
import restaurant.bean.RestaurantListDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantReviewDTOWithName;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.dao.RestaurantDAO;

@Service(value="restaurantService")
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantDAO restaurantDAO;
	@Autowired
	private RestaurantPaging restaurantPaging;
	@Override
	public Map<String, Object> getStoreInformationManagement(String company_num, String date) {
		System.out.println(company_num+","+ date);
		return restaurantDAO.getStoreInformationManagement(company_num, date);
	}

	@Override
	public Map<String, Object> getReservationList(String company_num, String date) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yy/MM/dd");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println(time1);
		System.out.println(date);
		if(time1.equals(date)) {
			return restaurantDAO.getReservationList(company_num, date);
		}else {
			return restaurantDAO.getReservedRestaurantList(company_num, date);
		}
		
	}

	@Override
	public void restaurant_menu(Map<String, String> menu) {
		
		System.out.println(menu); //ok
		
		int len = menu.get("menu").toString().split(",").length;
		len = len/4;
		
		String menuval[] = menu.get("menu").toString().split(",");
		List<RestaurantMenuDTO> list = new ArrayList<RestaurantMenuDTO>();
		
		String seq_restaurant = menu.get("restaurant_seq");
		
		System.out.println("controller res seq:"+seq_restaurant); //ok
		
		int num=0;
		for(int i=0; i<len; i++) {
			RestaurantMenuDTO restaurantMenuDTO = new RestaurantMenuDTO();
			restaurantMenuDTO.setSeq_restaurant(Integer.parseInt(seq_restaurant));
			restaurantMenuDTO.setMenu_name(menuval[num]);
			restaurantMenuDTO.setMenu_price(menuval[num=num+1]+"원");
			restaurantMenuDTO.setVegan(menuval[num=num+1]);
			restaurantMenuDTO.setSpicy(menuval[num=num+1]);
			list.add(restaurantMenuDTO);
			
			System.out.println("list : "+list.get(i));
			num=num+1;
		}
		
		restaurantDAO.restaurantRegister(list);
	}
	
	@Override
	public void restaurantUpdate(Map<String, Object> map, MultipartFile img_main, List<String> default_img_sub, List<MultipartFile> img_list) {
		map.put( "seq_restaurant" , restaurantDAO.getRestaurantSeq(map.get("company_num")+"")); // map에 레스토랑 시퀀스번호를 넣어준다.
		String seq_restaurant = map.get("seq_restaurant")+"";
		int len = map.get("menu").toString().split(",").length;
		len = len/4;
		System.out.println("확인:"+map.get("menu"));
		String menu[] = map.get("menu").toString().split(",");
		List<RestaurantMenuDTO> menu_list = new ArrayList<RestaurantMenuDTO>();
		int num=0;
		
		for(int i=0; i<len; i++) {
			RestaurantMenuDTO restaurantMenuDTO = new RestaurantMenuDTO();
			restaurantMenuDTO.setSeq_restaurant(Integer.parseInt(seq_restaurant));
			restaurantMenuDTO.setMenu_name(menu[num]);
			restaurantMenuDTO.setMenu_price(menu[num=num+1]);
			restaurantMenuDTO.setVegan(menu[num=num+1]);
			restaurantMenuDTO.setSpicy(menu[num=num+1]);
			num=num+1;
			System.out.println(restaurantMenuDTO.getMenu_name());
			menu_list.add(restaurantMenuDTO);
		}
		//메인이미지
		String filePathMain = "" ;
		String fileNameMain = "";
		String mainImage ="";
		if(img_main != null) {
			filePathMain = "//192.168.0.14/main_imgs";
			fileNameMain = img_main.getOriginalFilename();
			try {
				File fileMain = new File(filePathMain, fileNameMain);
				FileCopyUtils.copy(img_main.getInputStream(), new FileOutputStream(fileMain));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			new RestaurantImageDTO();
			mainImage=fileNameMain;
		}else {
			mainImage = restaurantDAO.getRestaurantMainIMAGE(seq_restaurant);
		}
		//레스토랑 메인이미지 변수에는 레스토랑 메뉴이미지의 이름이 적혀있다.
		
		List<RestaurantImageDTO> finalIMG_list = new ArrayList<RestaurantImageDTO>();
		RestaurantImageDTO restaurantImageDTO = new RestaurantImageDTO();
		restaurantDAO.deleteRestaurantIMAGE(seq_restaurant); //모든 서브이미지 제거
		if(default_img_sub.size()!=0) { //기본이미지 사이즈가 0이 아니라면 
			for(String default_subIMG : default_img_sub) {
				restaurantImageDTO = new RestaurantImageDTO();
				restaurantImageDTO.setSeq_restaurant(seq_restaurant);
				restaurantImageDTO.setMain_img(mainImage);
				restaurantImageDTO.setSub_img(default_subIMG);
				finalIMG_list.add(restaurantImageDTO);
			}
		}
		//기본이미지 저장 완료
		
		
		if(img_list.size() != 0) { //이미지 리스트의 사이즈가 0이면 서브이미지 들어온게 없다는뜻 추가된 이미지가 없으면 데이터를 더이상 추가해줄 필요가 없다.
			String filePathSub = "D:/spring/workSTS/PullSquad/src/main/webapp/restaurant_register_imgs/sub_imgs";
			for(MultipartFile img_sub : img_list) {
				String fileNameSub = img_sub.getOriginalFilename();
				File fileSub = new File(filePathSub, fileNameSub);
				try {
					FileCopyUtils.copy(img_sub.getInputStream(), new FileOutputStream(fileSub));
				} catch (IOException e) {
					e.printStackTrace();
				}
				restaurantImageDTO = new RestaurantImageDTO();
				restaurantImageDTO.setSub_img(fileNameSub);
				restaurantImageDTO.setSeq_restaurant(seq_restaurant);
				restaurantImageDTO.setMain_img(mainImage);
				finalIMG_list.add(restaurantImageDTO);
			}
		}
		System.out.println("이미지 확인"+finalIMG_list);
		
		
		restaurantDAO.restaurantUpdate(map, finalIMG_list, menu_list );
	}

	@Override
	public void restaurant_register_imgs(RestaurantImageDTO restaurantImageDTO) {
		restaurantDAO.restaurant_register_imgs(restaurantImageDTO);
		
	}

	//List for Home 
	@Override
	public List<RestaurantListDTO> restaurantHomeList() {
		return restaurantDAO.restaurantHomeList();
	}
	//List for restaurantList
	@Override
	public List<RestaurantListDTO> restaurantList(String pg) {
		//1페이지당 5개씩
		
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<RestaurantListDTO> list = restaurantDAO.restaurantList(map);

		return list;
	}

	//List total
	@Override
	public RestaurantPaging restaurantListPaging(String pg) {
		int totalA = restaurantDAO.getRestaurantTotalA();//총글수
		System.out.println(totalA);
		restaurantPaging.setCurrentPage(Integer.parseInt(pg));
		restaurantPaging.setPageBlock(3);
		restaurantPaging.setPageSize(5);
		restaurantPaging.setTotalA(totalA);
		restaurantPaging.makePagingHTML();
		return restaurantPaging;
	}

	//Search List
	@Override
	public List<RestaurantListDTO> restaurantSearchList(Map<String, String> map) {
		//1페이지당 5개씩
		System.out.println("pg 값 확인========="+map.get("pg"));
		System.out.println("pg="+map.get("pg"));
		int endNum = Integer.parseInt( map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");

		return restaurantDAO.restaurantSearchList(map);
	}
	//Search list total
	@Override	
	public RestaurantPaging restaurantSearchListPaging(Map<String, String> map) {
		int totalA = restaurantDAO.getRestaurantSearchTotalA(map);//총글수
		System.out.println("SearchtotalA:"+totalA);
		System.out.println("searchOption: "+map.get("searchOption"));
		System.out.println("searchText: "+map.get("searchText"));
		System.out.println("vegan: "+map.get("vegan"));
		
		restaurantPaging.setSearchOption(map.get("searchOption"));
		restaurantPaging.setSearchText(map.get("searchText"));
		restaurantPaging.setVegan(map.get("vegan"));
		
		restaurantPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		restaurantPaging.setPageBlock(3);
		restaurantPaging.setPageSize(5);
		restaurantPaging.setTotalA(totalA);
		restaurantPaging.makePagingHTML();
		return restaurantPaging;
	}
	
	public int getResSeq(String company_num) {
		return restaurantDAO.getResSeq(company_num);
	}

	@Override
	public void restaurant_register_info(RestaurantDTO restaurantDTO) {
		restaurantDAO.restaurant_register_info(restaurantDTO);
		
	}

	@Override
	public void reservation(Map<String, String> map) {
		restaurantDAO.reservation(map);
	}

	@Override
	public void reservation2(Map<String, String> map) {
		restaurantDAO.reservation2(map);
	}

	@Override
	public void reservation3(Map<String, String> map) {
		restaurantDAO.reservation3(map);
	}

	public List<RestaurantImageDTO> restaurantImgList() {
	 return restaurantDAO.restaurantImgList();
	}

	@Override
	public RestaurantDTO getRestaurantAllInfo(String seq_restaurant) {
		return restaurantDAO.getRestaurantAllInfo(seq_restaurant);
	}

	@Override
	public int getStarValue(String seq_restaurant) {
		return restaurantDAO.getStarValue(seq_restaurant);
	}



	@Override
	public String getResSeqWithMemberSeq(int seq_member) {
		return restaurantDAO.getResSeqWithMemberSeq(seq_member);
	}

	@Override
	public RestaurantInfoDTO restaurantInfo(String seq_restaurant) {
		return restaurantDAO.restaurantInfo(seq_restaurant);
	}

	@Override
	public List<RestaurantMenuDTO> restaurantMenu(String seq_restaurant) {
		return restaurantDAO.restaurantMenu(seq_restaurant);
	}

	@Override
	public List<RestaurantImageDTO> restaurantImage(String seq_restaurant) {
		return restaurantDAO.restaurantImage(seq_restaurant);
	}

	@Override
	public RestaurantOwnerDTO verifyResOwner(String seq_restaurant) {
		return restaurantDAO.verifyResOwner(seq_restaurant);
	}

	@Override
	public List<RestaurantReviewDTOWithName> restaurantReview(String seq_restaurant) {
		return restaurantDAO.restaurantReview(seq_restaurant);
	}

	@Override
	public void getIntoBasket(Map<String, String> map) {
		restaurantDAO.getIntoBasket(map);
		
	}

	@Override
	public int cancelReservation(Map<String, String> map) {
		return restaurantDAO.cancelReservation(map);
	}

	@Override
	public void cancelReservation2(Map<String, String> map) {
		restaurantDAO.cancelReservation2(map);
	}
	
	@Override
	public void reviewRegister(RestaurantReviewDTO restaurantReviewDTO) {
		restaurantDAO.reviewRegister(restaurantReviewDTO);
		
	}

	@Override
	public void reviewImgRegister(RestaurantReviewImageDTO restaurantReviewImageDTO) {
		restaurantDAO.reviewImgRegister(restaurantReviewImageDTO);
	}

	@Override
	public int getReviewSeq(int seq_member) {
		return restaurantDAO.getReviewSeq(seq_member);
		
	}

	@Override
	public List<RestaurantReviewImageDTO> getRestaurantReviewImage(String seq_restaurant) {
		System.out.println("도착");
		System.out.println(seq_restaurant);
		return restaurantDAO.getRestaurantReviewImage(seq_restaurant);
	}

	@Override
	public String hasRestaurant(String id) {
		return restaurantDAO.hasRestaurant(id);
	}

	@Override
	public RestaurantReserved visitCheckYes1(Map<String, String> map) {
		return restaurantDAO.visitCheckYes1(map);
	}

	@Override
	public void visitCheckYes2(Map<String, String> map) {
		restaurantDAO.visitCheckYes2(map);
	}

	@Override
	public void visitCheckYes3(RestaurantReserved reserved) {
		restaurantDAO.visitCheckYes3(reserved);
	}

	@Override
	public void visitCheckNo(Map<String, String> map) {
		restaurantDAO.visitCheckNo(map);
	}

	@Override
	public MemberDTO reservationCheck(Map<String, String> map) {
		return restaurantDAO.reservationCheck(map);
	}

	@Override
	public String acceptCheck(Map<String, Integer> map) {
		return restaurantDAO.acceptCheck(map);
	}

	/*
	 * @Override public void doReserve(Map<String, Integer> map) {
	 * restaurantDAO.doReserve(map); }
	 */

	@Override
	public void reservation4(Map<String, String> map) {
		restaurantDAO.reservation4(map);
		
	}


}
