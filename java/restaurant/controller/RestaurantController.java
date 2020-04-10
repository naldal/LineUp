package restaurant.controller;

import java.io.File; 
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import index.bean.IndexReviewDTO;
import member.bean.MemberDTO;
import restaurant.bean.RestaurantDTO;


//레스토랑 뷰 DTO (start)
import restaurant.bean.RestaurantInfoDTO;
import restaurant.bean.RestaurantListDTO;
//레스토랑 뷰 DTO (end)
import restaurant.bean.RestaurantImageDTO;
import restaurant.bean.RestaurantInfoDTO;
import restaurant.bean.RestaurantMenuDTO;
import restaurant.bean.RestaurantOwnerDTO;
import restaurant.bean.RestaurantPaging;
import restaurant.bean.RestaurantReserved;
import restaurant.bean.RestaurantReviewDTO;
import restaurant.bean.RestaurantReviewDTOWithName;
import restaurant.bean.RestaurantReviewImageDTO;
import restaurant.service.RestaurantService;

@Controller
@RequestMapping(value = "restaurant")
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping(value = "restaurant_registerForm")
	public String restaurant_register() {
		return "/restaurant/restaurant_register"; // jsp파일
	}

	@RequestMapping(value = "restaurant_register_imgs", method = RequestMethod.POST)
	@ResponseBody
	public void restaurant_register_imgs(@ModelAttribute RestaurantDTO restaurantDTO, @RequestParam MultipartFile img,
			@RequestParam("multiimg[]") List<MultipartFile> list, HttpSession session)
			throws FileNotFoundException, IOException {
// aa
		// 이미지들 제외한 나머지 정보 DTO setting
		int seq_member = (int) session.getAttribute("memDTO_seq");
		restaurantDTO.setSeq_member(seq_member);
		
		RestaurantImageDTO restaurantImageDTO = new RestaurantImageDTO();

		// 이미지 제외한 나머지 정보 restaurant 테이블에 insert
		restaurantService.restaurant_register_info(restaurantDTO);
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		memberDTO.setStore_exist("1");
		session.setAttribute("memDTO", memberDTO);

		/* 이미지 테이블 insert 프로세스 시작 */
		// restaurant 등록시에 사용했던 seq_member을 파라미터로 seq_restaurant를 받아와서 image dto에 넣음
		int mem_seq = (int) session.getAttribute("memDTO_seq");
		System.out.println(mem_seq);

		String resSeq = restaurantService.getResSeqWithMemberSeq(mem_seq);
		System.out.println(resSeq);

		restaurantImageDTO.setSeq_restaurant(resSeq);
		// 메인이미지 경로

		 String filePathMain = "//192.168.0.14/main_imgs/"; 
		
		// 메인이미지 파일이름
		String fileNameMain = img.getOriginalFilename();

		// 메인이미지 경로로 파일복사
		File fileMain = new File(filePathMain, fileNameMain);
		FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(fileMain));

		// main_img DTO setting
		restaurantImageDTO.setMain_img(fileNameMain);

		// 서브이미지 경로

		 String filePathSub = "//192.168.0.14/sub_imgs/" ;
		
		for (MultipartFile multiimg : list) {
			// 서브이미지 파일이름들
			String fileNameSub = multiimg.getOriginalFilename();

			// 서브이미지 경로로 파일복사
			File fileSub = new File(filePathSub, fileNameSub);
			try {
				FileCopyUtils.copy(multiimg.getInputStream(), new FileOutputStream(fileSub));

				// sub_img DTO setting
				restaurantImageDTO.setSub_img(fileNameSub);
			} catch (Exception e) {
				return;
			}

			// restaurant_regi_img 테이블에 insert
			restaurantService.restaurant_register_imgs(restaurantImageDTO); // res img 테이블로 넣는 값
		}

	}

