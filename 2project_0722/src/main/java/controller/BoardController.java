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
import org.springframework.util.SystemPropertyUtils;
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

	
	
<<<<<<< HEAD
//--------------------------------------------board_list-------------------------------------
=======
//--------------------------------------------iboard_list-------------------------------------
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	@RequestMapping("list.do")
	public String list(String b_cate,
			@RequestParam(name="page", defaultValue = "1") int nowPage,Model model) throws Exception, IOException {
<<<<<<< HEAD
=======

			
	
//		List<BoardVo> vo = board_dao.selectList();
			
//		List<BoardVo> vo = board_dao.selectList_b_cate(b_cate);	
			
			
>>>>>>> refs/remotes/origin/CheonTk's-Branch
			
		// 게시물 표현 범위 
				
				
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				int start	 	= (nowPage-1) * Mycommon.board.BLOCK_LIST+ 1; 
<<<<<<< HEAD
				/* System.out.println("start:" + start); */
				int end		 = start + Mycommon.board.BLOCK_LIST -1;
				/*
				 * System.out.println("end:" + end); System.out.println("b_cate: " + b_cate);
				 */
=======
				System.out.println("start:" + start);
				int end		 = start + Mycommon.board.BLOCK_LIST -1;
				System.out.println("end:" + end);
				System.out.println("b_cate: " + b_cate);
>>>>>>> refs/remotes/origin/CheonTk's-Branch
				map.put("start",start);
				map.put("end",end);
				map.put("b_cate", b_cate);
				
				//게시판 목록 가지고 오기 
				List<BoardVo> list = board_dao.selectList(map);
				
<<<<<<< HEAD
				/* System.out.println("list_size():" + list.size()); */
=======
				System.out.println("list_size():" + list.size());
>>>>>>> refs/remotes/origin/CheonTk's-Branch
					
				//전체 게시물 수 
				int rowTotal = board_dao.selectRowTotal(b_cate);
				
				/* System.out.println(rowTotal); */
				
				String baseurl = "list.do?b_cate=" + b_cate;
<<<<<<< HEAD
				/*
				 * System.out.println(baseurl);
				 */
=======
				System.out.println(baseurl);
				
>>>>>>> refs/remotes/origin/CheonTk's-Branch
				//pageMenu만들기
				String pageMenu = Paging.getPaging(baseurl,
																		nowPage,
																		rowTotal,
																		Mycommon.board.BLOCK_LIST,
																		Mycommon.board.BLOCK_PAGE,
																		b_cate
																	);
				
				int b_idx = 0;
				
				for(BoardVo vo: list) {
					b_cate = vo.getB_cate();
					b_idx = vo.getB_idx();
<<<<<<< HEAD
					/* System.out.println("b_cate" + b_cate); */
=======
					System.out.println("b_cate" + b_cate);
>>>>>>> refs/remotes/origin/CheonTk's-Branch
				}
				
				
				//이미지 섬네일용 만들기 
				List<String> image_file = new ArrayList<String>();
				
			
		
				
				List<BoardImagesVo> post_list = board_images_dao.selectlist(b_idx);
				
				
				if(post_list != null) {
					
					for (BoardImagesVo image : post_list) {
<<<<<<< HEAD
						/* System.out.println(image.getB_filename()); */
=======
						System.out.println(image.getB_filename());
>>>>>>> refs/remotes/origin/CheonTk's-Branch
						
						image_file.add(image.getB_filename());

					}
					
				}
				
//				
			
				// Request Binding
				model.addAttribute("list", list);
				model.addAttribute("pageMenu", pageMenu);
				model.addAttribute("image_file", image_file);
				
				for(BoardVo vo : list) {
					b_cate = vo.getB_cate();
				}
				if(b_cate.equals("free")) {
					
					return "board/board_list_free";		
				}else if(b_cate.equals("medical")) {
					return "board/board_list_medical";
				}else {
					return "board/board_list_mate";
				}
					
				
 				
				
	} // end list.do
//--------------------------------------------iboard_list-------------------------------------
	
	
	
	
	
//--------------------------------------------insert_form start--------------------------------------------
	
	@RequestMapping("insert_form.do")
	public String insert_form(RedirectAttributes ra) {
		
			MemberVo user = (MemberVo) session.getAttribute("user");
		
			if(user == null) {
			
			ra.addAttribute("reason", "session_timeout");
			
			return "redirect:../member/login_form.do";
		}
		
	 return "/board/board_insert_form";
	}
	
