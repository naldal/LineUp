package admin.dao;

import java.util.List; 
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.BlackMember;
import member.bean.MemberDTO;

@Repository(value="adminDAO")
@Transactional
public class AdminDAOMybatis implements AdminDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> getMemberData(Map<String, Integer> map) {
		return sqlSession.selectList("AdminSQL.getMemberData", map);
	}

	@Override
	public void moveMember(int seq_member) {
		sqlSession.insert("AdminSQL.moveMember", seq_member);
	}

	@Override
	public void deleteMember(int seq_member) {
		sqlSession.delete("AdminSQL.deleteMember", seq_member);
	}

	@Override
	public List<MemberDTO> getDeletedMemberData() {
		return sqlSession.selectList("AdminSQL.getDeletedMemberData");
		
	}

	@Override
	public void MoveToMember(String seq_member) {
		sqlSession.insert("AdminSQL.MoveToMember", seq_member);
	}

	@Override
	public void deleteFromRevertedMember(String seq_member) {
		sqlSession.delete("AdminSQL.deleteFromRevertedMember", seq_member);
	}

	@Override
	public void goToBlack(String seq_member) {
		sqlSession.insert("AdminSQL.goToBlack", seq_member);
	}

	@Override
	public List<BlackMember> getBlockedMember() {
		return sqlSession.selectList("AdminSQL.getBlockedMember");
	}

	@Override
	public void setReason(Map<String, String> map) {
		sqlSession.update("AdminSQL.setReason",map);
	}

	@Override
	public void strongrevert(String seq_member) {
		sqlSession.delete("AdminSQL.strongrevert",seq_member);
	}

	@Override
	public int getTotalNumber() {
		return sqlSession.selectOne("AdminSQL.getTotalNumber");
	}

}
