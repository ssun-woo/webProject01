package com.kgitbank.webProject01;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.webProject01.dto.CategoryDTO;
import com.kgitbank.webProject01.dto.MemberDTO;
import com.kgitbank.webProject01.dto.ProductDTO;
import com.kgitbank.webProject01.dto.SalesDTO;
import com.kgitbank.webProject01.service.CategoryMapper;
import com.kgitbank.webProject01.service.ProductMapper;
import com.kgitbank.webProject01.service.SalesMapper;

@Controller
public class ShopMallController {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private SalesMapper salesMapper;
	
	@RequestMapping("/mall.do")
	public String mall(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("listCate") == null) {
			List<CategoryDTO> clist = categoryMapper.listCate();
			session.setAttribute("listCate", clist);
		};
		ProductList plist = (ProductList)session.getAttribute("plist");
		List<ProductDTO> hitList, newList, bestList;
		if (plist == null) {
			plist = new ProductList(productMapper);
			hitList = plist.selectBySpec("HIT");
			newList = plist.selectBySpec("NEW");
			bestList = plist.selectBySpec("BEST");
			session.setAttribute("plist", plist);
		}else {
			hitList = plist.getSpecList("HIT");
			newList = plist.getSpecList("NEW");
			bestList = plist.getSpecList("BEST");
		}
		req.setAttribute("hit", hitList);
		req.setAttribute("pnew", newList);
		req.setAttribute("best", bestList);
		return "mall/mall";
	}
	
	@RequestMapping("/mall_cgProdList.do")
	public String cgProdList(HttpServletRequest req, 
								@RequestParam String code) {
		HttpSession session = req.getSession();
		ProductList plist = (ProductList)session.getAttribute("plist");
		List<ProductDTO> cateList = plist.getSpecList(code);
		if (cateList == null) {
			cateList = plist.selectByCode(code); 
		}
		req.setAttribute("code", cateList);
		return "mall/mall_cgProdList";
	}
	
	@RequestMapping("/mall_prodView.do")
	public String prodView(HttpServletRequest req, 
								@RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mdto") == null) {
			req.setAttribute("msg", "로그인을 먼저 해 주세요!!");
			req.setAttribute("url", "login.do");
			return "message";
		}
		ProductList plist = (ProductList)session.getAttribute("plist");
		ProductDTO pdto = plist.getProduct(map.get("select"), map.get("pnum"));
		if (pdto.getPqty() > 0) {
			req.setAttribute("pdto", pdto);
			return "mall/mall_prodView";
		}else {
			req.setAttribute("msg", "상품재고가 부족합니다. 관리자에게 문의해 주세요!!");
			req.setAttribute("url", "mall.do");
			return "message";
		}
	}
	
	@RequestMapping("/mall_cartAdd.do")
	public String cartAdd(HttpServletRequest req, 
						@RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		Hashtable<String, ProductDTO> ht = (Hashtable)session.getAttribute("cartList");
		if (ht == null) {
			ht = new Hashtable<>();
		}
		
		ProductList plist = (ProductList)session.getAttribute("plist");
		ProductDTO pdto = plist.getProduct(map.get("select"), map.get("pnum"));
		if (ht.containsKey(map.get("pnum"))) {
			pdto.setPqty(pdto.getPqty() + Integer.parseInt(map.get("pqty")));
		}else {
			pdto.setPqty(Integer.parseInt(map.get("pqty")));
			ht.put(map.get("pnum"), pdto);
		}
		session.setAttribute("cartList", ht);
		return "forward:mall_cartList.do";
	}
	
	@RequestMapping("/mall_cartList.do")
	public String cartList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Hashtable<String, ProductDTO> ht = (Hashtable)session.getAttribute("cartList");
		if (ht==null || ht.size()==0) {
			req.setAttribute("msg", "장바구니에 담긴 상품이 없습니다.");
			req.setAttribute("url", "mall.do");
			return "message";
		}
		Enumeration<String> enu = ht.keys();
		List<ProductDTO> list = new ArrayList<>();
		int totalPrice = 0, totalPoint = 0;
		while(enu.hasMoreElements()) {
			ProductDTO dto = ht.get(enu.nextElement());
			list.add(dto);
			totalPrice += dto.getPrice() * dto.getPqty();
			totalPoint += dto.getPoint() * dto.getPqty();
		}
		req.setAttribute("cartL", list);
		req.setAttribute("totalPrice", totalPrice);
		req.setAttribute("totalPoint", totalPoint);
		return "mall/mall_cartList";
	}
	
	@RequestMapping("/mall_cartDel.do")
	public String cartDel(HttpServletRequest req, @RequestParam String pnum) {
		HttpSession session = req.getSession();
		Hashtable<String, ProductDTO> ht = (Hashtable)session.getAttribute("cartList");
		ht.remove(pnum);
		return "forward:mall_cartList.do";
	}
	
	@RequestMapping("/mall_cartEdit.do")
	public String cartEdit(HttpServletRequest req, 
									@RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		Hashtable<String, ProductDTO> ht = (Hashtable)session.getAttribute("cartList");
		if (Integer.parseInt(map.get("pqty")) == 0) {
			ht.remove(map.get("pnum"));
		}else {
			ProductDTO dto = ht.get(map.get("pnum"));
			dto.setPqty(Integer.parseInt(map.get("pqty")));
		}
		return "forward:mall_cartList.do";
	}
	
	@RequestMapping("/mall_order.do")
	public String mallOrder(HttpServletRequest req, @RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		List<ProductDTO> list = new ArrayList<>();
		int totalPrice = 0, totalPoint = 0;
		if (map.get("pnum") != null) {
			ProductList plist = (ProductList)session.getAttribute("plist");
			ProductDTO dto = plist.getProduct(map.get("select"), map.get("pnum"));
			dto.setPqty(Integer.parseInt(map.get("pqty")));
			list.add(dto);
			totalPrice = dto.getPrice() * dto.getPqty();
			totalPoint = dto.getPoint() * dto.getPqty();
		}else {
			Hashtable<String, ProductDTO> ht = (Hashtable)session.getAttribute("cartList");
			Enumeration<String> enu = ht.keys();
			while(enu.hasMoreElements()) {
				ProductDTO dto = ht.get(enu.nextElement());
				list.add(dto);
				totalPrice += dto.getPrice() * dto.getPqty();
				totalPoint += dto.getPoint() * dto.getPqty();
			}
		}
		session.setAttribute("order", list);
		req.setAttribute("totalPrice", totalPrice);
		req.setAttribute("totalPoint", totalPoint);
		return "mall/mall_order";
	}
	
	@RequestMapping("/mall_order_ok.do")
	public String mallOrderOk(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<ProductDTO> list = (List)session.getAttribute("order");
		MemberDTO mdto = (MemberDTO)session.getAttribute("mdto");
		for(ProductDTO pdto : list) {
			SalesDTO dto = new SalesDTO();
			dto.setMember_no(mdto.getNo());
			dto.setProduct_no(pdto.getPnum());
			dto.setQty(pdto.getPqty());
			String pspec = pdto.getPspec();
			if (pspec.equals("none")) {
				pspec = pdto.getPcategory_fk().substring(0, 4);
			}
			ProductList plist = (ProductList)session.getAttribute("plist");
			
			ProductDTO sdto = plist.getProduct(pspec, String.valueOf(pdto.getPnum()));
			if (dto.getQty() <= sdto.getPnum()) {
				salesMapper.insertSales(dto);
				productMapper.salesProduct(dto);		
				if (pdto.getPspec().equals("none")) {
					plist.setCodePqty(pspec, String.valueOf(pdto.getPnum()), dto.getQty());
				}else {
					plist.setModePqty(pspec, String.valueOf(pdto.getPnum()), dto.getQty());
				}
			}else {
				req.setAttribute("msg", pdto.getPname()+"의 상품이 부족합니다. 현재 남은 수량은 " + sdto.getPqty()+ "개 입니다.");
				req.setAttribute("url", "mall_order.do");
				return "message";
			}
		}
		if (list.size() > 0) {
			session.removeAttribute("cartList");
		}
		session.removeAttribute("order");
		return "forward:mall.do";
	}
		
}







