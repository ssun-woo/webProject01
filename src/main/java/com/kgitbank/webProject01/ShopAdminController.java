package com.kgitbank.webProject01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopAdminController {
	
	@RequestMapping("/shop_admin.do")
	public String shop_admin() {
		return "admin/shop/index";
	}
}