//	메뉴등록
	@RequestMapping(value = "restaurant_menu", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public void restaurant_menu(@RequestParam Map<String, String> menu, @RequestParam String company_num) {
		menu.put("company_num", company_num);

		int resSeq = restaurantService.getResSeq(menu.get("company_num"));
		menu.remove("company_num");
		menu.put("restaurant_seq", resSeq + "");

		restaurantService.restaurant_menu(menu);
	}

	// 가게정보관리페이지 이동
	@RequestMapping(value = "store_information_management", method = RequestMethod.GET)
	public String myPageEnterprise(Model model) {
		return "/restaurant/store_information_management";
	}

	@RequestMapping(value = "getStoreInformationManagement", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ModelAndView getStoreInformationManagement(@RequestParam String date, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		date = date.substring(2,date.length());
		
		System.out.println(memberDTO);
		Map<String, Object> map = restaurantService.getStoreInformationManagement(memberDTO.getCompany_num(), date);
		System.out.println("date : "+date); //현날 
		List<RestaurantReviewImageDTO> reviewImageList = restaurantService.getRestaurantReviewImage( ((RestaurantDTO)map.get("restaurantDTO")).getSeq_restaurant()+"" );
		System.out.println(map);
		System.out.println("리리"+reviewImageList);		 //ok
		System.out.println("맵리"+map.get("reviewList")); //ok
		System.out.println(map);
		System.out.println("가게정보 관리 - 예약관련 : "+map.get("reservationList"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewImageList", reviewImageList);
		mav.addObject("restaurantDTO", map.get("restaurantDTO"));
		mav.addObject("restaurantImgList", map.get("restaurantImgList"));
		mav.addObject("menuList", map.get("restaurantMenuList"));
		mav.addObject("reservationList", map.get("reservationList"));
		mav.addObject("reservedList", map.get("reservedList"));
		mav.addObject("reviewList", map.get("reviewList"));
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "getReservationList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getReservationList(@RequestParam String date, HttpSession session) {
		System.out.println("페이지 이동");
		date = date.substring(2,date.length());
		Map<String, Object> map = restaurantService.getReservationList(((MemberDTO)session.getAttribute("memDTO")).getCompany_num(), date);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reservationList", map.get("reservationList"));
		mav.addObject("reservedList", map.get("reservedList"));
		mav.setViewName("jsonView");
		System.out.println("확인:"+map);
		return mav;
	}


	// 리스트
	@RequestMapping(value = "restaurantList")
	public ModelAndView restaurantList(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") String pg,
			@RequestParam(required = false, defaultValue = "") String searchOption,
			@RequestParam(required = false, defaultValue = "") String searchText,
			@RequestParam(required = false, defaultValue = "") String vegan,
			@RequestParam Map<String, String> map) {

		System.out.println("check -----------------");
		System.out.println("restaurantList ======searchOption: "+searchOption);
		System.out.println("restaurantList ======searchText: "+searchText);
		System.out.println("restaurantList ======vegan: "+vegan);
		System.out.println("restaurantList ======pg: "+pg);

		
		// restaurantList
		mav.addObject("restaurantList", restaurantService.restaurantList(pg));

		mav.setViewName("/restaurant/restaurantList");
		// restaurantList
		// paging

		RestaurantPaging restaurantPaging = restaurantService.restaurantListPaging(pg);

		mav.addObject("restaurantPaging", restaurantPaging);
		mav.addObject("pg", pg);
//		mav.addObject("searchOption",searchOption);
//		mav.addObject("searchText",searchText);
//		mav.addObject("vegan",searchOption);
		
		return mav;
	}

	@RequestMapping(value="restaurantSearchList", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView restaurantSearchList(
			@RequestParam String pg, @RequestParam String searchOption, @RequestParam String searchText, @RequestParam String vegan) {

		System.out.println("================pg="+pg);
		System.out.println("================searchOption="+searchOption);
		System.out.println("================searchText="+searchText);
		System.out.println("================vegan="+vegan);
		Map<String, String> map = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		if(searchOption!=null) {
			
			map.put("searchText", searchText);
			map.put("searchOption", searchOption);
			map.put("pg",pg);
			map.put("vegan",vegan);
			
			List<RestaurantListDTO> list = restaurantService.restaurantSearchList(map);
			mav.addObject("list",list);
			System.out.println(list);
			
		}
		//paging
		RestaurantPaging restaurantPaging = restaurantService.restaurantSearchListPaging(map);
		mav.addObject("restaurantPaging",restaurantPaging);
		mav.addObject("pg",pg);
		mav.addObject("vegan", vegan);
		mav.setViewName("jsonView");
	
		return mav;	
	}


	@RequestMapping(value = "restaurantUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void restaurantUpdate( @RequestParam Map<String,Object> map,
								  @RequestParam(required = false) MultipartFile img_main, @RequestParam("img_sub") List<MultipartFile> img_list,
								  @RequestParam("default_img_sub") List<String> default_img_sub, HttpSession session) {
		
		//레스토랑 seq값을 세션을 통해 받아와서 map에 넣어서 넘겨준다
		if(img_main ==null) {
			System.out.println("img_main"+ img_main);
		}else {
			System.out.println("img_main, not null "+img_main.getOriginalFilename());
		}
		System.out.println("기본 서브이미지 확인 "+default_img_sub);
		System.out.println(default_img_sub.size());
		if(img_list!= null) {
			System.out.println("서브이미지 확인"+img_list);
			System.out.println(img_list.size());
		}
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memDTO");
		map.put("company_num", memberDTO.getCompany_num());
		restaurantService.restaurantUpdate(map, img_main,default_img_sub, img_list);
	}

	@RequestMapping(value = "restaurant_update_imgs", method = RequestMethod.POST)
	@ResponseBody
	public void restaurant_update_imgs(@ModelAttribute RestaurantDTO restaurantDTO, @RequestParam MultipartFile img,
			@RequestParam("multiimg[]") List<MultipartFile> list) throws FileNotFoundException, IOException {

	}

//	레스토랑 상세페이지
	@RequestMapping(value = "detailRestaurant", method = { RequestMethod.POST, RequestMethod.GET })
	public String detailRestaurant(@RequestParam String seq_restaurant,
			@RequestParam(required = false, defaultValue = "1") String pg, Model model, HttpSession session) {
		RestaurantInfoDTO restaurantInfoDTO = new RestaurantInfoDTO();

		model.addAttribute("seq_restaurant", seq_restaurant);
		model.addAttribute("pg", pg);

		// 식당주인이 본인의 식당으로 접속시 예약, 리뷰, 찜 사용불가능 로직
		try {
			RestaurantOwnerDTO verifyResOwner = restaurantService.verifyResOwner(seq_restaurant);
			if (session.getAttribute("memDTO_seq").equals(verifyResOwner.getSeq_member())) {
				model.addAttribute("owner", true);
			} else {
				model.addAttribute("owner", false);
			}
		} catch (NullPointerException e) {
			model.addAttribute("owner", false);
		}

		// 별점평균값 출력. null일시 0으로 예외처리
		int starValue = 0;
		try {
			starValue = restaurantService.getStarValue(seq_restaurant);
		} catch (Exception e) {
			starValue = 0;
		}
		
		restaurantInfoDTO.setStarValue(starValue);
		System.out.println("starValue : "+starValue);
		
		model.addAttribute("starValue", starValue);
		return "/restaurant/restaurant_View";
	}
	
	

	@RequestMapping(value = "getDetailRestaurant", method = {RequestMethod.POST})
	@ResponseBody
	public ModelAndView getDetailRestaurant(@RequestParam String seq_restaurant,
			@RequestParam(required = false, defaultValue = "1") String pg, Model model, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		
		//inner join 사용시 한 테이블에라도 seq_restuarant 값이 들어있지않다면 정상출력되지 않음. 
		RestaurantInfoDTO restaurantInfoDTO = restaurantService.restaurantInfo(seq_restaurant);
		List<RestaurantMenuDTO> restaurantMenuDTOList = restaurantService.restaurantMenu(seq_restaurant);
		List<RestaurantImageDTO> restaurantImageDTOList = restaurantService.restaurantImage(seq_restaurant);
		List<RestaurantReviewDTOWithName> restaurantReviewDTOListWithName = restaurantService.restaurantReview(seq_restaurant);
		List<RestaurantReviewImageDTO> restaurantReviewImageDTO = restaurantService.getRestaurantReviewImage(seq_restaurant);

		//true false를 해당 칼럼이름으로 변환
		for (int i = 0; i < restaurantMenuDTOList.size(); i++) {
			if(restaurantMenuDTOList.get(i).getVegan() == null || restaurantMenuDTOList.get(i).getVegan().equals("false")) {
				restaurantMenuDTOList.get(i).setVegan("");
			}
			if(restaurantMenuDTOList.get(i).getSpicy() == null || restaurantMenuDTOList.get(i).getSpicy().equals("false")) {
				restaurantMenuDTOList.get(i).setSpicy("");
			}
			if(restaurantMenuDTOList.get(i).getVegan().equals("true")) {
				restaurantMenuDTOList.get(i).setVegan("vegan");
			}
			if(restaurantMenuDTOList.get(i).getSpicy().equals("true")) {
				restaurantMenuDTOList.get(i).setSpicy("spicy");
			}
		}

		// 서브 이미지가 없을 경우 null값 전달
		for (int i = 0; i < restaurantImageDTOList.size(); i++) {
			if (restaurantImageDTOList.get(i).getSub_img() == null || restaurantImageDTOList.get(i).getSub_img().equals("false")) {
				restaurantImageDTOList.get(i).setSub_img("");
			}
		}
		
		for(int i=0; i < restaurantReviewDTOListWithName.size(); i++) {
			if(restaurantReviewDTOListWithName.get(i).getNickname() == null) {
				restaurantReviewDTOListWithName.get(i).setNickname("");
			} else if(restaurantReviewDTOListWithName.get(i).getReal_name() == null) {
				restaurantReviewDTOListWithName.get(i).setReal_name("");
			}
		}
		
		System.out.println("리뷰관련 dto : "+restaurantReviewDTOListWithName);
		// 식당 정보 (이미지, 메뉴 제외)
		mav.addObject("restaurantInfoDTO", restaurantInfoDTO);
		System.out.println(restaurantInfoDTO);
		// 레스토랑 메뉴들
		mav.addObject("restaurantMenuDTOList", restaurantMenuDTOList);
		// 레스토랑 이미지들(서브이미지 빼오기)
		mav.addObject("restaurantImageDTOList", restaurantImageDTOList);
		//가게 메인이미지만
		model.addAttribute("main_img", restaurantImageDTOList.get(0).getMain_img());
		// 레스토랑 리뷰들
		mav.addObject("restaurantReviewDTOListWithName", restaurantReviewDTOListWithName);
		// 레스토랑 리뷰 이미지들
		mav.addObject("restaurantReviewImageDTO", restaurantReviewImageDTO);
		
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value="reservation")
	@ResponseBody
	public String reservation (@RequestParam Map<String, String>map, HttpSession session) {
//		'id='+$('#member_id').val()+'&tel='+$('#reserve_tel').val()+'&howmany='+$('#howmany').val()+'&seq_restaurant='+$('#seq_restaurant').val()
		String result = "fail";
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		
		memberDTO = restaurantService.reservationCheck(map);
		System.out.println(memberDTO);
		System.out.println(memberDTO.getReservation());
		if(memberDTO.getReservation() == null || memberDTO.getReservation().equals("0")) {
			memberDTO.setReservation("0");
			restaurantService.reservation(map);
			restaurantService.reservation2(map);
			restaurantService.reservation3(map);
			restaurantService.reservation4(map); //기존에 같은 식당에 예약을 한 것이 있으면 그 식당의 reserved_restaurant 의 accpeted를 0으로 바꿔놓는다. 
			//update reserved_restaurant set accepted = '0' where seq_restaurant = #{seq_restaurant} and seq_member  = (select seq_member from member where id = #{id});
		
			memberDTO.setReservation("1");
			session.setAttribute("memDTO", memberDTO);
			result = "success";
		}
		return result;
	}
	
	@RequestMapping(value="cancelReservation")
	@ResponseBody
	public String cancelReservation (@RequestParam Map<String, String> map, HttpSession session) {
		String result;
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		System.out.println("memberDTO:"+memberDTO);
		restaurantService.cancelReservation(map);
		restaurantService.cancelReservation2(map);
		memberDTO.setReservation("0");
		session.setAttribute("memDTO", memberDTO);
		result = "success";

		return result;	
	}
	
    @RequestMapping(value="getIntoBasket")
    @ResponseBody
    public void getIntoBasket(@RequestParam Map<String, String> map) {
        restaurantService.getIntoBasket(map);
    }
    
    @RequestMapping(value="register_review")
    @ResponseBody
    public void register_review(@ModelAttribute RestaurantReviewDTO restaurantReviewDTO, Map<String, Integer> map,
    							@RequestParam("multi[]") List<MultipartFile> list, HttpSession session) {
    	
    	//reserved_restaurant 테이블의 accepted가 0이면 리뷰 불가능
    	int seq_member = restaurantReviewDTO.getSeq_member();
    	int seq_restaurant = restaurantReviewDTO.getSeq_restaurant();
    	
    	System.out.println(seq_member);
    	System.out.println(seq_restaurant);
    	
    	map.put("seq_member", seq_member);
    	map.put("seq_restaurant", seq_restaurant);
    	String acceptCheck = restaurantService.acceptCheck(map);
    	
    	System.out.println(acceptCheck);
    	if(acceptCheck.equals("1")) {
    		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
        	RestaurantReviewImageDTO restaurantReviewImageDTO = new RestaurantReviewImageDTO();
        	
        	if(memberDTO.getReal_name() != null) {
        		restaurantReviewDTO.setName(memberDTO.getReal_name());
        	} else if(memberDTO.getNickname() != null) {
        		restaurantReviewDTO.setName(memberDTO.getNickname());
        	}
        	
        	restaurantReviewDTO.setSeq_member(memberDTO.getSeq_member());
        	restaurantReviewDTO.setId(memberDTO.getId());

        	
        	// 사진제외 리뷰내용 테이블에 삽입완료
        	restaurantService.reviewRegister(restaurantReviewDTO);
        	
        	//자신이 쓴 가장 최근의 리뷰 빼오기(seq_review);
    		int seq_review = restaurantService.getReviewSeq(memberDTO.getSeq_member());
    		restaurantReviewImageDTO.setSeq_review(seq_review);
        	
        	String filePathReview = "//192.168.0.14/review_img/";
        	
        	for(MultipartFile multi : list) {
        		String fileNameReview = multi.getOriginalFilename();
        		File fileReview = new File(filePathReview, fileNameReview);
        		
        		try {
    				FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(fileReview));
    			} catch (FileNotFoundException e) {
    				System.out.println("경로를 찾을 수 없습니다");
    			} catch (IOException e) {
    				System.out.println("입출력 문제입니다");
    			}
        		
        		restaurantReviewImageDTO.setSeq_restaurant(restaurantReviewDTO.getSeq_restaurant());
        		restaurantReviewImageDTO.setSeq_member(memberDTO.getSeq_member());
        		restaurantReviewImageDTO.setImage(fileNameReview);
        		
        		restaurantService.reviewImgRegister(restaurantReviewImageDTO);
        	}
    	} else {				// accepted가 0이면 리뷰 불가능 
    		System.out.println("리뷰를 쓸 수 없습니다. 승인되지 않았습니다");
    	}
    	
    	
    	
    }
    
    @RequestMapping(value="hasRestaurant")
    @ResponseBody
    public String hasRestaurant(@RequestParam String id) {
       String seqnum="";
       
      seqnum = restaurantService.hasRestaurant(id);
      if(seqnum==null) {
         seqnum = "hasNoRes";         
      } else {
         seqnum = "hasRes";
      }
   
 
       System.out.println(seqnum);
       return seqnum;
    }

    @RequestMapping(value="visitCheckYes")
    @ResponseBody
    public void visitCheckYes(@RequestParam Map<String, String> map) {
    	System.out.println("map : "+map);
    	
    	RestaurantReserved reserved = restaurantService.visitCheckYes1(map);
    	System.out.println("예약확인 = " + reserved);
    	restaurantService.visitCheckYes2(map);
    	restaurantService.visitCheckYes3(reserved);
    }
    
    @RequestMapping(value="visitCheckNo")
    @ResponseBody
    public void visitCheckNo(@RequestParam Map<String, String> map) {
    	restaurantService.visitCheckNo(map);
    }

    
    
//    seq_restaurant, seq_member 필요
	/*
	 * @RequestMapping(value="doReserve") public String doReserve(@RequestParam
	 * Map<String, Integer> map) { System.out.println(map);
	 * restaurantService.doReserve(map);
	 * 
	 * return "/home/index"; }
	 */
    
    
}
