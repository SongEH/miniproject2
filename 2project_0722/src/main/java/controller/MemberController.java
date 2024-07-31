package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.MemberDao;
import vo.MemberVo;
=======
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.MemberDAO;
import dao.PetDAO;
import vo.MemberVO;
import vo.PetVO;
>>>>>>> main

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;
<<<<<<< HEAD

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

=======
	
    @Autowired
    private MemberDAO memberDAO;
    
    @Autowired
    private PetDAO petDAO;

    // 관리자 페이지
    @RequestMapping("list.do")
    public String list(Model model, 
                       @RequestParam(value = "page", defaultValue = "1") int page,
                       @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                       @RequestParam(value = "gradeFilter", required = false) String gradeFilter,
                       @RequestParam(value = "yearFilter", required = false) String yearFilter) {
        int limit = 10;
        int offset = (page - 1) * limit;

        List<MemberVO> members = memberDAO.getMembersWithPaging(offset, limit, searchKeyword, gradeFilter, yearFilter);
        int totalMembers = memberDAO.getMemberCount(searchKeyword, gradeFilter, yearFilter);
        int totalPages = (int) Math.ceil(totalMembers / (double) limit);
        int startPage = Math.max(1, page - 2);
        int endPage = Math.min(startPage + 4, totalPages);

        model.addAttribute("members", members);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("gradeFilter", gradeFilter);
        model.addAttribute("yearFilter", yearFilter);

        return "member/memberList";
    }

    @RequestMapping("detail.do")
    public String detail(@RequestParam(value = "m_idx", defaultValue = "0") int m_idx, Model model) {
        MemberVO member = memberDAO.getMemberById(m_idx);
        model.addAttribute("member", member);
        return "member/memberDetail";
    }

    @RequestMapping(value = "modify.do", method = RequestMethod.GET)
    public String editForm(int m_idx, Model model) {
        MemberVO member = memberDAO.getMemberById(m_idx);
        model.addAttribute("member", member);
        return "member/memberModify";
    }
    
    @RequestMapping(value = "modify.do", method = RequestMethod.POST)
    public String edit(MemberVO member) {
        memberDAO.updateMember(member);
        return "redirect:list.do";
    }

    @RequestMapping("delete.do")
    public String delete(int m_idx) {
        memberDAO.deleteMember(m_idx);
        return "redirect:list.do";
    }
    
    // 마이 페이지
    @RequestMapping("mypage.do")
    public String mypage(HttpSession session, Model model) {
        MemberVO user = (MemberVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:login_form.do";
        }
        MemberVO member = memberDAO.getMemberById(user.getM_idx());
        model.addAttribute("member", member);
        return "member/myPage";
    }

    @RequestMapping(value = "mypage/modify.do", method = RequestMethod.GET)
    public String myPageEditForm(int m_idx, Model model) {
        MemberVO member = memberDAO.getMemberById(m_idx);
        model.addAttribute("member", member);
        return "member/myPageModify";
    }
    
    @RequestMapping(value = "mypage/modify.do", method = RequestMethod.POST)
    public String myPageEdit(MemberVO member) {
        memberDAO.updateMemberForUser(member);
        return "redirect:../mypage.do?m_idx=" + member.getM_idx();
    }

    @RequestMapping(value = "mypage/delete.do", method = RequestMethod.POST)
    public String deleteMember(@RequestParam int m_idx) {
        memberDAO.deleteMember(m_idx);
        return "redirect:/";
    }
    
>>>>>>> main
	// 회원가입 폼 띄우기
	@RequestMapping("insert_form.do")
	public String insert_form() {

		return "member/member_insert_form";
	}
<<<<<<< HEAD

	// 회원가입
	@RequestMapping("insert.do")
	public String insert(MemberVo vo) {

		int res = member_dao.insert(vo);

		return "redirect:login_form.do";
	}

=======
	
	// 회원가입
	@RequestMapping("insert.do")
	public String insert(MemberVO vo) {

		int res = memberDAO.insert(vo);

		return "redirect:login_form.do";
	}
	
>>>>>>> main
	// 닉네임 중복체크
	@RequestMapping(value = "check_nickname.do", produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String check_nickname(String m_nickname) {

<<<<<<< HEAD
		MemberVo vo = member_dao.selectName(m_nickname);
=======
		MemberVO vo = memberDAO.selectName(m_nickname);
>>>>>>> main

		boolean bResult = (vo == null);

		JSONObject json = new JSONObject();
		json.put("result", bResult);

		return json.toString();
	}
<<<<<<< HEAD

=======
	
>>>>>>> main
	// 로그인 폼 띄우기
	@RequestMapping("login_form.do")
	public String login_form() {

		return "member/member_login_form";
	}

	// 로그인하기
	@RequestMapping("login.do")
	public String login(String m_email, String m_pwd, String url, RedirectAttributes ra) {
<<<<<<< HEAD
		MemberVo user = member_dao.selectOne(m_email);
=======
		MemberVO user = memberDAO.selectOne(m_email);
>>>>>>> main

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
<<<<<<< HEAD

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

=======
>>>>>>> main
}
