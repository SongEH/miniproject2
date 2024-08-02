package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.BoardDao;
import dao.BoardImagesDao;
import dao.ReplyDao;
import util.MyCommon;
import util.Paging;
import vo.BoardImagesVo;
import vo.BoardVo;
import vo.MemberVO;

@Controller
@RequestMapping("/board/")
public class BoardController {

	// 절대경로 구하는 방법
	@Autowired
	ServletContext application;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	BoardDao board_dao;
	
	@Autowired
	ReplyDao reply_dao;

	@Autowired
	BoardImagesDao board_images_dao;

	public BoardController() {
		// TODO Auto-generated constructor stub
		System.out.println("----postcontroller()----");
	}

//--------------------------------------------board_list-------------------------------------
	@RequestMapping("list.do")
	public String list(String b_cate, String b_content,
						@RequestParam(name = "search", defaultValue = "all") String search,
						String search_text,
						@RequestParam(name = "page", defaultValue = "1") int nowPage, Model model)
			throws Exception, IOException {

		// 게시물 표현 범위

		// 세션에 기록되어있는 show(삭제)
		session.removeAttribute("show");
		
//		System.out.println("search = " + search);
//		System.out.println("search_text = " + search_text);
		
		// 검색 조건 담을 맵
		Map<String, Object> map = new HashMap<String, Object>();

		// 제목 + 내용
		if (search.equals("title_content")) {

			map.put("b_title", search_text);
			map.put("b_content", search_text);

		} else if (search.equals("title")) {

			// 제목
			map.put("b_title", search_text);

		} else if (search.equals("content")) {

			// 내용
			map.put("b_content", search_text);
		}

		String search_filter = String.format("search=%s&search_text=%s", search, search_text);

		
		/* Map<String, Object> map = new HashMap<String, Object>(); */

		int start = (nowPage - 1) * MyCommon.board.BLOCK_LIST + 1;
		/* System.out.println("start:" + start); */
		int end = start + MyCommon.board.BLOCK_LIST - 1;
		/*
		 * System.out.println("end:" + end); System.out.println("b_cate: " + b_cate);
		 */
		map.put("start", start);
		map.put("end", end);
		map.put("b_cate", b_cate);

	
		// 게시판 목록 가지고 오기
		List<BoardVo> list = board_dao.selectList(map);

//		 System.out.println("list_size():" + list.size()); 

		// 전체 게시물 수
		int rowTotal = board_dao.selectRowTotal(b_cate);

//		System.out.println(rowTotal); 

		String baseurl = "list.do?b_cate=" + b_cate;
		/*
		 * System.out.println(baseurl);
		 */
		// pageMenu만들기
		String pageMenu = Paging.getPaging(baseurl, search_filter, nowPage, rowTotal, MyCommon.board.BLOCK_LIST,
				MyCommon.board.BLOCK_PAGE, b_cate);

		int b_idx = 0;

		for (BoardVo vo : list) {
			b_cate = vo.getB_cate();
			b_idx = vo.getB_idx();
			
			/* System.out.println("b_cate" + b_cate); */
		}

		// 이미지 섬네일용 만들기
		List<String> image_file = new ArrayList<String>();

		List<BoardImagesVo> post_list = board_images_dao.selectlist(b_idx);

		if (post_list != null) {

			for (BoardImagesVo image : post_list) {
				/* System.out.println(image.getB_filename()); */

				image_file.add(image.getB_filename());

			}
			
		}
		/*
		 * b_content = board_dao.select_get_content(b_idx); b_content =
		 * b_content.replaceAll("<[^>]*>", "");
		 */
		
		
		
		
		// Request Binding
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("image_file", image_file);

		for (BoardVo vo : list) {
			b_cate = vo.getB_cate();
		}
		if (b_cate.equals("free")) {

			return "board/board_list_free";
		} else if (b_cate.equals("medical")) {
			return "board/board_list_medical";
		} else {
			return "board/board_list_mate";
		}

	} // end list.do
//--------------------------------------------iboard_list-------------------------------------

//--------------------------------------------insert_form start--------------------------------------------

	@RequestMapping("insert_form.do")
	public String insert_form(RedirectAttributes ra) {

		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		return "/board/board_insert_form";
	}

//--------------------------------------------insert_form end -------------------------------------------

//--------------------------------------------insert start ------------------------------------------------------
	@RequestMapping("insert.do")
	public String insert(String b_content, String b_cate, BoardVo vo,
			@RequestParam(name = "photo") List<MultipartFile> photo_list, Model model, RedirectAttributes ra)
			throws Exception, IOException {

//Session check

		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		// 사용자 정보 vo에 등록

		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());

