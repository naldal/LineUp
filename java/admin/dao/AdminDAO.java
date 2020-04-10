package admin.dao;

import java.util.List;
import java.util.Map;

import admin.bean.BlackMember;
import member.bean.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> getMemberData(Map<String, Integer> map);

	public void moveMember(int seq_member);

	public void deleteMember(int seq_member);

	public List<MemberDTO> getDeletedMemberData();

	public void MoveToMember(String seq_member);

	public void deleteFromRevertedMember(String seq_member);

	public void goToBlack(String seq_member);

	public List<BlackMember> getBlockedMember();

	public void setReason(Map<String, String> map);

	public void strongrevert(String seq_member);

	public int getTotalNumber();
	

}
