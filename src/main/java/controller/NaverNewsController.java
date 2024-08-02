package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.NaverNewsService;
import vo.NewsItem;

@Controller
public class NaverNewsController {

	
	@Autowired
	NaverNewsService naverNewsService;
	
	
	
	public NaverNewsController() {
		// TODO Auto-generated constructor stub
		//System.out.println("newscontroller");
	}
	

	@RequestMapping("/searchnews.do")
    public String getNews(@RequestParam("query") String query, Model model) {
        List<NewsItem> newsItems = NaverNewsService.searchJson(query);
        model.addAttribute("newsItems", newsItems);
        
        return "news/testview";
    }
}