		// 이미지 저장 경로

		String absPath = application.getRealPath("/resources/images/");
		/* System.out.println("absPath:" + absPath); */

		List<String> filename_list = new ArrayList<String>();

		String b_filename = "no_file";

		for (MultipartFile photo : photo_list) {

			if (!photo.isEmpty()) {
				// 업로드 된 파일명을 구합니다.
				b_filename = photo.getOriginalFilename();
				/* System.out.println("b_filename : " + b_filename); */
				// 저장 경로 파일
				File f = new File(absPath, b_filename);

				if (f.exists()) {
					// 시간_파일명 이름변경
					long tm = System.currentTimeMillis();
					b_filename = String.format("%d_%s", tm, b_filename);

					f = new File(absPath, b_filename);
					/* System.out.println(f); */
				}

				// spring이 저장해놓은 임시 파일을 복사
				photo.transferTo(f);
				/* System.out.println(photo); */
				filename_list.add(b_filename);

			}
		} // end:for

//DB에 insert board 
		int res = board_dao.insert(vo);

		int b_idx = board_dao.select_get_b_idx();

		System.out.println("b_content ::" + b_content);

		// DB에 insert post_images

		Map<String, Object> map = new HashMap<String, Object>();
		BoardImagesVo ivo = new BoardImagesVo();

		for (String filename : filename_list) {

			/* System.out.println(filename); */
			ivo.setB_idx(b_idx);
			b_filename = filename;
			ivo.setB_filename(b_filename);
			/*
			 * System.out.println("b_idx:" + ivo.getB_idx());
			 * System.out.println("b_filename:" + ivo.getB_filename());
			 */
			int res2 = board_images_dao.insert_board_images(ivo);
		}

		// 로그인 유저 정보 넣기
//		model.addAttribute("filename_list", filename_list);
//		ra.addAttribute("filename_list", filename_list); 
		ra.addAttribute("b_cate", b_cate);
//		 ra.addAttribute("filename_list", String.join(",", filename_list));
//		ra.addAttribute("vo", vo);
		/* ra.addAttribute("ivo", ivo); */

		return "redirect:list.do";
	}
//--------------------------------------------insert_form end ------------------------------------------	

//--------------------------------------------상세보기 --------------------------------------------------

	@RequestMapping("view.do")
	public String view(int b_idx, Model model) {

		// b_idx에 해당되는 게시물 1건 얻어오기
		BoardVo vo = board_dao.selectOne(b_idx);
		
		List image_list = new ArrayList();

		image_list = vo.getImage_list();

		/* System.out.println(image_list); */

		// 안봤으면...(refresh에 의한 조회수증가 차단)
		if (session.getAttribute("show") == null) {

			//조회수 증가
			int res = board_dao.update_readhit(b_idx);
			
			session.setAttribute("show", true);
		}
		
		
		// 결과적으로 request binding
		model.addAttribute("vo", vo);
		model.addAttribute("image_list", image_list);

		if (vo.getB_cate().equals("free")) {
			return "board/board_view";
		} else if (vo.getB_cate().equals("medical")) {
			return "board/board_answer";
		} else {
			return "board/board_answer";
		}

	}
//--------------------------------------------상세보기 --------------------------------------------------

	@RequestMapping("reply_form.do")
	public String reply_form() {

		return "board/board_reply_form";
	}

//--------------------------------------------modify_form.do--------------------------------------	

	@RequestMapping("modify_form.do")
	public String modify_form(int b_idx, BoardVo vo, Model model, RedirectAttributes ra) {

		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		vo = board_dao.selectOne(b_idx);

		model.addAttribute("vo", vo);

		List<BoardImagesVo> file_list = vo.getImage_list();

		for (BoardImagesVo image : file_list) {
			/* System.out.println(image); */
		}

		return "board/board_modify_form";
	}

//--------------------------------------------modify_form.do--------------------------------------	

//--------------------------------------------modify.do--------------------------------------
	@RequestMapping("modify.do")
	public String modify(int b_idx, BoardVo vo, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "search", defaultValue = "all") String search, String search_text,
			RedirectAttributes ra) {

		int res = board_dao.update(vo);

		ra.addAttribute("b_idx", vo.getB_idx());

		return "redirect:view.do";
	}

//--------------------------------------------imodify.do--------------------------------------	

//-----------------------------------delete.do--------------------------------------

	@RequestMapping("delete.do")
	public String delete(int b_idx, RedirectAttributes ra) {

		int res = board_dao.delete(b_idx);

		ra.addAttribute("b_cate", "free");

		return "redirect:list.do?";
	}

//-----------------------------------delete.do--------------------------------------

}
