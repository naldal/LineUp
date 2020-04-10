package member.dao;

import java.util.List;
import java.util.Map; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import qna.bean.QnaDTO;
import reservation.bean.ReservationDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantVisitedDTO;

@Repository(value="memberDAO")
@Transactional
public class MemberDAOMybatis implements MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void enter_register(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.enter_register", memberDTO);
	}

	@Override
	public void individual_register(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.individual_register", memberDTO);
	}
	
	@Override
	public MemberDTO login(String id) {
		return sqlSession.selectOne("memberSQL.login", id);
	}


	@Override
	public MemberDTO loginCheck(String id) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.loginCheck", id);
		return memberDTO;
	}

	@Override
	public MemberDTO loginCheckIndi(String nickname) {
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.loginCheckIndi", nickname);
		return memberDTO;
	}

	@Override
	public void deleteMember(String id) {
		sqlSession.delete("memberSQL.deleteMember", id);
	}

	@Override
	public void verifyMember(String id) {
		sqlSession.update("memberSQL.verifyMember",id);		
		
	}

	@Override
	public void userModify(Map<String, String> map) {
		sqlSession.update("memberSQL.userModify", map);
	}

	@Override
	public MemberDTO getUser(Map<String, String> map) {
		String id = map.get("id");
		return sqlSession.selectOne("memberSQL.getUser", id);
	}

	@Override
	public List<RestaurantDTO> getBasketList(String id) {
//		List<RestaurantDTO> list = sqlSession.selectList("memberSQL.getBasketList", id);
//		System.out.println("아이디 = " + id);
//		if(list.size()!=0) {
//			System.out.println("바스케또리스트들옴");
//			System.out.println(list.get(0).getRestaurant_name());
//		} else {
//			System.out.println("안들옴");
//		}
		return sqlSession.selectList("memberSQL.getBasketList", id);
	}

	@Override
	public List<QnaDTO> getQnaList(String id) {
		return sqlSession.selectList("memberSQL.getQnaList", id);
	}

	@Override
	public List<RestaurantReviewDTO> getReviewList(String id) {
		return sqlSession.selectList("memberSQL.getReviewList", id);
	}

	@Override
	public List<RestaurantDTO> getMyReservation(String id) {
		return sqlSession.selectList("memberSQL.getMyReservation", id);
	}

	@Override
	public void QnaWrite(QnaDTO qnaDTO) {
		sqlSession.insert("memberSQL.qnaWrite",qnaDTO);
	}

	public List<RestaurantVisitedDTO> getVisitedList(String id) {
		return sqlSession.selectList("memberSQL.getVisitedList", id);
	}

	@Override
	public void reviewWrite(RestaurantReviewDTO restaurantReviewDTO) {
		sqlSession.insert("memberSQL.reviewWrite", restaurantReviewDTO);
	}

	@Override
	public void reviewImageWrite(RestaurantReviewImageDTO restaurantReviewImageDTO) {
		sqlSession.insert("memberSQL.reviewImageWrite", restaurantReviewImageDTO);
	}

	@Override
	public List<RestaurantReviewImageDTO> getReviewImageList(String id) {
		return sqlSession.selectList("memberSQL.getReviewImageList", id);

	}

	@Override
	public List<QnaDTO> getQnaFormList(Map<String,Object> map) {
		return sqlSession.selectList("memberSQL.getQnaFormList",map);
	}

	@Override
	public int getListCnt(Map<String,Object> map) {
		return sqlSession.selectOne("memberSQL.getListCnt", map);
	}

	@Override
	public QnaDTO getQnaView(int seq) {
		return sqlSession.selectOne("memberSQL.getQnaView",seq);
	}

	@Override
	public void qnaDelete(int seq) {
		sqlSession.delete("memberSQL.qnaDelete",seq);
	}

	@Override
	public void qnaReply(Map<String, Object> map) {
		sqlSession.update("memberSQL.qnaUpdate",map);
	}
	
	@Override
	public int getReviewSeq(int seq_member) {
		return sqlSession.selectOne("memberSQL.getReviewSeq", seq_member);

	}

	@Override
	public List<QnaDTO> searchQnaList(Map<String, Object> map) {
		return sqlSession.selectList("memberSQL.searchQnaList",map);
	}

	@Override
	public int getSearchListCnt(Map<String,Object> map) {
		return sqlSession.selectOne("memberSQL.getSearchListCnt",map);
	}

	@Override
	public ReservationDTO hadReserved(Map<String, Integer> map) {
		return sqlSession.selectOne("memberSQL.hadReserved", map);
	}

	@Override
	public void cancelBasket(Map<String, String> map) {
		sqlSession.delete("memberSQL.cancelBasket", map);
	}

	@Override
	public MemberDTO getAdmin(String admin) {
		return sqlSession.selectOne("memberSQL.getAdmin", admin);
	}

	@Override
	public int isBlack(String id) {
		return sqlSession.selectOne("memberSQL.isBlack", id);
	}

}
