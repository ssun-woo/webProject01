package com.kgitbank.webProject01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(path= {"/", "index.do"})
	public String home() {
		return "index";
	}
	
	@RequestMapping(value= "/company.do")
	public String company() {
		return "company";
	}
	
}
