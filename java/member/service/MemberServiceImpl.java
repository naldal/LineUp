package member.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import member.bean.MemberDTO;
import member.bean.TempKey;
import member.controller.EmailHandler;
import member.dao.MemberDAO;
import qna.bean.QnaDTO;
import qna.bean.QnaPaging;
import reservation.bean.ReservationDTO;
import restaurant.bean.RestaurantDTO;


import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantVisitedDTO;
import restaurant.dao.RestaurantDAO;


@Service(value="memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	RestaurantDAO restaurantDAO;
	
	@Autowired
	QnaPaging qnaPaging;
	
	@Override
	public void enter_register(MemberDTO memberDTO) {
		memberDAO.enter_register(memberDTO);
	}

	@Override
	public void individaul_register(MemberDTO memberDTO) {
		
		memberDAO.individual_register(memberDTO);
	}

	@Override
	public MemberDTO login(String id) {
		return memberDAO.login(id);
	}



	@Override
	public MemberDTO loginCheck(String id) {
		return memberDAO.loginCheck(id);
	}

	@Override
	public MemberDTO loginCheckIndi(String nickname) {
		return memberDAO.loginCheckIndi(nickname);
	}

	@Override
	public void deleteMember(String id) {
		memberDAO.deleteMember(id);	
	}


	@Override
	public void verifyMember(String id) {
		 memberDAO.verifyMember(id);	
		
	}

	@Override
	public void userModify(Map<String, String> map) {
		memberDAO.userModify(map);
	}

	@Override
	public MemberDTO getUser(Map<String, String> map) {
		return memberDAO.getUser(map);
	}

	@Override
	public List<RestaurantDTO> getBasketList(String id) {
		return memberDAO.getBasketList(id);
	}

	@Override
	public List<QnaDTO> getQnaList(String id) {
		return memberDAO.getQnaList(id);
	}
	
	@Override
	public String confirm_password(String pwd, MemberDTO memberDTO, BCryptPasswordEncoder pwdEncoder) {
		if(pwdEncoder.matches(pwd, memberDTO.getPwd())) {
			restaurantDAO.restaurantDelete(memberDTO);
			return "true";
		}else
			return "false";
	}

	@Override
	public List<RestaurantReviewDTO> getReviewList(String id) {
		return memberDAO.getReviewList(id);
	}

	@Override
	public List<RestaurantDTO> getMyReservation(String id) {
		return memberDAO.getMyReservation(id);
	}

	@Override
	public void qnaWrite(QnaDTO qnaDTO, List<MultipartFile> list) {
		if(!list.isEmpty()) {
			String filePath = "//192.168.0.14/qna_img";
			String imgs="";
			for(MultipartFile img : list) {
				String fileName = img.getOriginalFilename();
				File file = new File(filePath, fileName);
				try {
					FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}
				imgs= imgs+fileName+"/";
			}
			qnaDTO.setImg(imgs);
		}else {
			qnaDTO.setImg("null");
		}
		memberDAO.QnaWrite(qnaDTO);
	}

	public List<RestaurantVisitedDTO> getVisitedList(String id) {
		return memberDAO.getVisitedList(id);
	}

	@Override
	public void reviewWrite(RestaurantReviewDTO restaurantReviewDTO) {
		memberDAO.reviewWrite(restaurantReviewDTO);
		
	}

	@Override
	public void reviewImageWrite(RestaurantReviewImageDTO restaurantReviewImageDTO) {
		memberDAO.reviewImageWrite(restaurantReviewImageDTO);
	}

	@Override
	public List<RestaurantReviewImageDTO> getReviewImageList(String id) {
		return memberDAO.getReviewImageList(id);

	}

	@Override
	public List<QnaDTO> getQnaFormList(int pg, Map<String,Object> map) {
		int endNum = pg*5;
		int startNum = endNum-4;
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		List<QnaDTO> list = memberDAO.getQnaFormList(map);
		
		return list;
	}

	@Override
	public QnaPaging getPaging(Map<String,Object> map) {
		int pg = Integer.parseInt(map.get("pg")+"");
		int listCnt = memberDAO.getListCnt(map);
		qnaPaging.setCurrentPage(pg);
		qnaPaging.setPageBlock(3);
		qnaPaging.setPageSize(5);
		qnaPaging.setTotalA(listCnt);
		qnaPaging.makePagingHTML();
		return qnaPaging;
	}

	@Override
	public QnaDTO getQnaView(int seq) {
		return memberDAO.getQnaView(seq);
	}

	@Override
	public void qnaDelete(int seq) {
		memberDAO.qnaDelete(seq);
	}

	@Override
	public void qnaReply(String reply, int seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("reply", reply);
		memberDAO.qnaReply(map);
	}
	@Override
	public int getReviewSeq(int seq_member) {
		return memberDAO.getReviewSeq(seq_member);
	}

	@Override
	public List<QnaDTO> searchQnaList(Map<String, Object> map) {
		int endNum = (Integer.parseInt((map.get("pg")+"")))*5;
		int startNum = endNum-4;
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		List<QnaDTO> list = memberDAO.searchQnaList(map);
		
		return list;
	}

	@Override
	public QnaPaging getSearchPaging(Map<String,Object> map) {
		int searchListCnt = memberDAO.getSearchListCnt(map);
		int pg = Integer.parseInt(map.get("pg")+"");
		qnaPaging.setCurrentPage(pg);
		qnaPaging.setPageBlock(3);
		qnaPaging.setPageSize(5);
		qnaPaging.setTotalA(searchListCnt);
		qnaPaging.makeSearchPagingHTML(map);
		return qnaPaging;
	}
	
	@Override
	public ReservationDTO hadReserved(Map<String, Integer> map) {
		return memberDAO.hadReserved(map);
	}

	@Override
	public void cancelBasket(Map<String, String> map) {
		memberDAO.cancelBasket(map);
	}

	@Override
	public MemberDTO getAdmin(String admin) {
		return memberDAO.getAdmin(admin);
	}

	@Override
	public int isBlack(String id) {
		return memberDAO.isBlack(id);
	}

}
