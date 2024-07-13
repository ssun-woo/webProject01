package com.kgitbank.webProject01.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.webProject01.dto.ProductDTO;
import com.kgitbank.webProject01.dto.SalesDTO;

@Service
public class ProductMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertProduct(ProductDTO dto) {
		return sqlSession.insert("prod_input", dto);
	}
	
	public List<ProductDTO> listProduct(){
		return sqlSession.selectList("prod_list");
	}
	
	public ProductDTO getProduct(int pnum) {
		return sqlSession.selectOne("getProduct", pnum);
	}
	
	public int deleteProduct(int pnum) {
		return sqlSession.delete("prod_delete", pnum);
	}
	
	public int updateProduct(ProductDTO dto) {
		return sqlSession.update("prod_update", dto);
	}
	
	public List<ProductDTO> listSpecProduct(String pspec){
		return sqlSession.selectList("prod_spec_list", pspec);
	}
	
	public List<ProductDTO> listCodeProduct(String pcode){
		return sqlSession.selectList("prod_code_list", pcode+"%");
	}
	
	public int salesProduct(SalesDTO dto) {
		return sqlSession.update("sales_product", dto);
	}
}










