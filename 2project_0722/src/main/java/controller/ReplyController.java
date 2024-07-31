package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReplyDao;
import util.Mycommon;
import util.Paging;
import vo.ReplyVo;

@Controller
@RequestMapping("/reply/")
public class ReplyController {

	@Autowired
	ReplyDao reply_dao;
	
	@Autowired
	HttpServletRequest request;
	
	public ReplyController() {
		System.out.println("---------Replycontroller()------------");
	}
	
/*--------------------------------REPLY LIST----------------------------------*/	
	@RequestMapping("list.do")
	public String list(int b_idx,
            			@RequestParam(name="page",defaultValue = "1") int nowPage, 
        					Model model) {
		
//		System.out.println("nowPage" + nowPage);
		
		//댓글 보여질 갯수
		int start = (nowPage-1) * Mycommon.reply.BLOCK_LIST + 1;
		int end   = start + Mycommon.reply.BLOCK_LIST - 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_idx", b_idx);
		map.put("start", start);
		map.put("end", end);
		
		List<ReplyVo> list = reply_dao.select_list(map);
		
				
		//Paging Menu 만들기
		//b_idx에 댓글의 갯수 구한다
	    int rowTotal = reply_dao.selectRowTotal(b_idx);
		
//	    System.out.println("rowTotal ===="  + rowTotal);
//	    System.out.println("nowPage ===="  + nowPage);

	    
		
		String pageMenu_reply = Paging.getReplyPaging(nowPage, 
				                                  rowTotal, 
				                                  Mycommon.reply.BLOCK_LIST,
				                                  Mycommon.reply.BLOCK_PAGE);
		
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu_reply", pageMenu_reply);
		
		return "reply/reply_list";
	}
/*--------------------------------REPLY LIST----------------------------------*/
	
	
	
/*--------------------------------REPLY INSERT----------------------------------*/
	// /comment/insert.do?cmt_content=내용&b_idx=5&mem_idx=2&mem_name=일길동
		@RequestMapping(value="insert.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String insert(ReplyVo vo) {


			
			String re_content = vo.getRe_content().replaceAll("\n", "<br>");
			vo.setRe_content(re_content);
			
			int res = reply_dao.insert(vo);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
			
			
			return json.toString();
		}
/*--------------------------------REPLY INSERT----------------------------------*/	
		
		
		
/*--------------------------------REPLY DELETE----------------------------------*/			
		// /comment/delete.do?cmt_idx=5
		@RequestMapping(value="delete.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String delete(int re_idx) {
			
			
			int res = reply_dao.delete(re_idx);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
					
			return json.toString();
		}
	
		
/*--------------------------------REPLY DELETE----------------------------------*/				
		

		
		
		
		
		
		
		

}
