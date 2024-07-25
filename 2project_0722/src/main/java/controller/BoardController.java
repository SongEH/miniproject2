<<<<<<< HEAD
package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.BoardDao;
import dao.BoardImagesDao;
import util.Mycommon;
import util.Paging;
import vo.BoardImagesVo;
import vo.BoardVo;
import vo.MemberVo;

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
	BoardImagesDao board_images_dao;
	
	public BoardController() {
		// TODO Auto-generated constructor stub
		System.out.println("----postcontroller()----");
	}

	
//-------------------post_list-------------------------------------
	@RequestMapping("list.do")
	public String list(
							@RequestParam(name="page", defaultValue = "1") int nowPage,Model model) throws Exception, IOException {

		
			List<BoardVo> vo = board_dao.selectList();
			
		// 게시물 표현 범위 
				int start	 	= (nowPage-1) * Mycommon.Photo.BLOCK_LIST + 1; 
				int end		 = start + Mycommon.Photo.BLOCK_LIST -1;
				
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("start",start);
				map.put("end",end);
				
				
				List<BoardVo> list = board_dao.selectList(map);
				
				
				
				//전체 게시물 수 
				int rowTotal = board_dao.selectRowTotal();
				
				
				
				
				//pageMenu만들기
				
				String pageMenu = Paging.getPaging("list.do", nowPage, rowTotal,
													Mycommon.Photo.BLOCK_LIST,
													Mycommon.Photo.BLOCK_PAGE);
				
				
				
				
			
				// Request Binding
				model.addAttribute("list", list);
				model.addAttribute("pageMenu", pageMenu);
				model.addAttribute("vo", vo);
				
				
				return "board/board_list";
	} // end list.do
//-------------------post_list-------------------------------------
	
	
	
//-------------insert_form start--------------------------------------------
	
	@RequestMapping("insert_form.do")
	public String insert_form() {
		
		System.out.println("----insert_form.do-----");
		
	 return "/board/board_insert_form";
	}
	
// ------------- insert_form end -------------------------------------------
	
	
//------------- insert start ------------------------------------------------------
	@RequestMapping("insert.do")
	public String insert(BoardVo vo, @RequestParam(name="photo") List<MultipartFile> photo_list ,Model model, RedirectAttributes ra ) throws Exception, IOException{
		
//Session check
	
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user == null) {
			
			ra.addAttribute("reason", "session_timeout");
			
			return "redirect:../member/login_form.do";
		}
		
		//사용자 정보 vo에 등록
		
		vo.setM_idx(user.getMem_idx());
		vo.setM_name(user.getMem_name());
		
		//이미지 저장 경로
		
		String absPath = application.getRealPath("/resources/images/");
		System.out.println("absPath:" + absPath);
		
		List<String> filename_list = new ArrayList<String>();
		
		String b_filename ="no_file";
		
		for(MultipartFile photo : photo_list) {
			
			if(!photo.isEmpty()) {
				//업로드 된 파일명을 구합니다. 
				b_filename = photo.getOriginalFilename();
				System.out.println("b_filename : " + b_filename);
				//저장 경로 파일 
				File f = new File(absPath, b_filename);
				
				if(f.exists()) {
					// 시간_파일명 이름변경
					long tm = System.currentTimeMillis();
					b_filename = String.format("%d_%s", tm, b_filename);
					
					f = new File(absPath, b_filename);
					System.out.println(f);
				}
				
				//spring이 저장해놓은 임시 파일을 복사
				photo.transferTo(f);
				System.out.println(photo);
				filename_list.add(b_filename);
				
			}	
		} //end:for
		
		
//DB에 insert board 
		int res = board_dao.insert(vo);
		
		int b_idx = board_dao.select_get_b_idx();
	
		
