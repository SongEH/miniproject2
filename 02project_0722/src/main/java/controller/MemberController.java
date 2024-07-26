package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDAO;
import dao.PetDAO;
import vo.MemberVO;
import vo.PetVO;

@Controller
@RequestMapping("/member/")
public class MemberController {

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
        int limit = 20;
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
    public String mypage(@RequestParam(value = "m_idx", defaultValue = "0") int m_idx, Model model) {
        MemberVO member = memberDAO.getMemberById(m_idx);
        List<PetVO> pets = petDAO.getPetsByMemberId(m_idx);
        model.addAttribute("member", member);
        model.addAttribute("pets", pets);
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
        memberDAO.updateMember(member);
        return "redirect:mypage.do?m_idx=" + member.getM_idx();
    }

    @RequestMapping(value = "mypage/delete.do", method = RequestMethod.POST)
    public String deleteMember(@RequestParam int m_idx) {
        memberDAO.deleteMember(m_idx);
        return "redirect:/";
    }
}
