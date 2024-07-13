package com.kgitbank.webProject01.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.webProject01.dto.MemberDTO;

@Service
public class MemberMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int checkMember(Map<String, String> map) {
		MemberDTO dto = sqlSession.selectOne("checkMember", map);
		if (dto == null) return 0;
		else 	return 1;
	}
	
	public int insertMember(MemberDTO dto) {
		return sqlSession.insert("insertMember", dto);
	}
	
	public int loginCheck(Map<String, String> map) {
		MemberDTO dto = sqlSession.selectOne("getMember2", map.get("id"));
		if (dto == null) return 1;
		else if (dto.getPasswd().equals(map.get("passwd"))) return 0;
		else 	return 2;
	}
	
	public String searchMember(Map<String, String> map) {
		String msg = null;
		if (map.containsKey("id")) {
			msg = sqlSession.selectOne("searchPw", map);
		}else {
			msg = sqlSession.selectOne("searchId", map);
		}
		return msg;
	}
	
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("getMember2", id);
	}
	
	public List<MemberDTO> listMember(){
		return sqlSession.selectList("listMember");
	}
	
	public List<MemberDTO> findMember(Map<String, String> map){
		return sqlSession.selectList("findMember", map);
	}
	
	public int deleteMember(int no) {
		return sqlSession.delete("deleteMember", no);
	}
	
	public int updateMember(MemberDTO dto) {
		return sqlSession.update("updateMember", dto);
	}
	
	public MemberDTO getMember(int no) {
		return sqlSession.selectOne("getMember", no);
	}
}
