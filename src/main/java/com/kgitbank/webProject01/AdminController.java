package com.kgitbank.webProject01;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.webProject01.dto.MemberDTO;
import com.kgitbank.webProject01.dto.ProductDTO;
import com.kgitbank.webProject01.dto.SalesDTO;
import com.kgitbank.webProject01.dto.SalesListDTO;
import com.kgitbank.webProject01.service.MemberMapper;
import com.kgitbank.webProject01.service.ProductMapper;
import com.kgitbank.webProject01.service.SalesMapper;

@Controller
public class AdminController {
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private SalesMapper salesMapper;
	
	@RequestMapping("/admin_index.do")
	public String admin_index() {
		return "admin/index";
	}
	
	@RequestMapping("/sales_list.do")
	public String saleList(HttpServletRequest req) {
		List<SalesDTO> list = salesMapper.listSales();
		List<SalesListDTO> slist = new ArrayList<>();
		for(SalesDTO dto : list) {
			MemberDTO mdto = memberMapper.getMember(dto.getMember_no());
			ProductDTO pdto = productMapper.getProduct(dto.getProduct_no());
			SalesListDTO sdto = new SalesListDTO();
			sdto.setNo(dto.getNo());
			sdto.setMdto(mdto);
			sdto.setPdto(pdto);
			sdto.setPqty(dto.getQty());
			sdto.setSales_date(dto.getSales_date());
			slist.add(sdto);
		}
		req.setAttribute("salesList", slist);
		return "admin/sales/sales_list";
	}
	
	@RequestMapping("/searchSales.do")
	public String searchSales(HttpServletRequest req, @RequestParam Map<String, String> map) {
		List<SalesDTO> list = salesMapper.listSales();
		List<SalesListDTO> slist = new ArrayList<>();
		for(SalesDTO dto : list) {
			MemberDTO mdto = memberMapper.getMember(dto.getMember_no());
			ProductDTO pdto = productMapper.getProduct(dto.getProduct_no());
			SalesListDTO sdto = new SalesListDTO();
			sdto.setNo(dto.getNo());
			sdto.setMdto(mdto);
			sdto.setPdto(pdto);
			sdto.setPqty(dto.getQty());
			sdto.setSales_date(dto.getSales_date());
			if (map.get("search").equals("indate")) {
				if (map.get("searchString").equals(dto.getSales_date())){
					slist.add(sdto);
				}
			}else if (map.get("search").equals("name")) {
				if (map.get("searchString").equals(sdto.getMdto().getName())){
					slist.add(sdto);
				}
			}else if (map.get("search").equals("pname")) {
				if (map.get("searchString").equals(sdto.getPdto().getPname())){
					slist.add(sdto);
				}
			}			
		}
		req.setAttribute("salesList", slist);
		return "admin/sales/sales_list";
		
	}
}
