package com.spring.LineUp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import index.bean.IndexReviewDTO;
import index.service.IndexService;
import member.bean.MemberDTO;
import restaurant.bean.RestaurantDTO;
import restaurant.bean.RestaurantListDTO;
import restaurant.bean.RestaurantPaging;
import restaurant.service.RestaurantService;

@Controller
@RequestMapping(value = "home")
public class HomeController {

	@Autowired
	private IndexService indexService;
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping(value="index")
	public ModelAndView home(ModelAndView mav) {
		//check list
		List<IndexReviewDTO> list =  indexService.ReviewList(); 
		System.out.println(list.size()); 
	
		// Review 
		mav.addObject("indexReview", indexService.ReviewList()); 
		//Today's Restaurant

		mav.addObject("restaurantList", restaurantService.restaurantHomeList());
		mav.addObject("indexTodayRestaurant", restaurantService.restaurantHomeList());
		mav.setViewName("/home/index");
		return mav;
	}
	
	@RequestMapping(value="restaurantSearchHomeList")
	@ResponseBody
	public ModelAndView restaurantSearchHomeList(
			@RequestParam String pg, @RequestParam String searchOption, @RequestParam String searchText) {
		//System.out.println(map);
		System.out.println("================pg="+pg);
		System.out.println("================searchOption="+searchOption);
		System.out.println("================searchText="+searchText);
		Map<String, String> map = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		if(searchOption!=null) {
			
			map.put("searchText", searchText);
			map.put("searchOption", searchOption);
			map.put("pg",pg);
			List<RestaurantListDTO> list = restaurantService.restaurantSearchList(map);
			mav.addObject("list",list);
			
		}
		//paging
		RestaurantPaging restaurantPaging = restaurantService.restaurantSearchListPaging(map);
		mav.addObject("restaurantPaging",restaurantPaging);
		mav.addObject("pg",pg);
		mav.setViewName("/restaurant/restaurantList");
			
		return mav;	
	}
	
	@RequestMapping(value="infoPage", method=RequestMethod.GET)
	public String infoPage() {
		return "/home/infoPage";
	}
	
	@RequestMapping(value="aboutUs", method=RequestMethod.GET)
	public String aboutUs() {
		return "/home/aboutUs";
	}
	
	@RequestMapping(value="contactUs", method=RequestMethod.GET)
	public String contactUs() {
		return "/home/contactUs";
	}
	
	@RequestMapping(value="qna", method=RequestMethod.GET)
	public ModelAndView qna(@RequestParam(required = false, defaultValue="1") String pg,
							@RequestParam(required = false, defaultValue="1") String step,
							@RequestParam(required = false, defaultValue="") String category,
							@RequestParam(required = false, defaultValue="") String search, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		if(((MemberDTO)session.getAttribute("memDTO"))==null) {
			mav.addObject("id", "temp");
		}else {
			mav.addObject("id", ((MemberDTO)session.getAttribute("memDTO")).getId());
		}
		mav.addObject("step", step);
		mav.addObject("category", category);
		mav.addObject("search", search);
		mav.setViewName("/home/qna");
		return mav;
	}
	
	@RequestMapping(value="privacy_Guidelines", method=RequestMethod.GET)
	public String privacy_Guidelines() {
		return "/home/privacy_Guidelines";
	}
	
	@RequestMapping(value="faq", method = RequestMethod.GET)
	public String faq() {
		return "/home/faq";
	}
	
	@RequestMapping(value="faq_user1", method=RequestMethod.GET)
	public String faq_in() {
		return "/home/faq_user1";
	}
}
