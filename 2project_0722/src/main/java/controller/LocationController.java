package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.LocationService;
import vo.LocationVo;

@Controller
public class LocationController {
	@Autowired
	LocationService locationService;

	@Autowired
	HttpServletRequest request;

	
	@RequestMapping("/searchlocation.do")
	public String getLocation( @RequestParam(name="sido") String sido,@RequestParam(name="cate") String cate, Model model) {
		
		List<LocationVo> locations = locationService.searchLocation(sido, cate);
		model.addAttribute("locations", locations);
		
		return"location/testview2";
	}
		
}
