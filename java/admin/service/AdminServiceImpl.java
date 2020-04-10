package admin.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminPaging;
import admin.bean.BlackMember;
import admin.dao.AdminDAO;
import member.bean.MemberDTO;

@Service(value="adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<MemberDTO> getMemberData(String page) {
		//페이징 시작
		int endNum = Integer.parseInt(page) * 10;
		int startNum = endNum - 9;
		//page=2, startnum=11 endNum=20;
		System.out.println("sn: "+startNum);
		System.out.println("en: "+endNum);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<MemberDTO> list = adminDAO.getMemberData(map);
		System.out.println(list);
		
		return list;
	}
	
	@Override
	public AdminPaging adminPaging(String page) {
		AdminPaging adminPaging = new AdminPaging();
		int totalNumber = adminDAO.getTotalNumber();
		
		adminPaging.setCurrentPage(Integer.parseInt(page));
		adminPaging.setPageBlock(2);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalNumber);
		adminPaging.makePagingHTML();
		
		return adminPaging;
	}

	@Override
	public void moveMember(int seq_member) {
		adminDAO.moveMember(seq_member);		
	}
	@Override
	public void deleteMember(int seq_member) {
		adminDAO.deleteMember(seq_member);
	}


	@Override
	public List<MemberDTO> getDeletedMemberData() {
		return adminDAO.getDeletedMemberData();
	}


	@Override
	public void MoveToMember(String seq_member) {
		adminDAO.MoveToMember(seq_member);
	}


	@Override
	public void deleteFromRevertedMember(String seq_member) {
		adminDAO.deleteFromRevertedMember(seq_member);
	}
	
	
	@Override
	public void goToBlack(String seq_member) {
		adminDAO.goToBlack(seq_member);
	}


	@Override
	public List<BlackMember> getBlockedMember() {
		return adminDAO.getBlockedMember();		
	}


	@Override
	public void setReason(Map<String, String> map) {
		adminDAO.setReason(map);
	}


	@Override
	public void strongrevert(String seq_member) {
		adminDAO.strongrevert(seq_member);
	}

}