<<<<<<< HEAD
//--------------------------------------------insert_form end -------------------------------------------
=======
//--------------------------------------------iinsert_form end -------------------------------------------
>>>>>>> refs/remotes/origin/CheonTk's-Branch

	
	
	
<<<<<<< HEAD
//--------------------------------------------insert start ------------------------------------------------------
=======
//--------------------------------------------i insert start ------------------------------------------------------
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	@RequestMapping("insert.do")
<<<<<<< HEAD
	public String insert(String b_content,String b_cate ,BoardVo vo, @RequestParam(name="photo") List<MultipartFile> photo_list ,Model model, RedirectAttributes ra ) throws Exception, IOException{
=======
	public String insert(String b_cate ,BoardVo vo, @RequestParam(name="photo") List<MultipartFile> photo_list ,Model model, RedirectAttributes ra ) throws Exception, IOException{
>>>>>>> refs/remotes/origin/CheonTk's-Branch
		
//Session check
	
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user == null) {
			
			ra.addAttribute("reason", "session_timeout");
			
			return "redirect:../member/login_form.do";
		}
		
		//사용자 정보 vo에 등록
		
		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());
		
		//이미지 저장 경로
		
		String absPath = application.getRealPath("/resources/images/");
		/* System.out.println("absPath:" + absPath); */
		
		List<String> filename_list = new ArrayList<String>();
		
		String b_filename ="no_file";
		
		for(MultipartFile photo : photo_list) {
			
			if(!photo.isEmpty()) {
				//업로드 된 파일명을 구합니다. 
				b_filename = photo.getOriginalFilename();
				/* System.out.println("b_filename : " + b_filename); */
				//저장 경로 파일 
				File f = new File(absPath, b_filename);
				
				if(f.exists()) {
					// 시간_파일명 이름변경
					long tm = System.currentTimeMillis();
					b_filename = String.format("%d_%s", tm, b_filename);
					
					f = new File(absPath, b_filename);
					/* System.out.println(f); */
				}
				
				//spring이 저장해놓은 임시 파일을 복사
				photo.transferTo(f);
				/* System.out.println(photo); */
				filename_list.add(b_filename);
				
			}	
		} //end:for
		
				
		
//DB에 insert board 
		int res = board_dao.insert(vo);
		
		int b_idx = board_dao.select_get_b_idx();
	
		System.out.println("b_content ::" + b_content);

		
	
				
		//DB에 insert post_images
	
		 Map<String, Object> map = new HashMap<String, Object>(); 
		BoardImagesVo ivo = new BoardImagesVo();
		
		for (String filename : filename_list) {
			
			/* System.out.println(filename); */
	        ivo.setB_idx(b_idx);
	        b_filename= filename;
	        ivo.setB_filename(b_filename);
			/*
			 * System.out.println("b_idx:" + ivo.getB_idx());
			 * System.out.println("b_filename:" + ivo.getB_filename());
			 */
	        int res2 = board_images_dao.insert_board_images(ivo);	
		}

		
				
		//로그인 유저 정보 넣기 
//		model.addAttribute("filename_list", filename_list);
//		ra.addAttribute("filename_list", filename_list); 
		ra.addAttribute("b_cate", b_cate);
//		 ra.addAttribute("filename_list", String.join(",", filename_list));
//		ra.addAttribute("vo", vo);
		/* ra.addAttribute("ivo", ivo); */

		
		
		return "redirect:list.do";
	}
<<<<<<< HEAD
//--------------------------------------------insert_form end ------------------------------------------	
=======
//--------------------------------------------i insert_form end ------------------------------------------	
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	
	
//--------------------------------------------상세보기 --------------------------------------------------
	
	@RequestMapping("view.do")
	public String view(int b_idx, Model model) {
		
		// b_idx에 해당되는 게시물 1건 얻어오기
		BoardVo vo = board_dao.selectOne(b_idx);
		
		List image_list = new ArrayList();
		
		image_list = vo.getImage_list();
			
		/* System.out.println(image_list); */
	
		
				// 안봤으면...(refresh에 의한 조회수증가 차단)
		if(session.getAttribute("show")==null) {
		
//			//조회수 증가
//			int res = board_dao.update_readhit(b_idx);
//			
//			session.setAttribute("show", true);
//		
		}
<<<<<<< HEAD
		/* System.out.println("vo.getB_cate())" + vo.getB_cate()); */
=======
		System.out.println("vo.getB_cate())" + vo.getB_cate()); 
>>>>>>> refs/remotes/origin/CheonTk's-Branch
		
		
		//결과적으로 request binding
		model.addAttribute("vo", vo);
		model.addAttribute("image_list", image_list);
		
		if(vo.getB_cate().equals("free")) {
			return "board/board_view";
		}else if(vo.getB_cate().equals("medical")) {
			return "board/board_answer";
		}else { 
			return "board/board_answer";
		}
		
		
	}
