package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.MemberDao;
import vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	
	//요청시마다 연결 
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	// 처음에 1회 연결 
	@Autowired
	MemberDao member_dao;

	public MemberController() {
		// TODO Auto-generated constructor stub
		System.out.println("----------MemberController()-------");
	}
	
//-------------------member_login_form--------------------------------
	// class requestMapping + method requestMapping => /member/login_form.do
	@RequestMapping("login_form.do")
	public String login_form() {
		
		return "member/member_login_form";
	}
	
//-------------------member_login_form--------------------------------
	
//-------------------member_login-------------------------------------
	@RequestMapping("login.do")
	public String login(String mem_id, String mem_pwd, Model model, RedirectAttributes ra) {
		
		MemberVo user = member_dao.selectOne(mem_id);
		
		//아이디 검증 
		if(user==null) {
	
			//RedirectAttributes =? redirect시 parameter로 이용된다. 
			ra.addAttribute("reason", "fail_id");
			
			return "redirect:login.form.do";
		}
		
		//비밀번호 검증 
		if(user.getMem_pwd().equals(mem_pwd)==false) {
			
//			response.sendRedirect("login_form.do?reason=fail_pwd&mem_id=" + mem_id);
			
			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("mem_pwd", mem_pwd);
				
			return "redirect:login.form.do";
		}
			
		//로그인처리: 현재 로그인된 객체(user)정보를 session저장
		session.setAttribute("user", user);
		
		return "redirect:../board/list.do";
	}
//-------------------member_login-------------------------------------
	
	//로그아웃
	
	@RequestMapping("logout.do")
	public String logout() {
		
		session.removeAttribute("user");
		
	return "redirect:../board/list.do";
	}
	

	
	
}
