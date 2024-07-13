package com.kgitbank.webProject01.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.webProject01.dto.ReplyBoardDTO;

@Service
public class ReplyBoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReplyBoardDTO> listBoard(){
		return sqlSession.selectList("listBoard2");
	}
	
	public int countRe_step(Map<String, String> map) {
		return sqlSession.update("countRe_step", map);
	}
	 
	public int insertBoard(ReplyBoardDTO dto) {
		return sqlSession.insert("insertBoard2", dto);
	}
	
	public int plusReadcount(int num) {
		return sqlSession.update("plusReadcount2", num);
	}
	
	public ReplyBoardDTO getBoard(int num) {
		return sqlSession.selectOne("getBoard2", num);
	}
	
	public int deleteBoard(int num) {
		return sqlSession.delete("deleteBoard2", num);
	}
	
	public int updateBoard(ReplyBoardDTO dto) {
		return sqlSession.update("updateBoard2", dto);
	}
}




