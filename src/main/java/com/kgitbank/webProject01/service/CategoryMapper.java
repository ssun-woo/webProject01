package com.kgitbank.webProject01.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.webProject01.dto.CategoryDTO;


@Service
public class CategoryMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCate(CategoryDTO dto) {
		return sqlSession.insert("insertCate", dto);
	}
	
	public int deleteCate(int cnum) {
		return sqlSession.delete("deleteCate", cnum);
	}
	
	public List<CategoryDTO> listCate(){
		return sqlSession.selectList("listCate");
	}
}
