package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.MemberDao;
import vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
//	@Qualifier("member_dao")
	MemberDao member_dao;

	// 회원조회
	@RequestMapping("list.do")
	public String list(Model model) {

		List<MemberVo> list = member_dao.selectList();

		model.addAttribute("list", list);

		return "member/member_list";
	}

	// 회원가입 폼 띄우기
	@RequestMapping("insert_form.do")
	public String insert_form() {

		return "member/member_insert_form";
	}

	// 회원가입
	@RequestMapping("insert.do")
	public String insert(MemberVo vo) {

		int res = member_dao.insert(vo);

		return "redirect:login_form.do";
	}

	// 닉네임 중복체크
	@RequestMapping(value = "check_nickname.do", produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String check_nickname(String m_nickname) {

		MemberVo vo = member_dao.selectName(m_nickname);

		boolean bResult = (vo == null);

		JSONObject json = new JSONObject();
		json.put("result", bResult);

		return json.toString();
	}

	// 로그인 폼 띄우기
	@RequestMapping("login_form.do")
	public String login_form() {

		return "member/member_login_form";
	}

	// 로그인하기
	@RequestMapping("login.do")
	public String login(String m_email, String m_pwd, String url, RedirectAttributes ra) {
		MemberVo user = member_dao.selectOne(m_email);

		if (user == null) {

			// RedirectAttributes=> redirect시 parameter로 이용된다
			ra.addAttribute("reason", "fail_email");

			return "redirect:login_form.do";
		}

		// 비밀번호가 틀린경우
		if (user.getM_pwd().equals(m_pwd) == false) {

			// response.sendRedirect("login_form.do?reason=fail_pwd&mem_id=" + mem_id);
			// RedirectAttributes=> redirect시 parameter로 이용된다
			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("m_email", m_email);

			return "redirect:login_form.do";
		}

		// 로그인처리: 현재 로그인된 객체(user)정보를 session저장
		session.setAttribute("user", user);

		if (url.isEmpty())
			return "redirect:../main.do";
		else
			return "redirect:" + url;
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {

		session.removeAttribute("user");

		return "redirect:../main.do"; // 로그아웃을 할 경우 메인페이지로 이동
	}

	// 회원 삭제
	@RequestMapping("delete.do")
	public String delete(int m_idx, RedirectAttributes ra) {

		MemberVo user = (MemberVo) session.getAttribute("user");

		if (user.getM_grade().equals("일반")) {
			session.removeAttribute("user");

		}

		if (user.getM_grade().equals("관리자") && user.getM_idx() == m_idx) {

			ra.addAttribute("reason", "not_admin_delete");
			return "redirect:list.do";
		}

		int res = member_dao.delete(m_idx);

		return "redirect:../main.do";
	}

	// 수정폼 띄우기
	@RequestMapping("modify_form.do")
	public String modify_form(int m_idx, Model model) {

		MemberVo vo = member_dao.selectOne(m_idx);

		model.addAttribute("vo", vo);

		return "member/member_modify_form";
	}

	// 수정하기
	@RequestMapping("modify.do")
	public String modify(MemberVo vo) {

		/*
		 * // MemberVo log_user = member_dao.selectOne(vo.getM_idx()); // //
		 * if(log_user.getM_idx()==vo.getM_idx()) { // MemberVo user =
		 * member_dao.selectOne(vo.getM_idx()); // // session.setAttribute("user",
		 * user); // } // // int res = member_dao.update(vo);
		 */
		return "redirect:../"; // 수정할 경우 마이페이지로 이동
	}

}
