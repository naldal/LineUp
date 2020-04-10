package member.controller;

import java.io.File; 
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import member.bean.MemberDTO;
import member.service.MemberService;
import qna.bean.QnaDTO;
import qna.bean.QnaPaging;
import reservation.bean.ReservationDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.bean.RestaurantVisitedDTO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	private JavaMailSender mailSender; 
	@Inject
	BCryptPasswordEncoder pwdEncoder;

//	회원가입 분기점
	@RequestMapping("/signUpBtns")
	public String signUpBtns() {
		return "/member/signUpBtns";
	}
	
//	사업자 회원가입 창
	@RequestMapping("/signUp_Enterprise")
	public String signUp_Enterprise() {
		return "/member/signUp_Enterprise";
	}

//	개인 회원가입 창
	@RequestMapping("/signUp_individual")
	public String signUp_individual() {
		System.out.println("signup inddddi");
		return "/member/signUp_individual";
	}

//	기업 회원가입 기능
	@RequestMapping(value = "/enter_register", method = RequestMethod.POST)
	@ResponseBody
	public void enter_register(MemberDTO memberDTO, HttpServletResponse response) throws MessagingException {
	
		int isBlaackCount = memberService.isBlack(memberDTO.getId());
		boolean isBlack = true;
		if(isBlaackCount==1) {
			isBlack = true;
		} else if (isBlaackCount==0) {
			isBlack = false;
		}
		
		if(!isBlack) { //블랙리스트가 아니라면

			String pwd = memberDTO.getPwd();
			String encodedPwd = pwdEncoder.encode(pwd);
			memberDTO.setPwd(encodedPwd);
			System.out.println("비밀번호 암호화 완료");
			memberService.enter_register(memberDTO);
			System.out.println("enterprise register success.");
			// mail 작성 관련
					try {
						EmailHandler sendMail = new EmailHandler(mailSender);
						sendMail.setSubject("[LineUp] 회원가입 이메일 인증");
						sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
								.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
								.append("<a href='http://localhost:8080/LineUp/member/signSuccess.jsp?id=")
								.append(memberDTO.getId())
								.append("' target='_blenk'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("l.seongryeong@gmail.com", "LineUp Company");
						sendMail.setTo(memberDTO.getId());
						sendMail.send();
						
						System.out.println(memberDTO.getId());
					} catch (MessagingException e) {
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
		} else { //블랙리스트에 있다면 
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			response.setContentType("text/html, charset=UTF-8");
			out.println("<script language='javaxcript'>");
			out.println("alert('블랙회원입니다')");
			out.println("</script>");
			out.flush();
			
		}
	}

//	기업회원 중복확인	
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	@ResponseBody
	public String loginCheck(String id) {
		MemberDTO memberDTO = memberService.loginCheck(id);
		if(memberDTO != null) {
			String result = "exist";
			return result;
		} else {
			String result = "non_exist";
			return result;
		}
	}
	
	//Mail 인증
	@RequestMapping(value="/signSuccess", method=RequestMethod.GET)
	public String signSuccess(@RequestParam String id) {
		System.out.println("이메일 인증 처리");
		
		memberService.verifyMember(id);
		
		return "/member/signSuccess";
	}
	
	@RequestMapping(value="/loginCheckIndi", method=RequestMethod.POST)
	@ResponseBody
	public String loginCheckIndi(@RequestParam String nickname) {
		MemberDTO memberDTO = memberService.loginCheckIndi(nickname);
		//System.out.println(memberDTO);
		if(memberDTO != null) {
			String result = "exist";
			return result;
		} else {
			String result = "non_exist";
			return result;
		}
	}
	

//	개인 회원가입 기능
	@RequestMapping(value = "/individual_register", method = RequestMethod.POST)
	@ResponseBody
	public void individual_register(MemberDTO memberDTO, HttpServletResponse response) {
		

		int isBlaackCount = memberService.isBlack(memberDTO.getId());
		boolean isBlack = true;
		if(isBlaackCount==1) {
			isBlack = true;
		} else if (isBlaackCount==0) {
			isBlack = false;
		}

		
		if(isBlack) { //블랙리스트가 아니라면
			String pwd = memberDTO.getPwd();
			String encodedPwd = pwdEncoder.encode(pwd);
			memberDTO.setPwd(encodedPwd);
			
			memberService.individaul_register(memberDTO);
	
			// mail 보내기
			try {
				EmailHandler sendMail = new EmailHandler(mailSender);
				sendMail.setSubject("[LineUp] 회원가입 이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
						.append("<a href='http://localhost:8080/LineUp/member/signSuccess.jsp?id=")
						.append(memberDTO.getId())
						.append("' target='_blenk'>이메일 인증 확인</a>").toString());
				sendMail.setFrom("l.seongryeong@gmail.com", "LineUp Company");
				sendMail.setTo(memberDTO.getId());
				sendMail.send();
				
				System.out.println(memberDTO.getId());
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else { //블랙리스트에 있다면 
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			response.setContentType("text/html, charset=UTF-8");
			out.println("<script language='javaxcript'>");
			out.println("alert('블랙회원입니다')");
			out.println("</script>");
			out.flush();
			
		}
	}

//	로그인 폼
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}

//	로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam Map<String, String> map, HttpSession session) {

		MemberDTO memberDTO = memberService.login(map.get("id"));
		System.out.println("차차차차차 = " + memberDTO.getStore_exist());
		String loginResult = null;
		boolean pwdMatch = false;
		
		try {
			pwdMatch = pwdEncoder.matches(map.get("pwd"), memberDTO.getPwd()); //회원이 입력한 비밀번호와 DB에 암호화되어있는 비밀번호를 디코드 시켜서 매칭시킨다. 일치하면 true.
		} catch (NullPointerException e) {
			loginResult = "fail";
		}

		
		if(memberDTO != null && pwdMatch) {
			if(memberDTO.getAuthStatus() == "0") {
				loginResult = "email_confirm";
				loginResult = "emailCheckRequired";
			} else {
				session.setAttribute("memDTO", memberDTO);
				session.setAttribute("memDTO_seq", memberDTO.getSeq_member());
				loginResult = "success";
			}
		} else {
			loginResult = "fail";
		}
		
		//관리자계정
		if(loginResult.equals("fail")) {
			if(map.get("pwd").equals("admin") && map.get("id").equals("admin")) {
				memberDTO = memberService.getAdmin("admin");
				session.setAttribute("memDTO", memberDTO);
				session.setAttribute("memDTO_seq", memberDTO.getSeq_member());
				loginResult = "success";				
			} else {
				loginResult = "fail";
			}
		}
		return loginResult;
	}

//	로그아웃 기능
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String login(HttpSession session) {
		session.removeAttribute("memDTO");

		return "/home/index";
	}

// 이메일 인증 기능
	@RequestMapping(value = "/email_confirm", method=RequestMethod.GET)
	@ResponseBody
	public String email_confirm() {
		return "/member/email_confirm";
	}

		
//마이페이지 (개인) 이동
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public String myPageIndividual() {
		return "/member/myPage";
	}
	
//마이페이지 (개인) 정보뿌리기
	@RequestMapping(value="getMyPage", method=RequestMethod.POST)
	public ModelAndView getMyPage(@RequestParam String id) {
		
		List<RestaurantDTO> basketList = memberService.getBasketList(id);
		List<QnaDTO> qnaList = memberService.getQnaList(id);
		List<RestaurantReviewDTO> reviewList = memberService.getReviewList(id);
		List<RestaurantDTO> myReservation = memberService.getMyReservation(id);
		List<RestaurantVisitedDTO> visitedList = memberService.getVisitedList(id);
		List<RestaurantReviewImageDTO> reviewImageList = memberService.getReviewImageList(id);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("basketList", basketList);
		mav.addObject("qnaList", qnaList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("myReservation", myReservation);
		mav.addObject("visitedList", visitedList);
		mav.addObject("reviewImageList", reviewImageList);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
//마이페이지 개인회원 정보수정
	@RequestMapping(value="userModify", method=RequestMethod.POST)
	@ResponseBody
	public String userModify(@RequestParam Map<String, String> map, HttpSession session) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		boolean pwdMacth = pwdEncoder.matches(map.get("beforePwd"), memberDTO.getPwd());
		
		String result= "fail";
		
		if(pwdMacth) {
			String encodePwd = pwdEncoder.encode(map.get("pwd"));
			map.replace("pwd", encodePwd);
			memberService.userModify(map);
			result = "success";
			
			memberDTO = memberService.getUser(map);
			session.setAttribute("memDTO", memberDTO);
		} 
		
		return result;
	}
	
	
//	회원탈퇴 기능
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	@ResponseBody
	public String memberDelete(@RequestParam Map<String, String> map, HttpSession session) {
		String result="fail";
//		String reservation="x";
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		
		boolean pwdMatch = pwdEncoder.matches(map.get("pwdInput"), memberDTO.getPwd());
		/* 가게예약 남아있을시 사업자 탈퇴 거르는 부분, 
		 * 예약 기능 구축되면 다시 실시
		 * if(memberDTO.getPosition()=="ENTERPRISE") {
		 * 
		 * }
		 */
		
		if(pwdMatch) {
			String id = map.get("id");
			memberService.deleteMember(id);
			result="success";
			session.invalidate();
		}
		
		return result;	
	}
	//가게삭제시 비밀번호 확인
	@RequestMapping(value = "confirm_password", method=RequestMethod.POST)
	@ResponseBody
	public String confirm_password(@RequestParam String pwd, HttpSession session) {
		String deleteCheck = memberService.confirm_password(pwd,(MemberDTO)session.getAttribute("memDTO"),pwdEncoder);
		if(deleteCheck=="true") {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memDTO");
			memberDTO.setStore_exist(null);
			session.setAttribute("memDTO", memberDTO);
		}
		
		return deleteCheck;
	}
	
	
	//qna질문 작성
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	@ResponseBody
	public String qnaWrite(@RequestParam Map<String,Object> map,@RequestParam("imgs") List<MultipartFile> list, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("memDTO")==null) {
			System.out.println("여기서 끝?");
			return "false";
		}
		
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setCategory_qna(map.get("category")+"");
		qnaDTO.setSubject_qna(map.get("subject_qna")+"");
		qnaDTO.setContent_qna(map.get("content_qna")+"");
		qnaDTO.setSecret((map.get("secret")+"").equals("true") ? "1":"0");
		qnaDTO.setMember_id(((MemberDTO)session.getAttribute("memDTO")).getId());
		qnaDTO.setSeq_member(((MemberDTO)session.getAttribute("memDTO")).getSeq_member());
		memberService.qnaWrite( qnaDTO, list);
		return "true";
	}

	//리뷰 등록
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	@ResponseBody
	public void reviewWrite(@ModelAttribute RestaurantReviewDTO restaurantReviewDTO,
							@RequestParam("img[]") List<MultipartFile> list,
							HttpSession session) {
		String filePath = "//192.168.0.14/review_img/";
		String name="";
		
		
		RestaurantReviewImageDTO restaurantReviewImageDTO = new RestaurantReviewImageDTO();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		
		if(memberDTO.getNickname()==null) {
			name = memberDTO.getReal_name();
		} else if(memberDTO.getReal_name()==null) {
			name = memberDTO.getNickname();
		}
		
		restaurantReviewDTO.setName(name);
		restaurantReviewDTO.setId(memberDTO.getId());
		restaurantReviewDTO.setSeq_member(memberDTO.getSeq_member());

		memberService.reviewWrite(restaurantReviewDTO);
		
		int seq_review = memberService.getReviewSeq(memberDTO.getSeq_member());
		System.out.println("리뷰 번호 입니다 = " + seq_review);
		
		
		restaurantReviewImageDTO.setSeq_member(memberDTO.getSeq_member());
		restaurantReviewImageDTO.setSeq_restaurant(restaurantReviewDTO.getSeq_restaurant());
		restaurantReviewImageDTO.setSubject(restaurantReviewDTO.getSubject());
		restaurantReviewImageDTO.setSeq_review(seq_review);
		
		for(MultipartFile img : list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			restaurantReviewImageDTO.setImage(fileName);
			memberService.reviewImageWrite(restaurantReviewImageDTO);
		}//for

	}
	//qna 리스트 뿌리기
	@RequestMapping( value="getQnaFormList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getQnaFormList(@RequestParam(required = false, defaultValue="1") int pg , HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pg", pg);
		if((MemberDTO)session.getAttribute("memDTO") == null) {
			map.put("memSEQ", null);
			map.put("position", null);
		}else {
			map.put("memSEQ", ((MemberDTO)session.getAttribute("memDTO")).getSeq_member());
			map.put("position", ((MemberDTO)session.getAttribute("memDTO")).getPosition());
		}
		System.out.println(map);
		List<QnaDTO> qnaList = memberService.getQnaFormList(pg,map);
		QnaPaging qnaPaging = memberService.getPaging(map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("qnaList", qnaList);
		mav.addObject("qnaPaging", qnaPaging.getPagingHTML());
		mav.setViewName("jsonView");
		return mav;
	}
	
	//qna 질문내용 출력
	@RequestMapping(value="qna_View", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qna_View(@RequestParam int pg , @RequestParam int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		QnaDTO qnaDTO = memberService.getQnaView(seq);
		if(qnaDTO.getReply()==null) {
			qnaDTO.setReply("등록된 답변이 없습니다.");
		}
		
		mav.addObject("qnaDTO",qnaDTO);
		mav.addObject("pg",pg);
		mav.addObject("seq",seq);
			
		if(((MemberDTO)session.getAttribute("memDTO"))==null) {
			mav.addObject("position", null);
		}else {
			mav.addObject("position",((MemberDTO)session.getAttribute("memDTO")).getPosition());
		}
		mav.setViewName("/member/qna_View");
		return mav;
	}
	
	
	@RequestMapping(value="qnaDelete", method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public void qnaDelete(@RequestParam int seq) {
		memberService.qnaDelete(seq);
	}
	
	@RequestMapping(value="qnaReply", method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public void qnaReply(@RequestParam String reply, int seq) {
		memberService.qnaReply(reply, seq);
	}
	
	@RequestMapping( value="searchQnaList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView searchQnaList(@RequestParam Map<String,Object> map , HttpSession session) {
		System.out.println(map);
		
		if((MemberDTO)session.getAttribute("memDTO") == null) {
			map.put("memSEQ", null);
			map.put("position", null);
		}else {
			map.put("position", ((MemberDTO)session.getAttribute("memDTO")).getPosition());
			map.put("memSEQ", ((MemberDTO)session.getAttribute("memDTO")).getSeq_member());
		}
		System.out.println(map);
		List<QnaDTO> qnaSearchList = memberService.searchQnaList(map);
		QnaPaging qnaSearchPaging = memberService.getSearchPaging(map);
		ModelAndView mav = new ModelAndView();

		mav.addObject("qnaSearchList", qnaSearchList);
		System.out.println(qnaSearchList);
		mav.addObject("qnaSearchPaging", qnaSearchPaging.getPagingHTML());
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value="hadReserved", method = RequestMethod.POST)
	@ResponseBody
	public String hadReserved(@RequestParam Map<String, Integer> map) {
		//seq_restaurant, seq_member
		System.out.println(map);
		String reservResult="";
		ReservationDTO reservationDTO =  memberService.hadReserved(map);
		System.out.println(reservationDTO);
		
		if(reservationDTO == null) {
			reservResult = "no_reserved";
		} else {
			reservResult = "reserved";
		}
		
		return reservResult;
	}
	
	@RequestMapping(value="cancelBasket", method = RequestMethod.POST)
	@ResponseBody
	public void cancelBasket(@RequestParam Map<String, String> map) {
		memberService.cancelBasket(map);
	}
	

}