package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.HealthDAO;
import dao.MemberDAO;
import dao.PetDAO;
import vo.BoardVo;
/*import vo.HealthVO;*/
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
    
    @Autowired
    private BoardDao boardDao;
    
	@Autowired
	ServletContext application;
    
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
    
 /*   @RequestMapping("healthList.do")
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

    @RequestMapping("healthDetail.do")
    public String healthDetail(@RequestParam("h_idx") int h_idx, Model model) {
        HealthVO health = healthDAO.getHealthRecordById(h_idx);
        
        if (health.getH_date() != null) {
            model.addAttribute("formattedHdate", health.getH_date());
        }
        if (health.getH_ndate() != null) {
            model.addAttribute("formattedHndate", health.getH_ndate());
        }
        
        model.addAttribute("health", health);
        return "admin/healthDetail";
    }

    @RequestMapping(value = "healthModify.do", method = RequestMethod.GET)
    public String healthModifyForm(@RequestParam("h_idx") int h_idx, Model model) {
        HealthVO health = healthDAO.getHealthRecordById(h_idx);
        
        if (health.getH_date() != null) {
            model.addAttribute("formattedHdate", health.getH_date());
        }
        if (health.getH_ndate() != null) {
            model.addAttribute("formattedHndate", health.getH_ndate());
        }
        
        model.addAttribute("health", health);
        return "admin/healthModify";
    }

    @RequestMapping(value = "healthModify.do", method = RequestMethod.POST)
    public String healthModify(@ModelAttribute HealthVO health, @RequestParam("h_date") String h_date, @RequestParam("h_time") String h_time, @RequestParam("h_ndate") String h_ndate) {

    	//health.setH_idx(h_idx);
    	
        if (health.getH_date() == null || health.getH_date().isEmpty()) {
            HealthVO originalHealth = healthDAO.getHealthRecordById(health.getH_idx());
            health.setH_date(originalHealth.getH_date());
        }
        if (health.getH_ndate() == null || health.getH_ndate().isEmpty()) {
        	HealthVO originalHealth = healthDAO.getHealthRecordById(health.getH_idx());
            health.setH_ndate(originalHealth.getH_ndate());
        }
    	
        healthDAO.updateHealthRecord(health);
        return "redirect:healthList.do";
    }

    @RequestMapping("healthDelete.do")
    public String healthDelete(@RequestParam("h_idx") int h_idx) {
        healthDAO.deleteHealthRecord(h_idx);
        return "redirect:healthList.do";
    }
    */

    @RequestMapping(value = "petmodify.do", method = RequestMethod.GET)
    public String petModifyForm(@RequestParam("p_idx") int p_idx, Model model) {
        PetVO pet = petDAO.getPetById(p_idx);
        
        if (pet.getP_birthday() != null) {
            model.addAttribute("formattedBirthday", pet.getP_birthday());
        }

        model.addAttribute("pet", pet);
        return "admin/petModify";
    }

    @RequestMapping(value = "petmodify.do", method = RequestMethod.POST)
    public String petModify(PetVO pet, @RequestParam("file") MultipartFile file, @RequestParam("p_birthday") String p_birthday,@RequestParam("m_idx") int m_idx) throws IllegalStateException, IOException {
        String absPath = application.getRealPath("/resources/images/pets/");
        String p_filename = pet.getP_photo();

        if (!file.isEmpty()) {
            p_filename = file.getOriginalFilename();
            File f = new File(absPath, p_filename);

            if (f.exists()) {
                long tm = System.currentTimeMillis();
                p_filename = String.format("%d_%s", tm, p_filename);
                f = new File(absPath, p_filename);
            }
            file.transferTo(f);
        }

        pet.setP_photo(p_filename);

        if (pet.getP_birthday() == null || pet.getP_birthday().isEmpty()) {
            PetVO originalPet = petDAO.getPetById(pet.getP_idx());
            pet.setP_birthday(originalPet.getP_birthday());
        }

        petDAO.updatePet(pet);
        return "redirect:memberListForPets.do";
    }

    @RequestMapping("petdelete.do")
    public String petDelete(@RequestParam("p_idx") int p_idx) {
        petDAO.deletePet(p_idx);
        return "redirect:memberListForPets.do";
    }
    
    @RequestMapping("boardList.do")
    public String boardList(Model model, 
                            @RequestParam(required = false) String searchKeyword,
                            @RequestParam(required = false) String b_cate,
                            @RequestParam(required = false) Integer page) {
        if (page == null) {
            page = 1;
        }
        int limit = 10;
        int offset = (page - 1) * limit;

        Map<String, Object> params = new HashMap<>();
        params.put("start", offset);
        params.put("end", offset + limit);
        params.put("searchKeyword", searchKeyword);
        params.put("b_cate", b_cate);

        List<BoardVo> boards = boardDao.selectAdminList(params);
        int totalBoards = boardDao.selectAdminRowTotal(params);
        int totalPages = (int) Math.ceil(totalBoards / (double) limit);

        model.addAttribute("boards", boards);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("b_cate", b_cate);

        return "admin/boardList";
    }
    
}
