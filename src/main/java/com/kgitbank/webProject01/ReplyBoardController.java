package com.kgitbank.webProject01;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.webProject01.dto.ReplyBoardDTO;
import com.kgitbank.webProject01.service.ReplyBoardMapper;

@Controller
public class ReplyBoardController {
	
	@Autowired
	private ReplyBoardMapper replyBoardMapper;
	
	@RequestMapping("/board2_list.do")
	public String listBoard(HttpServletRequest req) {
		List<ReplyBoardDTO> list = replyBoardMapper.listBoard();
		req.setAttribute("listBoard", list);
		return "board2/list";
	}
	
	@RequestMapping(value="/board2_write.do", method=RequestMethod.GET)
	public String writeFormBoard(HttpServletRequest req, 
								@RequestParam Map<String, String> map) {
		if (map.size() == 0) {
			req.setAttribute("num", "0");
			req.setAttribute("re_step", "0");
			req.setAttribute("re_level", "0");
		}else {
			req.setAttribute("num", map.get("num"));
			req.setAttribute("re_step", map.get("re_step"));
			req.setAttribute("re_level", map.get("re_level"));
		}
		return "board2/writeForm";
	}
	
	@RequestMapping(value="/board2_write.do", method=RequestMethod.POST)
	public String writeProBoard(HttpServletRequest req, 
										@ModelAttribute ReplyBoardDTO dto) {
		dto.setIp(req.getRemoteAddr());
		String sql = null;
		if (dto.getNum() == 0) {
			sql = "update board set re_step = re_step + 1";
		}else {
			sql = "update board set re_step = re_step + 1 where re_step > " + dto.getRe_step();
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}
		Map<String, String> map = new Hashtable<>();
		map.put("sql", sql);
		replyBoardMapper.countRe_step(map);
		int res = replyBoardMapper.insertBoard(dto);
		if (res>0) {
			req.setAttribute("msg", "게시글 등록 성공!! 게시글 목록페이지로 이동합니다.");
			req.setAttribute("url", "board2_list.do");
		}else {
			req.setAttribute("msg", "게시글 등록 실패!! 게시글 등록페이지로 이동합니다.");
			req.setAttribute("url", "board2_write.do");
		}
		return "message";
	}
	
	@RequestMapping("/board2_content.do")
	public String contentBoard(HttpServletRequest req, 
												@RequestParam int num) {
		replyBoardMapper.plusReadcount(num);
		ReplyBoardDTO dto = replyBoardMapper.getBoard(num); 
		req.setAttribute("getBoard", dto);
		return "board2/content";
	}
	
	@RequestMapping(value="/board2_delete.do", method=RequestMethod.GET)
	public String deleteFormBoard() {
		return "board2/deleteForm";
	}
	@RequestMapping(value="/board2_delete.do", method=RequestMethod.POST)
	public String deleteProBoard(HttpServletRequest req, 
								@RequestParam Map<String, String> map) {
		ReplyBoardDTO dto = replyBoardMapper.getBoard(Integer.parseInt(map.get("num")));
		int res = -1;
		if (dto.getPasswd().equals(map.get("passwd"))) {
			res = replyBoardMapper.deleteBoard(Integer.parseInt(map.get("num")));
		}
		if (res>0) {
			req.setAttribute("msg", "게시글 삭제 성공!! 게시글 목록페이지로 이동합니다.");
			req.setAttribute("url", "board2_list.do");
		}else if (res==0){
			req.setAttribute("msg", "게시글 삭제 실패!! 게시글 상세보기페이지로 이동합니다.");
			req.setAttribute("url", "board2_content.do?num="+map.get("num"));
		}else {
			req.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해 주세요");
			req.setAttribute("url", "board2_delete.do?num="+map.get("num"));
		}
		return "message";
	}
	
	@RequestMapping(value="/board2_update.do", method=RequestMethod.GET)
	public String updateFormBoard(HttpServletRequest req, 
			@RequestParam int num) {
		ReplyBoardDTO dto = replyBoardMapper.getBoard(num);
		req.setAttribute("getBoard", dto);
		return "board2/updateForm";
	}
	
	@RequestMapping(value="/board2_update.do", method=RequestMethod.POST)
	public String updateProBoard(HttpServletRequest req, 
										@ModelAttribute ReplyBoardDTO dto) {
		ReplyBoardDTO dto2 = replyBoardMapper.getBoard(dto.getNum());
		int res = -1;
		if (dto.getPasswd().equals(dto2.getPasswd())) {
			res = replyBoardMapper.updateBoard(dto);
		}
		if (res>0) {
			req.setAttribute("msg", "게시글 수정 성공!! 게시글 목록페이지로 이동합니다.");
			req.setAttribute("url", "board2_list.do");
		}else if (res==0){
			req.setAttribute("msg", "게시글 수정 실패!! 게시글 상세보기페이지로 이동합니다.");
			req.setAttribute("url", "board2_content.do?num="+dto.getNum());
		}else {
			req.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해 주세요");
			req.setAttribute("url", "board2_update.do?num="+dto.getNum());
		}
		return "message";
	}
}
