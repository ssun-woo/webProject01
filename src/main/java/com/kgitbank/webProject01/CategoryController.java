package com.kgitbank.webProject01;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.webProject01.dto.CategoryDTO;
import com.kgitbank.webProject01.service.CategoryMapper;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@RequestMapping(value="/cate_input.do", method=RequestMethod.GET)
	public String cate_input() {
		return "admin/shop/category/cate_input";
	}
	
	@RequestMapping(value="/cate_input.do", method=RequestMethod.POST)
	public String cate_input_ok(HttpServletRequest req, 
										@ModelAttribute CategoryDTO dto) {
		int res = categoryMapper.insertCate(dto);
		if (res>0) {
			req.setAttribute("msg", "카테고리 등록 성공!! 카테고리목록페이지로 이동합니다.");
			req.setAttribute("url", "cate_list.do");
		}else {
			req.setAttribute("msg", "카테고리 등록 실패!! 카테고리 등록페이지로 이동합니다.");
			req.setAttribute("url", "cate_input.do");
		}
		return "message";
	}
	
	@RequestMapping("/cate_delete.do")
	public String cate_delete(HttpServletRequest req, @RequestParam int cnum) {
		int res = categoryMapper.deleteCate(cnum);
		if (res>0) {
			req.setAttribute("msg", "카테고리 삭제 성공!! 카테고리목록페이지로 이동합니다.");
			req.setAttribute("url", "cate_list.do");
		}else {
			req.setAttribute("msg", "카테고리 삭제 실패!! 카테고리 등록페이지로 이동합니다.");
			req.setAttribute("url", "cate_list.do");
		}
		return "message";
	}
	
	@RequestMapping("/cate_list.do")
	public String cate_list(HttpServletRequest req){
		List<CategoryDTO> list = categoryMapper.listCate();
		req.setAttribute("listCate", list);
		return "admin/shop/category/cate_list";
	}
}
