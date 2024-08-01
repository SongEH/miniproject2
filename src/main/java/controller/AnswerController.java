package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.AnswerDao;
import vo.AnswerVo;
import vo.MemberVO;

@Controller
@RequestMapping("/answer/")
public class AnswerController {

	@Autowired
	AnswerDao answer_dao;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	public AnswerController() {
		System.out.println("---------Replycontroller()------------");
	}
	
/*--------------------------------ANSWER LIST----------------------------------*/	
	@RequestMapping("list.do")
	public String list(int b_idx ,Model model) {
		
		
		List<AnswerVo> list = answer_dao.seletList(b_idx);
		
						
		model.addAttribute("list", list);
		
		
		return "answer/answer_list";
	}
/*--------------------------------ANSWER LIST----------------------------------*/
	
	
	
/*--------------------------------ANSWER INSERT----------------------------------*/
	// /comment/insert.do?cmt_content=내용&b_idx=5&mem_idx=2&mem_name=일길동
		@RequestMapping(value="insert.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String insert(AnswerVo vo) {


			String a_content = vo.getA_content().replaceAll("\n", "<br>");
			vo.setA_content(a_content);
			
			int res = answer_dao.insert(vo);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
			
			
			return json.toString();
		}
/*--------------------------------ANSWER INSERT----------------------------------*/	
		
		
		
/*--------------------------------ANSWER DELETE----------------------------------*/			
		// /comment/delete.do?cmt_idx=5
		@RequestMapping(value="delete.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String delete(int a_idx) {
			
			
			int res = answer_dao.delete(a_idx);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
					
			return json.toString();
		}
	
		
/*--------------------------------ANSWER DELETE----------------------------------*/				
		

		
/*--------------------------------ANSWER MODIFY_FORM----------------------------------*/
	@RequestMapping("modify_form.do")
	public String modify(int a_idx, AnswerVo vo,
						Model model, RedirectAttributes ra) {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if(user == null) {
			
		ra.addAttribute("reason", "session_timeout");
		
		return "redirect:../member/login_form.do";
		}	
		
		vo = answer_dao.selectOne(a_idx);
		
		model.addAttribute("vo", vo);
		
				
		return "/board/board_answer_modify_form";
	}
	
	
		
/*--------------------------------ANSWER MODIFY_FORM----------------------------------*/


	
/*--------------------------------ANSWER MODIFY_FORM----------------------------------*/
	@RequestMapping("modify.do")
	public String modify(int b_idx, AnswerVo vo, RedirectAttributes ra) {
		
		int res = answer_dao.update(vo);
	
		
		System.out.println("a_idx" + vo.getA_idx());
		System.out.println("a_content" + vo.getA_content());
		System.out.println("b_idx" + vo.getB_idx());
		/*
		 * String a_content = vo.getA_content().replaceAll("\n", "<br>");
		 * 
		 * vo.setA_content(a_content);
		 */
		System.out.println("b_cate" + vo.getB_cate());
		
		String b_cate = "medical";
		
		ra.addAttribute("b_idx", b_idx);
		ra.addAttribute("b_cate", b_cate);
				
		return "redirect:../board/view.do?";
	}
/*--------------------------------ANSWER MODIFY_FORM----------------------------------*/		
		
		
		
		
		
		

}
