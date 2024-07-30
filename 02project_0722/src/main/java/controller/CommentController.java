package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CommentDao;
import util.MyCommon;
import util.Paging;
import vo.CommentVo;
import vo.ReplyVo;

@Controller
@RequestMapping("/comment/")
public class CommentController {

	@Autowired
	CommentDao cmt_dao;
	

	
/* ---------------------------COMMENT LIST------------------------------*/
	@RequestMapping("list.do")
	public String list(int b_idx,
			@RequestParam(name="page",defaultValue = "1") int nowPage, 
				Model model) {

		//댓글 보여질 갯수
		int start = (nowPage-1) * MyCommon.reply.BLOCK_LIST + 1;
		int end   = start + MyCommon.reply.BLOCK_LIST - 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_idx", b_idx);
		map.put("start", start);
		map.put("end", end);
		
		List<ReplyVo> list = cmt_dao.select_list(map);
		
			
		//Paging Menu 만들기
		//b_idx에 댓글의 갯수 구한다
		int rowTotal = cmt_dao.selectRowTotal(b_idx);
		
		
		String pageMenu = Paging.getReplyPaging(nowPage, 
			                                  rowTotal, 
			                                  MyCommon.reply.BLOCK_LIST,
			                                  MyCommon.reply.BLOCK_PAGE);
		
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		return "comment/comment_list";
	}
/* ---------------------------COMMENT LIST------------------------------*/
	
	@RequestMapping("reply_list.do")
	public String reply_list(int cmt_idx, Model model) {
		
		//댓글 리스트 구하기
		
		List<CommentVo> vo = cmt_dao.select_list(cmt_idx);
		
		model.addAttribute("vo", vo);
		
		return "comment/comment_list";
	}
/* ---------------------------COMMENT LIST------------------------------*/	
	
	
	
/* ---------------------------COMMENT INSERT------------------------------*/	
	@RequestMapping(value="insert.do", produces = "application/json; charset=utf-8")
	public String insert(CommentVo vo) {
		
		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);
		
		int res = cmt_dao.insert(vo);
		
		JSONObject json = new JSONObject();
		json.put("result", res==1); // {"result": true } or {"result": false }
		
		
		return json.toString();
	}
/* ---------------------------COMMENT INSERT------------------------------*/	
	

	
/* ---------------------------COMMENT DELETE------------------------------*/	
	@RequestMapping(value="delete.do", produces = "application/json; charset=utf-8" )
	@ResponseBody
	public String modify(int cmt_idx) {
		
				int res = cmt_dao.delete(cmt_idx);
		
		JSONObject json = new JSONObject();
		json.put("result", res==1); // {"result": true } or {"result": false }
		
		
		return json.toString();
	}
/* ---------------------------COMMENT DELETE------------------------------*/		

	
}
