package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminPaging;
import admin.bean.BlackMember;
import admin.service.AdminService;
import member.bean.MemberDTO;
@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("memberManage")
	public String managePage(@RequestParam (required=false, defaultValue = "1") String page, Model model) {
		model.addAttribute("page", page);
		System.out.println(page);
		return "/admin/memberManage";
	}
	
	@RequestMapping("getMemberData")
	@ResponseBody
	public ModelAndView getMemberData(HttpSession session, @RequestParam(required = false, defaultValue="1") String page) {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		
		System.out.println(page);
		
		//page에 따른 리스트 반환
		List<MemberDTO> memberDTOList = adminService.getMemberData(page);
		System.out.println(memberDTOList);
		
		//페이지넘버링 처리
		AdminPaging adminPaging = adminService.adminPaging(page);
		
		// null값 처리
		for(int i=0; i<memberDTOList.size(); i++) {
			if(memberDTOList.get(i).getPosition().equals("INDIVIDUAL")) {
				memberDTOList.get(i).setPosition("개인회원");
				memberDTOList.get(i).setCompany_num("-");
			} else if(memberDTOList.get(i).getPosition().equals("ENTERPRISE")) {
				memberDTOList.get(i).setPosition("기업회원");
			}
			if(memberDTOList.get(i).getReal_name() == null) {
				memberDTOList.get(i).setReal_name("-");
			}
			if(memberDTOList.get(i).getNickname() == null) {
				memberDTOList.get(i).setNickname("-");
			}
			if(memberDTOList.get(i).getReservation() == null || memberDTOList.get(i).getReservation().equals("0")) {
				memberDTOList.get(i).setReservation("-");
			} else if(memberDTOList.get(i).getReservation().equals("1")) {
				memberDTOList.get(i).setReservation("예약중");
			}
			if(memberDTOList.get(i).getAuthStatus().equals("1")) {
				memberDTOList.get(i).setAuthStatus("인증됨");
			} else {
				memberDTOList.get(i).setAuthStatus("-");
			}
		}
		
		//admin 확인 로직
		try {
			mv.addObject("isAdmin", memberDTO.getPosition());
		} catch(NullPointerException n) {
			System.out.println("none");
			mv.addObject("isAdmin", "none");
		}
		
		mv.addObject("memberDTOList", memberDTOList);
		mv.addObject("page", page);
		mv.addObject("adminPaging", adminPaging);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	@RequestMapping("deleteMember")
	@ResponseBody
	public void deleteMember(@RequestParam String seq_member) {
		int seq_member_int = Integer.parseInt(seq_member);
		adminService.moveMember(seq_member_int);
		adminService.deleteMember(seq_member_int);
	}
	
	@RequestMapping("deletedMember")
	public String deletedMember() {
		return "/admin/deletedMember";
	}
	
	@RequestMapping("getDeletedMemberData")
	@ResponseBody
	public ModelAndView getDeletedMemberData(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> deletedMemberDTOList = adminService.getDeletedMemberData();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		
		for(int i=0; i<deletedMemberDTOList.size(); i++) {
			if(deletedMemberDTOList.get(i).getPosition().equals("INDIVIDUAL")) {
				deletedMemberDTOList.get(i).setPosition("개인회원");
				deletedMemberDTOList.get(i).setCompany_num("-");
			} else if(deletedMemberDTOList.get(i).getPosition().equals("ENTERPRISE")) {
				deletedMemberDTOList.get(i).setPosition("기업회원");
			}
			if(deletedMemberDTOList.get(i).getReal_name() == null) {
				deletedMemberDTOList.get(i).setReal_name("-");
			}
			if(deletedMemberDTOList.get(i).getNickname() == null) {
				deletedMemberDTOList.get(i).setNickname("-");
			}
			if(deletedMemberDTOList.get(i).getReservation() == null || deletedMemberDTOList.get(i).getReservation().equals("0")) {
				deletedMemberDTOList.get(i).setReservation("-");
			} else if(deletedMemberDTOList.get(i).getReservation().equals("1")) {
				deletedMemberDTOList.get(i).setReservation("예약중");
			}
			if(deletedMemberDTOList.get(i).getAuthStatus().equals("1")) {
				deletedMemberDTOList.get(i).setAuthStatus("인증됨");
			} else {
				deletedMemberDTOList.get(i).setAuthStatus("-");
			}
		}
		
		try {
			mv.addObject("isAdmin", memberDTO.getPosition());
		} catch(NullPointerException n) {
			System.out.println("none");
			mv.addObject("isAdmin", "none");
		}
		mv.addObject("deletedMemberDTOList", deletedMemberDTOList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("revertMember")
	@ResponseBody
	public void revertMember(@RequestParam String seq_member) {
		System.out.println(seq_member);
		
		adminService.MoveToMember(seq_member);
		adminService.deleteFromRevertedMember(seq_member);
	}
	
//	블랙리스트 테이블로 이동
	@RequestMapping("goToBlack")
	@ResponseBody
	public void goToBlack(@RequestParam String seq_member, @RequestParam String reason) {
		System.out.println("seq:"+seq_member);
		System.out.println(reason);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq_member",  seq_member);
		map.put("reason",  reason);
		
		adminService.goToBlack(seq_member);
		adminService.setReason(map);
	}
	
//	블랙회원 관리 페이지로 이동
	@RequestMapping("blockedMember")
	public String blockedMember() {
		return "/admin/blackListMember";
	}
	
	@RequestMapping("getBlockedMember")
	@ResponseBody
	public ModelAndView getBlockedMember(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		System.out.println(memberDTO.getPosition());
		try {
			mav.addObject("isAdmin", memberDTO.getPosition());
		} catch(NullPointerException n) {
			System.out.println("none");
			mav.addObject("isAdmin", "none");
		}
		
		List<BlackMember> blackMemberList = adminService.getBlockedMember();
		
		
		for(int i=0; i<blackMemberList.size(); i++) {
			if(blackMemberList.get(i).getPosition().equals("INDIVIDUAL")) {
				blackMemberList.get(i).setPosition("개인회원");
				blackMemberList.get(i).setCompany_num("-");
			} else if(blackMemberList.get(i).getPosition().equals("ENTERPRISE")) {
				blackMemberList.get(i).setPosition("기업회원");
			}
			if(blackMemberList.get(i).getReal_name() == null) {
				blackMemberList.get(i).setReal_name("-");
			}
			if(blackMemberList.get(i).getNickname() == null) {
				blackMemberList.get(i).setNickname("-");
			}
			
			if(blackMemberList.get(i).getReason() == null || blackMemberList.get(i).getReason().equals("")) {
				blackMemberList.get(i).setReason("-");
			}
		}
		
		System.out.println(blackMemberList);
		
		mav.addObject("blackMemberList", blackMemberList);
		mav.setViewName("jsonView");
		return mav;
		
	}

	@RequestMapping("strongrevert")
	@ResponseBody
	public void strongrevert(@RequestParam String seq_member) {
		adminService.strongrevert(seq_member);
	}
}
