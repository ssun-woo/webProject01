package com.kgitbank.webProject01;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kgitbank.webProject01.dto.CategoryDTO;
import com.kgitbank.webProject01.dto.ProductDTO;
import com.kgitbank.webProject01.service.CategoryMapper;
import com.kgitbank.webProject01.service.ProductMapper;

@Controller
public class ProductController {
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping(value="/prod_input.do", method=RequestMethod.GET)
	public String prod_input(HttpServletRequest req) {
		List<CategoryDTO> clist = categoryMapper.listCate();
		req.setAttribute("listCate", clist);
		return "admin/shop/product/prod_input";
	}
	
	@RequestMapping(value="/prod_input.do", method=RequestMethod.POST)
	public String prod_input_ok(HttpServletRequest req, 
					@ModelAttribute ProductDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setPimage("");
		}
		//상품이미지 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("pimage");
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		File target = new File(upPath, file.getOriginalFilename());
		if (file.getSize()>0) {
			try {
				file.transferTo(target);
			}catch(IOException e) {}
		}
		//image와 pcategory_fk는 재 설정을 해준다
		dto.setPimage(file.getOriginalFilename());
		dto.setPcategory_fk(dto.getPcategory_fk() + req.getParameter("pcode"));
		
		int res = productMapper.insertProduct(dto);
		if (res>0) {
			req.setAttribute("msg", "상품 등록 성공!! 카테고리목록페이지로 이동합니다.");
			req.setAttribute("url", "prod_list.do");
		}else {
			req.setAttribute("msg", "상품 등록 실패!! 카테고리 등록페이지로 이동합니다.");
			req.setAttribute("url", "prod_input.do");
		}
		return "message";
	}
	
	@RequestMapping("/prod_list.do")
	public String prod_list(HttpServletRequest req) {
		List<ProductDTO> plist = productMapper.listProduct();
		req.setAttribute("listProduct", plist);
		return "admin/shop/product/prod_list";
	}
	
	@RequestMapping("/prod_delete.do")
	public String prod_delete(HttpServletRequest req,
								@RequestParam Map<String, String> map) {
		int res = productMapper.deleteProduct(Integer.parseInt(map.get("pnum")));
		if (res>0) {
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/resources");
			File file = new File(upPath, map.get("pimage"));
			if (file.exists()) {
				file.delete();
				req.setAttribute("msg", "상품 삭제 성공(이미지 삭제 성공)!! 카테고리 목록페이지로 이동합니다.");
			}else {
				req.setAttribute("msg", "상품 삭제 성공!! 카테고리 목록페이지로 이동합니다.");
			}
			req.setAttribute("url", "prod_list.do");
			
		}else {
			req.setAttribute("msg", "상품 삭제 실패!! 카테고리 목록페이지로 이동합니다.");
			req.setAttribute("url", "prod_list.do");
		}
		return "message";
	}
	
	@RequestMapping("/prod_view.do")
	public String prod_view(HttpServletRequest req, @RequestParam int pnum) {
		ProductDTO dto = productMapper.getProduct(pnum);
		req.setAttribute("getProduct",  dto);
		return "admin/shop/product/prod_view";
	}
	
	@RequestMapping(value="/prod_update.do", method=RequestMethod.GET)
	public String prod_update(HttpServletRequest req, @RequestParam int pnum) {
		ProductDTO dto = productMapper.getProduct(pnum);
		req.setAttribute("getProduct", dto);
		return "admin/shop/product/prod_update";
	}
	
	@RequestMapping(value="/prod_update.do", method=RequestMethod.POST)
	public String prod_update_ok(HttpServletRequest req, 
					@ModelAttribute ProductDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setPimage("");
		}
		//상품이미지 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("pimage");
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		if (file.getSize()>0) {
			try {
				File target = new File(upPath, file.getOriginalFilename());
				file.transferTo(target);
				dto.setPimage(file.getOriginalFilename());
			}catch(IOException e) {}
		}else {
			dto.setPimage(req.getParameter("pimage2"));
		}
		//image와 pcategory_fk는 재 설정을 해준다
		dto.setPcategory_fk(dto.getPcategory_fk() + req.getParameter("pcode"));
		
		int res = productMapper.updateProduct(dto);
		if (res>0) {
			req.setAttribute("msg", "상품 수정 성공!! 카테고리목록페이지로 이동합니다.");
			req.setAttribute("url", "prod_list.do");
		}else {
			req.setAttribute("msg", "상품 수정 실패!! 카테고리 등록페이지로 이동합니다.");
			req.setAttribute("url", "prod_update.do?pnum="+dto.getPnum());
		}
		return "message";
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