<<<<<<< HEAD
//--------------------------------------------상세보기 --------------------------------------------------
=======
//--------------------------------------------i상세보기 --------------------------------------------------
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	 

	
<<<<<<< HEAD
	@RequestMapping("reply_form.do")
	public String reply_form() {
		
		return "board/board_reply_form";
	}
=======
	

	
	@RequestMapping("reply_form.do")
	public String reply_form() {
		
		return "board/board_reply_form";
	}
	
//--------------------------------------------imodify.do--------------------------------------수정대기 
	
	/*
	  @RequestMapping("modify.do") public String modify(BoardVo vo,
	  
	  @RequestParam("updateImage") List<String> update_file_list,
	  
	  @RequestParam(name="photo") List<MultipartFile> photo_list , Model model,
	  RedirectAttributes ra ) throws Exception, IOException {
	  
	  //Session check
	  
	  MemberVo user = (MemberVo) session.getAttribute("user");
	  
	  if(user == null) {
	  
	  ra.addAttribute("reason", "session_timeout");
	  
	  return "redirect:../member/login_form.do"; }
	  
	  
	  //이미지 저장 경로
	  
	  String absPath = application.getRealPath("/resources/images/");
	  System.out.println("absPath:" + absPath);
	  
	  File dir = new File(absPath); //등록된 파일 목록 확인 String[] filenamesList =
	  dir.list();
	  
	  // 서버에 저장된 파일명과 수정된 파일명이 일치하지 않으면 for(String filename : filenamesList) {
	  if(!absPath.contains(filename)) { // 서버에 저장된 파일명과 수정된 파일명이 일치하지 않으면
	  System.out.println("delete files : " + filename);
	  
	  File file = new File(absPath + "/" + filename); file.delete(); // 해당 파일 삭제 }
	  }
	  
	  
	  List<String> filename_list = new ArrayList<String>();
	  
	  String b_filename ="no_file";
	  
	  for(MultipartFile photo : photo_list) {
	  
	  if(!photo.isEmpty()) { //업로드 된 파일명을 구합니다. b_filename =
	  photo.getOriginalFilename(); System.out.println("b_filename : " +
	  b_filename); //저장 경로 파일 File f = new File(absPath, b_filename);
	  
	  if(f.exists()) { // 시간_파일명 이름변경 long tm = System.currentTimeMillis();
	  b_filename = String.format("%d_%s", tm, b_filename);
	  
	  f = new File(absPath, b_filename); System.out.println(f); }
	  
	  //spring이 저장해놓은 임시 파일을 복사 photo.transferTo(f); System.out.println(photo);
	  filename_list.add(b_filename);
	  
	  } } //end:for
	  
	  
	  
	  
	  //DB에 insert board int res = board_dao.insert(vo);
	  
	  int b_idx = board_dao.select_get_b_idx();
	  
	  
	  // 게시글 번호 얻기 // int b_idx = board_dao.select_get_b_idx();
	  
	  System.out.println("b_idx: " + b_idx);
	  
	  
	  //DB에 insert post_images
	  
	  Map<String, Object> map = new HashMap<String, Object>(); BoardImagesVo ivo =
	  new BoardImagesVo();
	  
	  for (String filename : filename_list) {
	  
	  System.out.println(filename); ivo.setB_idx(b_idx); b_filename= filename;
	  ivo.setB_filename(b_filename); System.out.println("b_idx:" + ivo.getB_idx());
	  System.out.println("b_filename:" + ivo.getB_filename()); int res2 =
	  board_images_dao.insert_board_images(ivo); }
	  
	  
	  System.out.println("filename_list" + filename_list); {
	  
	  
	  
	  
	  }
	  
	  return "board_view"; }
	 */
//--------------------------------------------imodify.do--------------------------------------
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	
	
//--------------------------------------------modify_form.do--------------------------------------	

	@RequestMapping("modify_form.do")
	public String modify_form(int b_idx, BoardVo vo,
								Model model,
								RedirectAttributes ra) {
		
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user == null) {
			
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
	
<<<<<<< HEAD
//--------------------------------------------modify_form.do--------------------------------------	
=======
//--------------------------------------------imodify_form.do--------------------------------------	
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	
	
	
	
<<<<<<< HEAD
//--------------------------------------------modify.do--------------------------------------
=======
//--------------------------------------------imodify.do--------------------------------------
>>>>>>> refs/remotes/origin/CheonTk's-Branch
	@RequestMapping("modify.do")
	public String modify(int b_idx, BoardVo vo, RedirectAttributes ra) {
	
		
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

