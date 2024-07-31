package controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.PetDAO;
import vo.PetVO;

@Controller
@RequestMapping("/pet/")
public class PetController {

    @Autowired
    private PetDAO petDAO;
    
	@Autowired
	ServletContext application;

    @GetMapping("list.do")
    @ResponseBody
    public List<PetVO> getPetsByMemberId(@RequestParam("m_idx") int m_idx) {
        return petDAO.getPetsByMemberId(m_idx);
    }

    @RequestMapping(value = "register.do", method = RequestMethod.GET)
    public String registerForm(@RequestParam("m_idx") int m_idx, Model model) {
        model.addAttribute("m_idx", m_idx);
        return "pet/petRegister";
    }

    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    public String register(PetVO pet, @RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String uploadDir = application.getRealPath("/resources/images/pets/");
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String uploadPath = uploadDir + File.separator + fileName;

            File dest = new File(uploadPath);
            file.transferTo(dest);
            pet.setP_photo(fileName);  // Ensure this line is executed
        }

        petDAO.insertPet(pet);
        return "redirect:../member/mypage.do?m_idx=" + pet.getM_idx();
    }

    @RequestMapping(value = "modify.do", method = RequestMethod.GET)
    public String modifyForm(@RequestParam("p_idx") int p_idx, Model model) {
        PetVO pet = petDAO.getPetById(p_idx);
        
        if (pet.getP_birthday() != null) {
            model.addAttribute("formattedBirthday", pet.getP_birthday());
        }

        model.addAttribute("pet", pet);
        return "pet/petModify";
    }

    @RequestMapping(value = "modify.do", method = RequestMethod.POST)
    public String modify(PetVO pet, @RequestParam("file") MultipartFile file, @RequestParam("p_birthday") String p_birthday) throws IllegalStateException, IOException {
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
        return "redirect:../member/mypage.do?m_idx=" + pet.getM_idx();
    }

    @RequestMapping("delete.do")
    public String delete(@RequestParam("p_idx") int p_idx, @RequestParam("m_idx") int m_idx) {
        petDAO.deletePet(p_idx);
        return "redirect:../member/mypage.do?m_idx=" + m_idx;
    }
}
