package admin.service;

import java.util.List;
import java.util.Map;

import admin.bean.AdminPaging;
import admin.bean.BlackMember;
import member.bean.MemberDTO;

public interface AdminService {

	public List<MemberDTO> getMemberData(String page);

	public void deleteMember(int seq_member_int);

	public void moveMember(int seq_member_int);

	public List<MemberDTO> getDeletedMemberData();

	public void MoveToMember(String seq_member);

	public void deleteFromRevertedMember(String seq_member);

	public void goToBlack(String seq_member);

	public List<BlackMember> getBlockedMember();

	public void setReason(Map<String, String> map);

	public void strongrevert(String seq_member);

	public AdminPaging adminPaging(String page);

}