// 게시글 번호 얻기 
//		int b_idx = board_dao.select_get_b_idx();
		
		System.out.println("b_idx: " + b_idx);
				
					
		//DB에 insert post_images
	
		 Map<String, Object> map = new HashMap<String, Object>(); 
		BoardImagesVo ivo = new BoardImagesVo();
		
		for (String filename : filename_list) {
			
			System.out.println(filename);
	        ivo.setB_idx(b_idx);
	        b_filename= filename;
	        ivo.setB_filename(b_filename);
	        System.out.println("b_idx:" + ivo.getB_idx());
	        System.out.println("b_filename:" + ivo.getB_filename());
	        int res2 = board_images_dao.insert_board_images(ivo);	
		}

		
		System.out.println("filename_list" + filename_list);
		
		
		
		//로그인 유저 정보 넣기 
//		model.addAttribute("filename_list", filename_list);
//		ra.addAttribute("filename_list", filename_list); 
//		ra.addAttribute("b_idx", b_idx);
//		 ra.addAttribute("filename_list", String.join(",", filename_list));
//		ra.addAttribute("vo", vo);
		/* ra.addAttribute("ivo", ivo); */

		
		return "redirect:list.do";
	}
// ------------- insert_form end ------------------------------------------	
	
	
//---------------- 상세보기 ------------------------------------------	
	
	@RequestMapping("view.do")
	public String view(int b_idx,Model model) {
		
		// b_idx에 해당되는 게시물 1건 얻어오기
		BoardVo vo = board_dao.selectOne(b_idx);
		
		List image_list = new ArrayList();
		
		image_list = vo.getImage_list();
			
		System.out.println(image_list);
	
		
				// 안봤으면...(refresh에 의한 조회수증가 차단)
		if(session.getAttribute("show")==null) {
		
//			//조회수 증가
//			int res = board_dao.update_readhit(b_idx);
//			
//			session.setAttribute("show", true);
//		
		}
		
		//결과적으로 request binding
		model.addAttribute("vo", vo);
		model.addAttribute("image_list", image_list);
		
		return "board/board_view";
	}

	
	  
	/*
	 * public String insert(PostVo vo, Model model) {
	 * 
	 * String content = vo.getContent().replaceAll("\n", "<br>");
	 * 
	 * vo.setContent(content);
	 * 
	 * int res = post_dao.insert(vo);
	 * 
	 * 
	 * return "redirect:list.do"; }
	 */
	 

}

=======
package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.BoardDao;
import dao.BoardImagesDao;
import javafx.application.Application;
import javafx.scene.media.MediaPlayer;
import util.Mycommon;
import util.Paging;
import vo.BoardImagesVo;
import vo.BoardVo;
import vo.MemberVo;

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
	BoardImagesDao board_images_dao;
	
	public BoardController() {
		// TODO Auto-generated constructor stub
		System.out.println("----postcontroller()----");
	}

	
//-------------------post_list-------------------------------------
	@RequestMapping("list.do")
	public String list(
							@RequestParam(name="page", defaultValue = "1") int nowPage,Model model) throws Exception, IOException {

		
			List<BoardVo> vo = board_dao.selectList();
			
		// 게시물 표현 범위 
				int start	 	= (nowPage-1) * Mycommon.Photo.BLOCK_LIST + 1; 
				int end		 = start + Mycommon.Photo.BLOCK_LIST -1;
				
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("start",start);
				map.put("end",end);
				
				
				List<BoardVo> list = board_dao.selectList(map);
				
				
				
				//전체 게시물 수 
				int rowTotal = board_dao.selectRowTotal();
				
				
				
				
				//pageMenu만들기
				
				String pageMenu = Paging.getPaging("list.do", nowPage, rowTotal,
													Mycommon.Photo.BLOCK_LIST,
													Mycommon.Photo.BLOCK_PAGE);
				
				
				
				
			
				// Request Binding
				model.addAttribute("list", list);
				model.addAttribute("pageMenu", pageMenu);
				model.addAttribute("vo", vo);
				
				
				return "board/board_list";
	} // end list.do
//-------------------post_list-------------------------------------
	
	
	
//-------------insert_form start--------------------------------------------
	
	@RequestMapping("insert_form.do")
	public String insert_form() {
		
		System.out.println("----insert_form.do-----");
		
	 return "/board/board_insert_form";
	}
	
