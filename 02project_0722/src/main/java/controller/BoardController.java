package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.BoardDAO;
import vo.BoardVO;
import vo.MemberVO;

@Controller
@RequestMapping("/board/")
public class BoardController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    @Autowired
    @Qualifier("boardDAO")
    private BoardDAO boardDAO;

    @RequestMapping("list.do")
    public String list(Model model) {
        List<BoardVO> list = boardDAO.getAllBoards();
        model.addAttribute("list", list);
        return "board/boardList";
    }

    @RequestMapping("insert_form.do")
    public String insertForm() {
        return "board/boardInsertForm";
    }

    @RequestMapping("insert.do")
    public String insert(BoardVO vo, RedirectAttributes ra) {
        MemberVO user = (MemberVO) session.getAttribute("user");

        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            return "redirect:../member/login_form.do";
        }

        vo.setM_idx(user.getM_idx());
        vo.setM_name(user.getM_name());
        vo.setB_ip(request.getRemoteAddr());
        vo.setB_content(vo.getB_content().replaceAll("\n", "<br>"));

        boardDAO.createBoard(vo);

        return "redirect:list.do";
    }
}

