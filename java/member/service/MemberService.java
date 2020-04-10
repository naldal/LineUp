package member.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import member.bean.MemberDTO;
import qna.bean.QnaDTO;
import qna.bean.QnaPaging;
import reservation.bean.ReservationDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantVisitedDTO;

public interface MemberService {

	public void enter_register(MemberDTO memberDTO);
	
	public void individaul_register(MemberDTO memberDTO);
	
	public MemberDTO login(String id);
	
	public void deleteMember(String id);

	public MemberDTO loginCheck(String id);

	public MemberDTO loginCheckIndi(String nickname);

	public void verifyMember(String id);

	public void userModify(Map<String, String> map);

	public MemberDTO getUser(Map<String, String> map);

	public List<RestaurantDTO> getBasketList(String id);

	public List<QnaDTO> getQnaList(String id);
	
	public String confirm_password(String pwd, MemberDTO attribute, BCryptPasswordEncoder pwdEncoder);

	public List<RestaurantReviewDTO> getReviewList(String id);

	public List<RestaurantDTO> getMyReservation(String id);

	public void qnaWrite(QnaDTO qnaDTO, List<MultipartFile> list);

	public List<RestaurantVisitedDTO> getVisitedList(String id);

	public void reviewWrite(RestaurantReviewDTO restaurantReviewDTO);

	public void reviewImageWrite(RestaurantReviewImageDTO restaurantReviewImageDTO);

	public List<RestaurantReviewImageDTO> getReviewImageList(String id);

	public List<QnaDTO> getQnaFormList(int pg, Map<String,Object> map);

	public QnaPaging getPaging(Map<String,Object> map);

	public QnaDTO getQnaView(int seq);

	public void qnaDelete(int seq);

	public void qnaReply(String reply, int seq);

	public int getReviewSeq(int seq_member);

	public List<QnaDTO> searchQnaList(Map<String, Object> map);

	public QnaPaging getSearchPaging(Map<String,Object> map);

	public ReservationDTO hadReserved(Map<String, Integer> map);

	public void cancelBasket(Map<String, String> map);

	public MemberDTO getAdmin(String admin);

	public int isBlack(String id);


}
