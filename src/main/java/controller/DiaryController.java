package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.DiaryDao;
import dao.PetDAO;
import vo.FeedingVo;
import vo.HealthVO;
import vo.MemberVO;
import vo.NoteVo;
import vo.PetVO;
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
	@Qualifier("diaryDao")
	DiaryDao diary_dao; // 인젝션

	@Autowired
	private PetDAO petDAO; // DAO를 자동 주입
	 
	// 다이어리 메인
	@RequestMapping("diary_list.do")
	public String diary_list(Model model) {

		return "/diary/diary_list";
	}

	// 선택한 날짜 기록
	@RequestMapping(value = "diary_select_date.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String diary_select_date(String date) {
		System.out.println("컨트롤러 : " + date);

		// 세션에서 m_idx 가져와서 vo에 저장
		
		JSONObject json = new JSONObject();
		
		if((MemberVO) session.getAttribute("user") != null ) {
			MemberVO user = (MemberVO) session.getAttribute("user");
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("date", date);
			map.put("m_idx", user.getM_idx());
			
			List<WeightVo> weight_list = diary_dao.diary_select_weight_date(map);
			List<StollVo> stoll_list = diary_dao.diary_select_stoll_date(map);
			List<FeedingVo> feeding_list = diary_dao.diary_select_feeding_date(map);
			List<HealthVO> health_list = diary_dao.diary_select_health_date(map);
			List<NoteVo> note_list = diary_dao.diary_select_note_date(map);

			
			json.put("weight_list", weight_list);
			json.put("stoll_list", stoll_list);
			json.put("feeding_list", feeding_list);
			json.put("health_list", health_list);
			json.put("note_list", note_list);
		}
		

		return json.toString();
	}

	// 체중 상세보기
	/*
	 * @RequestMapping("diary_view_weight.do") public String diary_view_weight(int
	 * w_idx, Model model) {
	 * 
	 * // b_idx에 해당되는 게시물 1건 얻어오기 WeightVo vo = diary_dao.selectOne_weight(w_idx);
	 * 
	 * model.addAttribute("vo", vo);
	 * 
	 * return "diary/diary_view_weight"; }
	 */

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

	// 추가 폼 띄우기
	@RequestMapping("diary_insert_form.do")
	public String diary_insert_form(Model model) {

		String select_date = request.getParameter("select_date");
		
		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		// dao 에서 현재 세션에 저장된 m_idx를 통해서 pet DB에서 m_idx랑 같은 펫들을 구해줘  
		List<PetVO> pets = petDAO.getPetsByMemberId(user.getM_idx());
		
		System.out.println();
		model.addAttribute("select_date", select_date);
		
		// 모델에 펫 정보도 넣기 
		model.addAttribute("pets", pets);
		
		return "diary/diary_insert_form__";
	}

	// 체중 기록 추가
	@RequestMapping("diary_insert_weight.do")
	public String diary_insert_weight(WeightVo vo) {
		
		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setM_idx(user.getM_idx()); 
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		// PetDAO를 사용하여 반려동물 이름을 조회합니다.
        String p_name = petDAO.getPetNameById(p_idx);
        vo.setP_name(p_name);
        
		int res = diary_dao.diary_insert_weight(vo);

		return "redirect:diary_list.do";
	}

	// 산책 기록 추가
	@RequestMapping("diary_insert_stoll.do")
	public String diary_insert_stoll(StollVo vo) {

		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setM_idx(user.getM_idx()); 

		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		// PetDAO를 사용하여 반려동물 이름을 조회합니다.
        String p_name = petDAO.getPetNameById(p_idx);
        vo.setP_name(p_name);
		
		int res = diary_dao.diary_insert_stoll(vo);

		return "redirect:diary_list.do";
	}

	// 사료 기록 추가
	@RequestMapping("diary_insert_feeding.do")
	public String diary_insert_feeding(FeedingVo vo) {
		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setM_idx(user.getM_idx());

		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		// PetDAO를 사용하여 반려동물 이름을 조회합니다.
        String p_name = petDAO.getPetNameById(p_idx);
        vo.setP_name(p_name);
        
        
		int res = diary_dao.diary_insert_feeding(vo);

		return "redirect:diary_list.do";
	}

	// 진료 기록 추가
	@RequestMapping("diary_insert_health.do")
	public String diary_insert_health(HealthVO vo) {
		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setM_idx(user.getM_idx());

		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		// PetDAO를 사용하여 반려동물 이름을 조회합니다.
        String p_name = petDAO.getPetNameById(p_idx);
        vo.setPet_name(p_name);
        
		int res = diary_dao.diary_insert_health(vo);

		return "redirect:diary_list.do";
	}

	// 메모 추가
	@RequestMapping("diary_insert_note.do")
	public String diary_insert_note(NoteVo vo) {
		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setM_idx(user.getM_idx());

		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		// PetDAO를 사용하여 반려동물 이름을 조회합니다.
        String p_name = petDAO.getPetNameById(p_idx);
        vo.setP_name(p_name);
        
		int res = diary_dao.diary_insert_note(vo);

		return "redirect:diary_list.do";
	}

	// 수정 폼 띄우기. 하나로 통합
	@RequestMapping("/diary_modify_form.do")
	public String diary_modify_form(String table_name, int idx, Model model) {

		// 수정할 원본 데이터
		Map<String, Object> map = diary_dao.selectOne(table_name, idx);

		// String b_content = vo.getB_content().replaceAll("<br>", "\n");
		// vo.setB_content(b_content);

		// 세션에서 m_idx 가져와서 vo에 저장
		MemberVO user = (MemberVO) session.getAttribute("user");
				
		// dao 에서 현재 세션에 저장된 m_idx를 통해서 pet DB에서 m_idx랑 같은 펫들을 구해줘  
		List<PetVO> pets = petDAO.getPetsByMemberId(user.getM_idx());
		
		model.addAttribute("pets", pets);		
		model.addAttribute("map", map);
		model.addAttribute("table_name", table_name);

		return "diary/diary_modify_form";
	}

	// 수정
	/*
	 * @RequestMapping("/diary_modify_weight.do") public String
	 * diary_modify_weight(WeightVo vo, RedirectAttributes ra) { //로그인 유저정보 얻어온다
	 * //MemberVo user = (MemberVo) session.getAttribute("user");
	 * 
	 * //사용자정보 vo에 등록 //vo.setMem_idx(user.getMem_idx());
	 * //vo.setMem_name(user.getMem_name());
	 * 
	 * // \n -> <br> // String b_content = vo.getB_content().replaceAll("\n",
	 * "<br>"); // vo.setB_content(b_content);
	 * 
	 * //DB update int res = diary_dao.update_weight(vo);
	 * 
	 * 
	 * ra.addAttribute("w_idx", vo.getW_idx());
	 * 
	 * return "redirect:diary_view_weight.do"; }
	 */

	// 수정 하나로 통합
	@RequestMapping(value = "/diary_modify_{table_name}.do", method = RequestMethod.POST)
	public String diary_modify(@PathVariable String table_name, @RequestParam Map<String, String> params,
			RedirectAttributes ra) throws java.text.ParseException {
		// \n -> <br> 처리 (필요 시)
		if (params.containsKey("content")) {
			String content = params.get("content").replaceAll("\n", "<br>");
			params.put("content", content);
		}

		System.out.println("params: " + params);

		
		
		// 필요한 타입으로 변환
		Map<String, Object> paramMap = new HashMap<>();
		
		// 멤버 
		MemberVO user = (MemberVO) session.getAttribute("user");
		paramMap.put("m_idx", user.getM_idx());
	
		
		for (Map.Entry<String, String> entry : params.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();

			
			
			if (value != null && !value.trim().isEmpty()) {
				try {
					if (key.endsWith("_idx") || key.equals("p_idx") || key.equals("distance")) {
						paramMap.put(key, Integer.parseInt(value));
					} else if (key.equals("cost") || key.equals("w_weight")) {
						paramMap.put(key, Double.parseDouble(value));
					} else if (key.endsWith("date")) {
						// String을 java.sql.Date로 변환

						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						// java.util.Date parsedDate = dateFormat.parse(value);
						// paramMap.put(key, new java.sql.Date(parsedDate.getTime()));

						// 문자열을 java.util.Date로 변환

						java.util.Date parsedDate = dateFormat.parse(value);

						// java.util.Date를 java.sql.Date로 변환
						java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

						// paramMap에 변환된 날짜를 추가
						paramMap.put(key, sqlDate);

						System.out.println(sqlDate);
						System.out.println(key);

					} else if (key.endsWith("time")) {
						// String을 java.sql.Date로 변환
						SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
						java.util.Date parsedTime = timeFormat.parse(value);
						paramMap.put(key, new java.sql.Time(parsedTime.getTime())); // 여기서 java.sql.Time으로 변환
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
		case "stoll" -> "s_idx";
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

	// Full Calendar 샘플
	@RequestMapping(value = "full_calendar_json_data.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
	    public String getFullCalendarData() {
		
		// 이벤트 목록 생성
        JSONArray eventList = new JSONArray();
        
		if((MemberVO) session.getAttribute("user") != null ) {
			// 세션에서 m_idx 가져와서 vo에 저장
			MemberVO user = (MemberVO) session.getAttribute("user");
			int m_idx = user.getM_idx();
		

			// 일단 DB 저장된 데이터들 다 가져와서 
			List<StollVo> stoll_list = diary_dao.diary_select_stoll_all(m_idx);
			List<WeightVo> weight_list = diary_dao.diary_select_weight_all(m_idx);
			List<FeedingVo> feeding_list = diary_dao.diary_select_feeding_all(m_idx);
			List<HealthVO> health_list = diary_dao.diary_select_health_all(m_idx);
			List<NoteVo> note_list = diary_dao.diary_select_note_all(m_idx);
	
			
		
			
			JSONObject json = new JSONObject();
			json.put("stoll_list", stoll_list);
			json.put("weight_list", weight_list);
			json.put("feeding_list", feeding_list);
			json.put("health_list", health_list);
			json.put("note_list", note_list);
	
	        JSONArray stoll_list1 = json.getJSONArray("stoll_list");
	        JSONArray weight_list1 = json.getJSONArray("weight_list");
	        JSONArray feeding_list1 = json.getJSONArray("feeding_list");
	        JSONArray health_list1 = json.getJSONArray("health_list");
	        JSONArray note_list1 = json.getJSONArray("note_list");
	
	        
	        
	        
	        // stoll_list에서 s_rdate를 가져와서 이벤트 생성
			for (int i = 0; i < stoll_list1.length(); i++) {
				JSONObject item = stoll_list1.getJSONObject(i);
				String s_rdate = item.getString("s_rdate");
				int s_idx = item.getInt("s_idx");
	
				// 이벤트 JSON 객체 생성
				JSONObject event = new JSONObject();
				event.put("s_idx", s_idx);
				// start 값에 s_rdate를 설정
				event.put("start", s_rdate);
				// start 값에 s_rdate를 설정
				event.put("title", "산책"); // title 값에 '체중' 설정
				eventList.put(event);
	
			}
	
			for (int i = 0; i < weight_list1.length(); i++) {
				JSONObject item = weight_list1.getJSONObject(i);
				String w_rdate = item.getString("w_rdate");
				int w_idx = item.getInt("w_idx");
	
				// 이벤트 JSON 객체 생성
				JSONObject event = new JSONObject();
				event.put("w_idx", w_idx);
				event.put("start", w_rdate);
				event.put("title", "체중"); 
				eventList.put(event);
	
			}
			 
			for (int i = 0; i < feeding_list1.length(); i++) {
				JSONObject item = feeding_list1.getJSONObject(i);
				String f_rdate = item.getString("f_rdate");
				int f_idx = item.getInt("f_idx");
	
				// 이벤트 JSON 객체 생성
				JSONObject event = new JSONObject();
				event.put("f_idx", f_idx);
				event.put("start", f_rdate);
				event.put("title", "급여"); 
				eventList.put(event);
	
			}
	
			for (int i = 0; i < health_list1.length(); i++) {
				JSONObject item = health_list1.getJSONObject(i);
				String h_rdate = item.getString("h_rdate");
				int h_idx = item.getInt("h_idx");
	
				// 이벤트 JSON 객체 생성
				JSONObject event = new JSONObject();
				event.put("h_idx", h_idx);
				event.put("start", h_rdate);
				event.put("title", "건강");
				eventList.put(event);
	
			}
	
			for (int i = 0; i < note_list1.length(); i++) {
				JSONObject item = note_list1.getJSONObject(i);
				String o_rdate = item.getString("o_rdate");
				int o_idx = item.getInt("o_idx");
	
				// 이벤트 JSON 객체 생성
				JSONObject event = new JSONObject();
				event.put("o_idx", o_idx);			
				event.put("start", o_rdate);
				event.put("title", "메모"); 
				eventList.put(event);
	
			}
	
	    	
	        
	        // 이벤트 목록 출력
	        System.out.println("Event List:");
	        System.out.println(eventList.toString(4)); // 들여쓰기 포함하여 출력
		}
        return eventList.toString();

		/*
		 * Map<String, Object> event = new HashMap<String, Object>(); List<Map<String,
		 * Object>> eventList = new ArrayList<Map<String, Object>>(); event.put("start",
		 * LocalDate.now()); event.put("title", "test");
		 * event.put("end",LocalDate.now()); eventList.add(event); event = new
		 * HashMap<String, Object>(); event.put("start", LocalDate.now().plusDays(3));
		 * event.put("title", "test2"); event.put("end",LocalDate.now().plusDays(4));
		 * eventList.add(event); System.out.println(eventList); return eventList;
		 */
		
    }
	/*
	 * @RequestMapping(value = "full_calendar_json_data.do", method =
	 * RequestMethod.GET, produces = "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public String getFullCalendarData() {
	 * 
	 * // 일단 DB 저장된 데이터들 다 가져와서 String date1 = "2024-07-30"; // 이따가 매퍼 다시 만들기 전체
	 * 조회하는거 List<StollVo> stoll_list = diary_dao.diary_select_stoll_date(date1);
	 * JSONObject json = new JSONObject(); json.put("stoll_list", stoll_list);
	 * 
	 * JSONArray stollList = json.getJSONArray("stoll_list");
	 * 
	 * // 이벤트 목록 생성 JSONArray eventList = new JSONArray(); // stoll_list에서 s_rdate를
	 * 가져와서 이벤트 생성 for (int i = 0; i < stollList.length(); i++) { JSONObject item =
	 * stollList.getJSONObject(i); String s_rdate = item.getString("s_rdate"); int
	 * s_idx = item.getInt("s_idx");
	 * 
	 * // 이벤트 JSON 객체 생성 JSONObject event = new JSONObject(); event.put("s_idx",
	 * s_idx); // start 값에 s_rdate를 설정 event.put("start", s_rdate); // start 값에
	 * s_rdate를 설정 event.put("title", "산책"); // title 값에 '체중' 설정
	 * eventList.put(event);
	 * 
	 * }
	 * 
	 * // 이벤트 목록 출력 System.out.println("Event List:");
	 * System.out.println(eventList.toString(4)); // 들여쓰기 포함하여 출력
	 * 
	 * return eventList.toString();
	 * 
	 * 
	 * 
	 * Map<String, Object> event = new HashMap<String, Object>(); List<Map<String,
	 * Object>> eventList = new ArrayList<Map<String, Object>>(); event.put("start",
	 * LocalDate.now()); event.put("title", "test");
	 * event.put("end",LocalDate.now()); eventList.add(event); event = new
	 * HashMap<String, Object>(); event.put("start", LocalDate.now().plusDays(3));
	 * event.put("title", "test2"); event.put("end",LocalDate.now().plusDays(4));
	 * eventList.add(event); System.out.println(eventList); return eventList;
	 * 
	 * 
	 * }
	 */
	
	
}
