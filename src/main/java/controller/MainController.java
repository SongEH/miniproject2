package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDao;
import dao.BoardImagesDao;
import vo.BoardImagesVo;
import vo.BoardVo;

@Controller
public class MainController {

	//자동연결(요청시 마다 Injection)
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;

	@Autowired
	BoardDao board_dao;
	
	@Autowired
	BoardImagesDao board_images_dao;
	
	public MainController() {
		System.out.println("--MainController()--");
	}
	

	@RequestMapping("main.do")
	public String main(Model model) {
		
		String b_cate = "free";
		
		
//		Board 정보 가지고 오기 
		List<BoardVo> list = board_dao.selectList(b_cate);
		
		int b_idx = 0;

		for (BoardVo vo : list) {
			b_cate = vo.getB_cate();
			b_idx = vo.getB_idx();
			
			/* System.out.println("b_cate" + b_cate); */
		}
		
		
		List<String> image_file = new ArrayList<String>();

		List<BoardImagesVo> post_list = board_images_dao.selectlist(b_idx);

		if (post_list != null) {

			for (BoardImagesVo image : post_list) {
				/* System.out.println(image.getB_filename()); */

				image_file.add(image.getB_filename());

			}
			
		}
		

		
		
		model.addAttribute("image_file", image_file);
		model.addAttribute("list", list);
		
		return "main";
	}

	@RequestMapping("/news/news.do")
	public String news() {
		return"news/news_main";
	}
	
	@RequestMapping("/location/location.do")
	public String place() {
		return"location/location_main";
	}
	
}
