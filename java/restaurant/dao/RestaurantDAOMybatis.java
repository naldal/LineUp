package restaurant.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import reservation.bean.ReservationDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantInfoDTO;
import restaurant.bean.RestaurantImageDTO;
import restaurant.bean.RestaurantListDTO;
import restaurant.bean.RestaurantMenuDTO;
import restaurant.bean.RestaurantOwnerDTO;
import restaurant.bean.RestaurantReserved;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewDTOWithName;
import restaurant.bean.RestaurantReviewImageDTO;

@Repository(value="restaurantDAO")
@Transactional
public class RestaurantDAOMybatis implements RestaurantDAO{
	@Autowired
	private SqlSession sqlSession; 
	
	
	//가게정보 화면에 뿌려주기
	@Override
	public Map<String, Object> getStoreInformationManagement(String company_num, String date) {
		//가게정보 가져오기
		RestaurantDTO restaurantDTO = sqlSession.selectOne("restaurantSQL.getStoreInformationManagement_info",company_num);
		//가게 이미지 가져오기
		List<RestaurantImageDTO> restaurantImgList = sqlSession.selectList("restaurantSQL.getStoreInformationManagement_image", restaurantDTO.getSeq_restaurant());

		//가게 메뉴 가져오기
		List<RestaurantMenuDTO> menuList = sqlSession.selectList("restaurantSQL.getStoreInformationManagement_menu",restaurantDTO.getSeq_restaurant());
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("date", date);
		infoMap.put("seq_restaurant", restaurantDTO.getSeq_restaurant());
		//가게 예약리스트 가져오기
		List<ReservationDTO> reservationList = sqlSession.selectList("restaurantSQL.getStoreInformationManagement_reservation",infoMap);
		List<ReservationDTO> reservedList = sqlSession.selectList("restaurantSQL.getReservedRestaurantList",infoMap);
		//가게 리뷰리스트 가져오기
		List<RestaurantReviewDTO> reviewList = sqlSession.selectList("restaurantSQL.getStoreInformationManagement_reviewList",restaurantDTO.getSeq_restaurant());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantDTO", restaurantDTO);
		map.put("restaurantImgList", restaurantImgList);
		map.put("restaurantMenuList", menuList);
		map.put("reservationList", reservationList);
		map.put("reservedList", reservedList);
		map.put("reviewList", reviewList);
		System.out.println(" 최종맵"+map);
		return map;
		
	}
	
	
	//가게 예약리스트 날짜 변동시 화면에 뿌려주기 
	@Override
	public Map<String, Object> getReservationList(String company_num, String date) {
		//오늘정보
		//가게 seq번호 가져오기
		System.out.println("같은날들어온다");
		String seq_restaurant = sqlSession.selectOne("restaurantSQL.getRestaurantSeq",company_num);
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("date", date);
		infoMap.put("seq_restaurant", seq_restaurant);
		System.out.println(infoMap);
		//가게 예약리스트 가져오기
		List<ReservationDTO> reservationList = sqlSession.selectList("restaurantSQL.getStoreInformationManagement_reservation",infoMap);
		List<ReservationDTO> reservedList = sqlSession.selectList("restaurantSQL.getReservedRestaurantList",infoMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationList", reservationList);
		map.put("reservedList", reservedList);
		System.out.println(map);
		return map;
	}

	//가게정보 수정 (이미지 미구현)
	@Override
	public void restaurantUpdate(Map<String, Object> map, List<RestaurantImageDTO> finalIMG_list, List<RestaurantMenuDTO> menu_list) {
		
		System.out.println(map);
		System.out.println(finalIMG_list);
		
		sqlSession.update("restaurantSQL.restaurantUpdate", map);
		sqlSession.delete("restaurantSQL.restaurantMenuDelete", map.get("seq_restaurant"));
		sqlSession.insert("restaurantSQL.restaurantMenuUpdate", menu_list);
		
		//지금 상태는 이미지 다 삭제되고 finalIMG_list 에 모든 정보가 있는 상태이다
		for(RestaurantImageDTO imgDTO : finalIMG_list) {
			sqlSession.insert("restaurantSQL.restaurantImageInsert", imgDTO);
		}
	}

	@Override
	public void restaurant_register_imgs(RestaurantImageDTO restaurantImageDTO) {
		sqlSession.insert("restaurantSQL.restaurant_register_imgs", restaurantImageDTO);
		
	}

	@Override
	public List<RestaurantDTO> todayRestaurant() {
		return sqlSession.selectList("restaurantSQL.todayRestaurant");
	}
	
	//레스토랑 리스트 페이징
	@Override
	public List<RestaurantListDTO> restaurantList(Map<String, Integer> map) {
		List<RestaurantListDTO> list = sqlSession.selectList("restaurantSQL.restaurantList", map);
		for(RestaurantListDTO restaurantListDTO: list) {
			String seq = restaurantListDTO.getSeq_restaurant();
			int cnt = sqlSession.selectOne("restaurantSQL.restaurantScoreCount", seq);
			if(cnt!=0) {
				int score = Integer.parseInt(restaurantListDTO.getScore())/cnt;
				restaurantListDTO.setScore(score+"");
			}
		}
		return list;
	}
	
	//레스토랑 리스트 총글수
	@Override
	public int getRestaurantTotalA() {
		return sqlSession.selectOne("restaurantSQL.getRestaurantTotalA");

	}
	
	//레스토랑 서치 -> 리스트 페이징
	@Override
	public List<RestaurantListDTO> restaurantSearchList(Map<String, String> map) {
		if(map.get("searchOption") == null) return null;
		List<RestaurantListDTO> list = sqlSession.selectList("restaurantSQL.restaurantSearchList", map);
		for(RestaurantListDTO restaurantListDTO : list) {
			int count = sqlSession.selectOne("restaurantSQL.restaurantScoreCount", restaurantListDTO.getSeq_restaurant());
			if(count!=0) {
				restaurantListDTO.setScore((Integer.parseInt(restaurantListDTO.getScore())/count)+"");
			}
		}
		System.out.println("list = " + list.get(0).getCategory()+","+list.get(0).getAddr());
		return list;
	}

	public int getResSeq(String company_num) {
		return sqlSession.selectOne("restaurantSQL.getResSeq", company_num);
	}

	@Override
	public void restaurantRegister(List<RestaurantMenuDTO> list) {
		sqlSession.insert("restaurantSQL.restaurantRegister", list);
		
	}

	@Override
	public void restaurant_register_info(RestaurantDTO restaurantDTO) {
		sqlSession.insert("restaurantSQL.restaurant_register_info", restaurantDTO);
		
	}

	//레스토랑 이미지 리스트
	@Override
	public List<RestaurantImageDTO> restaurantImgList() {
		return sqlSession.selectList("restaurantSQL.restaurantImgList");
	}

	//사업자번호로 레스토랑 시퀀스번호 가져오기
	@Override
	public String getRestaurantSeq(String company_num) {
		return sqlSession.selectOne("restaurantSQL.getRestaurantSeq",company_num);
	}

	//레스토랑 삭제
	@Override
	public void restaurantDelete(MemberDTO memberDTO) {
		String restaurant_seq = sqlSession.selectOne("restaurantSQL.getRestaurantSeq",memberDTO.getCompany_num()+"");
		sqlSession.delete("restaurantSQL.restaurantDelete",restaurant_seq);
	}


	@Override
	public void reservation(Map<String, String> map) {
		sqlSession.insert("restaurantSQL.reservation", map);
	}
	
	public List<RestaurantListDTO> restaurantHomeList() {
		return sqlSession.selectList("restaurantSQL.restaurantHomeList");
	}

	public RestaurantDTO getRestaurantAllInfo(String seq_restaurant) {
		return sqlSession.selectOne("restaurantSQL.getRestaurantAllInfo", seq_restaurant);
	}

	@Override
	public int getStarValue(String seq_restaurant) {
		return sqlSession.selectOne("restaurantSQL.getStarValue", seq_restaurant);
	}

	@Override
	public String getResSeqWithMemberSeq(int seq_member) {
		return sqlSession.selectOne("restaurantSQL.getResSeqWithMemberSeq", seq_member);
	}


	@Override
	public RestaurantInfoDTO restaurantInfo(String seq_restaurant) {
		return sqlSession.selectOne("restaurantSQL.restaurantInfo", seq_restaurant);
	}


	@Override
	public List<RestaurantMenuDTO> restaurantMenu(String seq_restaurant) {
		return sqlSession.selectList("restaurantSQL.restaurantMenu", seq_restaurant);
	}


	@Override
	public void reservation2(Map<String, String> map) {
		sqlSession.delete("restaurantSQL.reservation2", map);
	}


	@Override
	public void reservation3(Map<String, String> map) {
		sqlSession.update("restaurantSQL.reservation3", map);
	}
	
	@Override
	public List<RestaurantImageDTO> restaurantImage(String seq_restaurant) {
		return sqlSession.selectList("restaurantSQL.restaurantImage", seq_restaurant);
	}

	@Override
	public List<RestaurantReviewDTOWithName> restaurantReview(String seq_restaurant) {
		return sqlSession.selectList("restaurantSQL.restaurantReview", seq_restaurant);
	}

	@Override
	public RestaurantOwnerDTO verifyResOwner(String seq_restaurant) {
		return sqlSession.selectOne("restaurantSQL.verifyResOwner", seq_restaurant);
	}


	@Override
	public int getRestaurantSearchTotalA(Map<String, String> map) {
		//if(map.get("searchOption") == null) return 0;
		
		return sqlSession.selectOne("restaurantSQL.getRestaurantSearchTotalA",map);
	}


	public void getIntoBasket(Map<String, String> map) {
		sqlSession.insert("restaurantSQL.getIntoBasket", map);
		
	}
	
	@Override
	public void reviewRegister(RestaurantReviewDTO restaurantReviewDTO) {
		sqlSession.insert("restaurantSQL.reviewRegister", restaurantReviewDTO);
	}

	@Override
	public void reviewImgRegister(RestaurantReviewImageDTO restaurantReviewImageDTO) {
		sqlSession.insert("restaurantSQL.reviewImgRegister", restaurantReviewImageDTO);
	}


	@Override
	public int cancelReservation(Map<String, String> map) {
		return sqlSession.delete("restaurantSQL.cancelReservation", map);
	}


	@Override
	public void cancelReservation2(Map<String, String> map) {
		sqlSession.update("restaurantSQL.cancelReservation2", map);
	}


	@Override
	public int getReviewSeq(int seq_member) {
		return sqlSession.selectOne("restaurantSQL.getReviewSeq", seq_member);
	}


	@Override
	public List<RestaurantReviewImageDTO> getRestaurantReviewImage(String seq_restaurant) {
		System.out.println(seq_restaurant);
		return sqlSession.selectList("restaurantSQL.getRestaurantReviewImage", seq_restaurant);
	}


	@Override
	public String hasRestaurant(String id) {
		return sqlSession.selectOne("restaurantSQL.hasRestaurant", id);
	}


	@Override
	public RestaurantReserved visitCheckYes1(Map<String, String> map) {
		System.out.println("yes1");
		return sqlSession.selectOne("restaurantSQL.visitCheckYes1", map);
	}


	@Override
	public void visitCheckYes2(Map<String, String> map) {
		System.out.println("yes2");
		sqlSession.delete("restaurantSQL.visitCheckYes2", map);
	}


	@Override
	public void visitCheckYes3(RestaurantReserved reserved) {
		System.out.println("yes3");
		sqlSession.insert("restaurantSQL.visitCheckYes3", reserved);
	}


	@Override
	public void visitCheckNo(Map<String, String> map) {
		sqlSession.delete("restaurantSQL.visitCheckNo", map);
	}


	@Override
	public MemberDTO reservationCheck(Map<String, String> map) {
		return sqlSession.selectOne("restaurantSQL.reservationCheck", map);
	}

	@Override
	public Map<String, Object> getReservedRestaurantList(String company_num, String date) {
		//다녀온식당 출력
		//가게 seq번호 가져오기
		String seq_restaurant = sqlSession.selectOne("restaurantSQL.getRestaurantSeq",company_num);
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("date", date);
		infoMap.put("seq_restaurant", seq_restaurant);
		System.out.println(infoMap);
		//가게 예약리스트 가져오기
		List<ReservationDTO> reservationList = sqlSession.selectList("restaurantSQL.getReservedRestaurantList",infoMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationList", reservationList);
		System.out.println(map);
		System.out.println("도착");
		return map;
	}


	@Override
	public String acceptCheck(Map<String, Integer> map) {
		return sqlSession.selectOne("restaurantSQL.acceptCheck", map);
	}


	/*
	 * @Override public void doReserve(Map<String, Integer> map) {
	 * sqlSession.insert("restaurantSQL.doReserve", map); }
	 */


	@Override
	public void reservation4(Map<String, String> map) {
		sqlSession.update("restaurantSQL.reservation4", map);
		
	}


	@Override
	public String getRestaurantMainIMAGE(String seq_restaurant) {
		return sqlSession.selectOne("restaurantSQL.getRestaurantMainIMAGE",seq_restaurant);
	}


	@Override
	public void deleteRestaurantIMAGE(String seq_restaurant) {
		sqlSession.delete("restaurantSQL.deleteRestaurantIMAGE",seq_restaurant);
	}





}
