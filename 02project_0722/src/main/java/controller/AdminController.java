package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.HealthDAO;
import dao.MemberDAO;
import dao.PetDAO;
import vo.HealthVO;
import vo.MemberVO;
import vo.PetVO;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
    @Autowired
    private MemberDAO memberDAO;
    
    @Autowired
    private PetDAO petDAO;
    
    @Autowired
    private HealthDAO healthDAO;
    
    @GetMapping("menu")
    public String adminMenu() {
        return "admin/adminMenu";
    }
    
    @RequestMapping("petList.do")
    public String petList(Model model, @RequestParam(required = false) String searchKeyword, Integer page) {
        if (page == null) {
            page = 1;
        }
        int limit = 10;
        int offset = (page - 1) * limit;

        List<PetVO> pets = petDAO.getPetsWithPaging(offset, limit, searchKeyword);
        int totalPets = petDAO.getPetCount(searchKeyword);
        int totalPages = (int) Math.ceil(totalPets / (double) limit);

        model.addAttribute("pets", pets);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "pet/petList";
    }
    
    @RequestMapping("memberListForPets.do")
    public String memberListForPets(Model model, @RequestParam(required = false) String searchKeyword, Integer page) {
        if (page == null) {
            page = 1;
        }
        int limit = 20;
        int offset = (page - 1) * limit;

        List<MemberVO> members = memberDAO.getMembersWithPaging(offset, limit, searchKeyword, null, null);
        int totalMembers = memberDAO.getMemberCount(searchKeyword, null, null);
        int totalPages = (int) Math.ceil(totalMembers / (double) limit);

        model.addAttribute("members", members);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "admin/memberListForPets";
    }

    @RequestMapping("memberPetList.do")
    public String memberPetList(@RequestParam("m_idx") int m_idx, Model model) {
        List<PetVO> pets = petDAO.getPetsByMemberId(m_idx);
        model.addAttribute("pets", pets);
        model.addAttribute("m_idx", m_idx);
        return "admin/memberPetList";
    }
    
    @RequestMapping(value = "register.do", method = RequestMethod.GET)
    public String createMemberForm(Model model) {
        return "admin/memberRegister";
    }

    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    public String createMember(MemberVO member) {
        memberDAO.insertMember(member);
        return "redirect:../member/list.do";
    }
    
    @RequestMapping("healthList.do")
    public String healthList(Model model, @RequestParam(required = false) String searchKeyword, Integer page) {
        if (page == null) {
            page = 1;
        }
        int limit = 10;
        int offset = (page - 1) * limit;

        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("searchKeyword", searchKeyword);

        List<HealthVO> healthRecords = healthDAO.getHealthRecordsWithPaging(params);
        int totalHealthRecords = healthDAO.getHealthRecordCount(params);
        int totalPages = (int) Math.ceil(totalHealthRecords / (double) limit);

        model.addAttribute("healthRecords", healthRecords);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "admin/healthList";
    }

    @RequestMapping(value = "healthDetail.do", method = RequestMethod.GET)
    public String healthDetail(@RequestParam("h_idx") int h_idx, Model model) {
        HealthVO health = healthDAO.getHealthRecordById(h_idx);
        model.addAttribute("health", health);
        return "admin/healthDetail";
    }

    @RequestMapping(value = "healthModify.do", method = RequestMethod.GET)
    public String healthModifyForm(@RequestParam("h_idx") int h_idx, Model model) {
        HealthVO health = healthDAO.getHealthRecordById(h_idx);
        model.addAttribute("health", health);
        return "admin/healthModify";
    }

    @RequestMapping(value = "healthModify.do", method = RequestMethod.POST)
    public String healthModify(HealthVO health, @RequestParam("h_time_str") String h_time_str) {
        try {
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            Date parsedTime = timeFormat.parse(h_time_str);
            health.setH_time(parsedTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        healthDAO.updateHealthRecord(health);
        return "redirect:healthList.do";
    }

    @RequestMapping(value = "healthDelete.do", method = RequestMethod.GET)
    public String healthDelete(@RequestParam("h_idx") int h_idx) {
        healthDAO.deleteHealthRecord(h_idx);
        return "redirect:healthList.do";
    }
    
}
