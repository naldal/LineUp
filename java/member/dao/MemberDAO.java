package member.dao;

import java.util.List; 
import java.util.Map;

import member.bean.MemberDTO;
import qna.bean.QnaDTO;
import reservation.bean.ReservationDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantVisitedDTO;


public interface MemberDAO {

	public void enter_register(MemberDTO memberDTO);

	public MemberDTO login(String id);

	public void individual_register(MemberDTO memberDTO);

	public MemberDTO loginCheck(String id);

	public MemberDTO loginCheckIndi(String nickname);

	public void deleteMember(String id);

	public void verifyMember(String id);

	public void userModify(Map<String, String> map);

	public MemberDTO getUser(Map<String, String> map);

	public List<RestaurantDTO> getBasketList(String id);

	public List<QnaDTO> getQnaList(String id);

	public List<RestaurantReviewDTO> getReviewList(String id);

	public List<RestaurantDTO> getMyReservation(String id);

	public void QnaWrite(QnaDTO qnaDTO); 

	public List<RestaurantVisitedDTO> getVisitedList(String id);

	public void reviewWrite(RestaurantReviewDTO restaurantReviewDTO);

	public void reviewImageWrite(RestaurantReviewImageDTO restaurantReviewImageDTO);

	public List<RestaurantReviewImageDTO> getReviewImageList(String id);

	public List<QnaDTO> getQnaFormList(Map<String,Object> map);

	public int getListCnt(Map<String,Object> map);

	public QnaDTO getQnaView(int seq);

	public void qnaDelete(int seq);

	public void qnaReply(Map<String, Object> map);

	public int getReviewSeq(int seq_member);

	public List<QnaDTO> searchQnaList(Map<String, Object> map);

	public int getSearchListCnt(Map<String,Object> map); 

	public ReservationDTO hadReserved(Map<String, Integer> map);

	public void cancelBasket(Map<String, String> map);

	public MemberDTO getAdmin(String admin);

	public int isBlack(String id); 

}