// ------------- insert_form end -------------------------------------------
	
	
//------------- insert start ------------------------------------------------------
	@RequestMapping("insert.do")
	public String insert(BoardVo vo, @RequestParam(name="photo") List<MultipartFile> photo_list ,Model model, RedirectAttributes ra ) throws Exception, IOException{
		
//Session check
	
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user == null) {
			
			ra.addAttribute("reason", "session_timeout");
			
			return "redirect:../member/login_form.do";
		}
		
		//사용자 정보 vo에 등록
		
		vo.setM_idx(user.getMem_idx());
		vo.setM_name(user.getMem_name());
		
		//이미지 저장 경로
		
		String absPath = application.getRealPath("/resources/images/");
		System.out.println("absPath:" + absPath);
		
		List<String> filename_list = new ArrayList<String>();
		
		String b_filename ="no_file";
		
		for(MultipartFile photo : photo_list) {
			
			if(!photo.isEmpty()) {
				//업로드 된 파일명을 구합니다. 
				b_filename = photo.getOriginalFilename();
				System.out.println("b_filename : " + b_filename);
				//저장 경로 파일 
				File f = new File(absPath, b_filename);
				
				if(f.exists()) {
					// 시간_파일명 이름변경
					long tm = System.currentTimeMillis();
					b_filename = String.format("%d_%s", tm, b_filename);
					
					f = new File(absPath, b_filename);
					System.out.println(f);
				}
				
				//spring이 저장해놓은 임시 파일을 복사
				photo.transferTo(f);
				System.out.println(photo);
				filename_list.add(b_filename);
				
			}	
		} //end:for
		
		
//DB에 insert board 
		int res = board_dao.insert(vo);
		
		int b_idx = board_dao.select_get_b_idx();
	
		
// 게시글 번호 얻기 
//		int b_idx = board_dao.select_get_b_idx();
		
		System.out.println("b_idx: " + b_idx);
				
					
		//DB에 insert post_images
	
		 Map<String, Object> map = new HashMap<String, Object>(); 
		BoardImagesVo ivo = new BoardImagesVo();
		
		for (String filename : filename_list) {
			
			System.out.println(filename);
	        ivo.setB_idx(b_idx);
	        b_filename= filename;
	        ivo.setB_filename(b_filename);
	        System.out.println("b_idx:" + ivo.getB_idx());
	        System.out.println("b_filename:" + ivo.getB_filename());
	        int res2 = board_images_dao.insert_board_images(ivo);	
		}

		
		System.out.println("filename_list" + filename_list);
		
		
		
		//로그인 유저 정보 넣기 
//		model.addAttribute("filename_list", filename_list);
//		ra.addAttribute("filename_list", filename_list); 
//		ra.addAttribute("b_idx", b_idx);
//		 ra.addAttribute("filename_list", String.join(",", filename_list));
//		ra.addAttribute("vo", vo);
		/* ra.addAttribute("ivo", ivo); */

		
		return "redirect:list.do";
	}
// ------------- insert_form end ------------------------------------------	
	
//---------------- 상세보기 ------------------------------------------	
	
	@RequestMapping("view.do")
	public String view(int b_idx,Model model) {
		
		// b_idx에 해당되는 게시물 1건 얻어오기
		BoardVo vo = board_dao.selectOne(b_idx);
		
		// 안봤으면...(refresh에 의한 조회수증가 차단)
		if(session.getAttribute("show")==null) {
		
//			//조회수 증가
//			int res = board_dao.update_readhit(b_idx);
//			
//			session.setAttribute("show", true);
//		
		}
		
		//결과적으로 request binding
		model.addAttribute("vo", vo);
		
		
		return "board/board_view";
	}

	
	  
	/*
	 * public String insert(PostVo vo, Model model) {
	 * 
	 * String content = vo.getContent().replaceAll("\n", "<br>");
	 * 
	 * vo.setContent(content);
	 * 
	 * int res = post_dao.insert(vo);
	 * 
	 * 
	 * return "redirect:list.do"; }
	 */
	 

}

>>>>>>> refs/remotes/origin/CheonTk's-Branch
