package com.kgitbank.webProject01;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kgitbank.webProject01.dto.ProductDTO;
import com.kgitbank.webProject01.service.ProductMapper;

public class ProductList {
	
	private ProductMapper productMapper;
	
	List<ProductDTO> p_list;
	Hashtable<String, List<ProductDTO>> ht;
	
	public ProductList(ProductMapper productMapper) {
		p_list = new ArrayList<>();
		ht = new Hashtable<>();
		this.productMapper = productMapper;
	}
	
	public List<ProductDTO> selectBySpec(String pspec){
		List<ProductDTO> list = productMapper.listSpecProduct(pspec);
		ht.put(pspec, list);
		return list;
	}
	
	public List<ProductDTO> getSpecList(String pspec){
		return ht.get(pspec);
	}
	
	public List<ProductDTO> selectByCode(String code){
		List<ProductDTO> list = productMapper.listCodeProduct(code);
		ht.put(code, list);
		return list;
	}
	
	public ProductDTO getProduct(String select, String pnum) {
		System.out.println(select);
		System.out.println(ht);
		p_list = ht.get(select);
		for(ProductDTO dto : p_list){
			if (String.valueOf(dto.getPnum()).equals(pnum.trim())){
				return dto;
			}
		}
		return null;
	}
	
	public void setCodePqty(String code, String pnum, int qty) {
		ProductDTO dto = getProduct(code, pnum);
		dto.setPqty(dto.getPqty() - qty);
		if (dto.getPspec().equals("none")) return;
		ProductDTO dto2 = getProduct(dto.getPspec(), pnum);
		dto2.setPqty(dto.getPqty() - qty);
		return;
	}
	
	public void setModePqty(String mode, String pnum, int qty) {
		ProductDTO dto = getProduct(mode, pnum);
		dto.setPqty(dto.getPqty() - qty);
		if (ht.get(dto.getPcategory_fk().substring(0,4)) == null) {
			return;
		}
		ProductDTO dto2 = getProduct(dto.getPcategory_fk().substring(0,4), pnum);
		dto2.setPqty(dto.getPqty() - qty);
	}
}
