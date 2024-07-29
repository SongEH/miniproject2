package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.ognl.ParseException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.DiaryDao;
import vo.FeedingVo;
import vo.HealthVo;
import vo.NoteVo;
import vo.StollVo;
import vo.WeightVo;

@Controller
@RequestMapping("/diary/") 
public class DiaryController {

	public DiaryController() {
		System.out.println("--DiaryController()--");
	}

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	DiaryDao diary_dao; // 인젝션 받아야 한다.

	
	// 다이어리 메인에 표시할 내용. 오늘날짜기준 데이터 표시  
	@RequestMapping("diary_list.do")
	public String diary_list(Model model) {

		List<WeightVo> weight_list = diary_dao.selectList_weight(); 
		// 체중말고도 더하기 
		model.addAttribute("weight_list", weight_list);
		
		return "/diary/diary_list";
	}
	
	
	// 선택한 날짜 기록
	@RequestMapping(value = "diary_select_date.do", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
	public String diary_select_date(String date) {
		System.out.println("컨트롤러 : " + date);
		
		List<WeightVo> weight_list = diary_dao.diary_select_weight_date(date);
		List<StollVo> stoll_list = diary_dao.diary_select_stoll_date(date);
		List<FeedingVo> feeding_list = diary_dao.diary_select_feeding_date(date); 
		List<HealthVo> health_list = diary_dao.diary_select_health_date(date); 
		List<NoteVo> note_list = diary_dao.diary_select_note_date(date); 
		// 체중말고도 더하기
		
		JSONObject json = new JSONObject();
		json.put("weight_list", weight_list);
		json.put("stoll_list", stoll_list);
		json.put("feeding_list", feeding_list);
		json.put("health_list", health_list);
		json.put("note_list", note_list);
		
		
		System.out.println(stoll_list);
		
		return json.toString();
	}
	
	
	// 상세보기. 하나로 통합
	@RequestMapping(value = "diary_view.do", method = RequestMethod.GET)
	public String diary_view(String table_name, int idx, Model model) {
		
		// idx에 해당되는 게시물 1건 얻어오기
        Map<String, Object> map = diary_dao.selectOne(table_name, idx);

        model.addAttribute("map", map);
        model.addAttribute("table_name", table_name);

		// return "diary/diary_view_" + table_name;
        // 나중에 파일 분리하기
        
        return "diary/diary_view";
	}
	

	// 새글쓰기 폼 띄우기
	@RequestMapping("diary_insert_form.do")
	public String diary_insert_form(Model model) {

		String select_date = request.getParameter("select_date");
	
		model.addAttribute("select_date", select_date);
		
		return "diary/diary_insert_form__";
	}
	
	
	// 체중 기록 추가 
	@RequestMapping("diary_insert_weight.do")
	public String diary_insert_weight(WeightVo vo) {
		// m_idx 처리!!!!!! 
		
		int res = diary_dao.diary_insert_weight(vo);

		return "redirect:diary_list.do";
	}
	
	// 산책 기록 추가 
	@RequestMapping("diary_insert_stoll.do")
	public String diary_insert_stoll(StollVo vo) {
		
		// m_idx 처리!!!!!!  
		vo.setM_idx(999); 
		System.out.println(vo);
		int res = diary_dao.diary_insert_stoll(vo);

		return "redirect:diary_list.do";
	}
	
	// 사료 기록 추가 
	@RequestMapping("diary_insert_feeding.do")
	public String diary_insert_feeding(FeedingVo vo) {
		// m_idx 처리!!!!!! 
		
		int res = diary_dao.diary_insert_feeding(vo);

		return "redirect:diary_list.do";
	}
	
	// 진료 기록 추가 
	@RequestMapping("diary_insert_health.do")
	public String diary_insert_health(HealthVo vo) {
		// m_idx 처리!!!!!! 
		
		int res = diary_dao.diary_insert_health(vo);

		return "redirect:diary_list.do";
	}
	
	// 메모 추가
	@RequestMapping("diary_insert_note.do")
	public String diary_insert_note(NoteVo vo) {
		// m_idx 처리!!!!!! 
		
		int res = diary_dao.diary_insert_note(vo);

		return "redirect:diary_list.do";
	}

	
	// 체중 상세보기
	@RequestMapping("diary_view_weight.do")
	public String diary_view_weight(int w_idx, Model model) {

		// b_idx에 해당되는 게시물 1건 얻어오기
		WeightVo vo = diary_dao.selectOne_weight(w_idx);

		model.addAttribute("vo", vo);

		return "diary/diary_view_weight";
	}



	
	
	
	// 수정 폼 띄우기. 하나로 통합
	@RequestMapping("/diary_modify_form.do")
	public String diary_modify_form(String table_name, int idx, Model model) {

		// 수정할 원본 데이터 
        Map<String, Object> map = diary_dao.selectOne(table_name, idx);
		
		// String b_content = vo.getB_content().replaceAll("<br>", "\n");
		// vo.setB_content(b_content);
		
        model.addAttribute("map", map);
        model.addAttribute("table_name", table_name);

		return "diary/diary_modify_form";
	}

	
	// 수정 
	/* @RequestMapping("/diary_modify_weight.do")
	public String diary_modify_weight(WeightVo vo, RedirectAttributes ra) {
		//로그인 유저정보 얻어온다
		//MemberVo user = (MemberVo) session.getAttribute("user");
		
		//사용자정보 vo에 등록
		//vo.setMem_idx(user.getMem_idx());
		//vo.setMem_name(user.getMem_name());		
		
		// \n -> <br>
		// String b_content = vo.getB_content().replaceAll("\n", "<br>");
		// vo.setB_content(b_content);
		
		//DB update
		int res = diary_dao.update_weight(vo);
		
		
		ra.addAttribute("w_idx", vo.getW_idx());
		
		return "redirect:diary_view_weight.do";
	}*/
	
	 		
	@RequestMapping(value = "/diary_modify_{table_name}.do", method = RequestMethod.POST)
	public String diary_modify(@PathVariable String table_name, @RequestParam Map<String, String> params, RedirectAttributes ra) throws java.text.ParseException {
	    // \n -> <br> 처리 (필요 시)
	    if (params.containsKey("content")) {
	        String content = params.get("content").replaceAll("\n", "<br>");
	        params.put("content", content);
	    }

	    System.out.println("params: " + params);

	    // 필요한 타입으로 변환
	    Map<String, Object> paramMap = new HashMap<>();
	    for (Map.Entry<String, String> entry : params.entrySet()) {
	        String key = entry.getKey();
	        String value = entry.getValue();

	        if (value != null && !value.trim().isEmpty()) {
	            try {
	                if (key.endsWith("_idx") || key.equals("m_idx") || key.equals("p_idx") || key.equals("distance")) {
	                    paramMap.put(key, Integer.parseInt(value));
	                } else if (key.equals("cost") || key.equals("w_weight")) {
	                    paramMap.put(key, Double.parseDouble(value));
	                } else if (key.endsWith("_rdate")) {
	                    // String을 java.sql.Date로 변환
	                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                    java.util.Date parsedDate = dateFormat.parse(value);
	                    paramMap.put(key, new java.sql.Date(parsedDate.getTime()));
	                } else if (key.endsWith("_time")) {
	                    // String을 java.sql.Date로 변환
	                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	                    java.util.Date parsedTime = timeFormat.parse(value);
	                    paramMap.put(key, new java.sql.Time(parsedTime.getTime()));  // 여기서 java.sql.Time으로 변환
	                } else {
	                    paramMap.put(key, value);
	                }
	            } catch (NumberFormatException e) {
	                paramMap.put(key, value); // 변환 실패 시 문자열로 저장
	            }
	        } else {
	            paramMap.put(key, null); // 빈 문자열 또는 null일 경우 null로 설정
	        }
	    }

	    // DB update
	    int res = diary_dao.diary_update(table_name, paramMap);

	    // 인덱스 키 선택
	    String idxKey = switch (table_name) {
	        case "weight" -> "w_idx";
	        case "stroll" -> "s_idx";
	        case "feeding" -> "f_idx";
	        case "health" -> "h_idx";
	        case "note" -> "o_idx";
	        default -> throw new IllegalArgumentException("Unexpected value: " + table_name);
	    };

	    // 리디렉션
	    ra.addAttribute("table_name", table_name);
	    ra.addAttribute("idx", paramMap.get(idxKey));

	    return "redirect:diary_view.do";    
	}

	


	
	// 삭제 
	@RequestMapping("diary_delete.do")
	public String diary_delete(String table_name, int idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("table_name", table_name);
		map.put("idx", idx);
		
		int res = diary_dao.diary_delete(map);
		
		return "redirect:diary_list.do";
	}
	
	
	
	
	/*
	// 답글쓰기 폼 띄우기
	@RequestMapping("reply_form.do")
	public String reply_form() {

		return "board/board_reply_form";
	}

	// /b_idx=26&b_subject=zaa&b_content=zzssssss
	// b_idx는 기존글, b_subject, b_content는 새로 답글

	@RequestMapping("reply.do")
	public String reply(BoardVo vo, RedirectAttributes ra) {
		
		// 로그인 정보 얻어옴
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user == null) {
			
			ra.addAttribute("reason", "session_timeout");
			return "redirect:../member/login_form.do";
		}
		
		// 사용자 정보 vo에 등록 
		vo.setMem_idx(user.getMem_idx());
		vo.setMem_name(user.getMem_name());
		
		// 기준글 정보 얻어온다
		BoardVo baseVo = board_dao.selectOne(vo.getB_idx());
		
		// 기존글보다 step이 큰 게시물의 step을 1씩 증가 
		// 답글달 자리 뒤에 있는 글들을 한칸씩 밑으로 내리기 위함 
		int res = board_dao.update_step(baseVo); // 기존글 정보 들어감  
		
		
		// 답글의 b_ref, b_step, b_depth 설정 
		vo.setB_ref(baseVo.getB_ref());          // 기준글의 b_ref를 넣는다. 
		vo.setB_step(baseVo.getB_step() + 1);    // 답글의 step = 기준글의 step + 1
		vo.setB_depth(baseVo.getB_depth() + 1);  // 답글의 depth = 기준글의 depth + 1 
		
		// IP 넣기 
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		// 엔터처리 \n -> <br> 
		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);
		
		// 답글 추가 
		res = board_dao.reply(vo);
		
		
		return "redirect:list.do";
	}
	
	

	
	
	

	
	*/
}
