package com.kgitbank.webProject01.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.webProject01.dto.SalesDTO;

@Service
public class SalesMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertSales(SalesDTO dto) {
		return sqlSession.insert("insertSales", dto);
	}
	
	public List<SalesDTO> listSales(){
		return sqlSession.selectList("listSales");
	}
	
	public List<SalesDTO> listSales(int no){
		return sqlSession.selectList("getSales", no);
	}
		
	public List<SalesDTO> memberSales(int member_no){
		return sqlSession.selectList("memberSales", member_no);
	}
	
}
