package com.kgitbank.webProject01;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private SalesMapper salesMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/memberSsn.do")
	public String memberSsn() {
		return "member/memberSsn";
	}
	
	@RequestMapping("/checkMember.do")
	public String checkMember(HttpServletRequest req, 
								@RequestParam Map<String, String> map) {
		String name = map.get("name");
		String ssn1 = map.get("ssn1");
		String ssn2 = map.get("ssn2");
		int res = memberMapper.checkMember(map);  
		if (res == 1) {
			req.setAttribute("msg", "이미 회원이십니다. 로그인을 해 주세요!!");
			return "closeWindow";
		}else {
			req.setAttribute("msg", "회원가입페이지로 이동합니다.");
			req.setAttribute("url", "member_input.do");
			HttpSession session = req.getSession();
			session.setAttribute("name", name);
			session.setAttribute("ssn1", ssn1);
			session.setAttribute("ssn2", ssn2);
			return "message";
		}
	}
	
	@RequestMapping("/member_input.do")
	public String member_input() {
		return "member/member_input";
	}
	
	@RequestMapping("/member_input_ok.do")
	public String member_input_ok(HttpServletRequest req, 
												@ModelAttribute MemberDTO dto) {
		int res = memberMapper.insertMember(dto);
		if (res>0) {
			req.setAttribute("msg", "회원가입 성공!! 로그인을 해 주세요!!");
			return "closeWindow";
		}else {
			req.setAttribute("msg", "회원가입 실패!! 회원가입페이지로 이동합니다!!");
			req.setAttribute("url", "memberSsn.do");
			return "message";
		}
	}
	
	@RequestMapping("/login_ok.do")
	public String login_ok(HttpServletRequest req, 
								HttpServletResponse resp,
									@RequestParam Map<String, String> map) {
		int res = memberMapper.loginCheck(map);
		String msg = null, url = "login.do";
		switch(res) {
		case 0 :
			Cookie ck = new Cookie("saveId", map.get("id"));
			if (map.containsKey("saveId")){
				ck.setMaxAge(24*60*60);
			}else {
				ck.setMaxAge(0);
			}
			resp.addCookie(ck); 
			MemberDTO dto = memberMapper.getMember(map.get("id"));
			HttpSession session = req.getSession();
			session.setAttribute("mdto", dto);
			msg = dto.getName()+"님이 로그인 되었습니다.";
			if (dto.getName().equals("admin")) {
				url = "admin_index.do";
			}else {
				url = "index.do";
			}
			break;
		case 1 :
			msg = "없는 아이디 입니다. 다시 확인해 보세요";
			break;
		case 2 :
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요";
			break;
		case -1 :
			msg = "DB서버 오류 발생!! 관리자에게 문의하세요";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("msg", "로그아웃 되었습니다.");
		req.setAttribute("url", "index.do");
		return "message";
	}
	@RequestMapping("/searchMember.do")
	public String searchMember() {
		return "member/searchMember";
	}
	
	@RequestMapping("/searchMember_ok.do")
	public String searchMember_ok(HttpServletRequest req, 
								@RequestParam Map<String, String> map) {
		String msg = memberMapper.searchMember(map);
		if (msg == null){
			if (map.get("id")==null){
				msg = "찾는 아이디가 없습니다. 다시 입력해 주세요";
			}else {
				msg = "해당하는 비밀번호가 존재하지 않습니다. 다시 입력해 주세요";
			}
		}
		req.setAttribute("msg", msg);
		return "closeWindow";
	}
	
	@RequestMapping("/member_list.do")
	public String member_list(HttpServletRequest req) {
		List<MemberDTO> list = memberMapper.listMember();
		req.setAttribute("listMember", list);
		return "admin/member/member_list";
	}
	
	@RequestMapping("/member_find.do")
	public String member_find(HttpServletRequest req, 
							@RequestParam Map<String, String> map) {
		List<MemberDTO> find = memberMapper.findMember(map);
		req.setAttribute("listMember", find);
		return "admin/member/member_list";
	}
	
	@RequestMapping("/member_delete.do")
	public String member_delete(HttpServletRequest req, 
															@RequestParam int no) {
		int res = memberMapper.deleteMember(no);
		if (res>0) {
			req.setAttribute("msg", "회원삭제 성공!! 회원보기페이지로 이동합니다.");
			req.setAttribute("url", "member_list.do");
		}else {
			req.setAttribute("msg", "회원삭제 실패!! 회원보기페이지로 이동합니다.");
			req.setAttribute("url", "member_list.do");
		}
		return "message";
	}
	
	@RequestMapping("/myreport.do")
	public String myreport(HttpServletRequest req, @RequestParam int no) {
		MemberDTO mdto = memberMapper.getMember(no);
		List<SalesDTO> list = salesMapper.listSales(no);
		List<SalesListDTO> slist = new ArrayList<>();
		for(SalesDTO dto : list) {
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
		return "member/report";
	}
	
	@RequestMapping("/member_update.do")
	public String member_update(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
		int res = memberMapper.updateMember(dto);
		if (res>0) {
			req.setAttribute("msg", "회원수정 성공!! 메인페이지로 이동합니다.");
			req.setAttribute("url", "index.do");
		}else {
			req.setAttribute("msg", "회원수정 실패!! 메인페이지로 이동합니다.");
			req.setAttribute("url", "index.do");
		}
		return "message";
	}
}






