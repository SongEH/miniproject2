package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.StatisticsDAO;

@Controller
@RequestMapping("/statistics/")
public class StatisticsController {

    @Autowired
    private StatisticsDAO statisticsDAO;

    @RequestMapping("view.do")
    public String viewStatistics(Model model) {
        int totalMembers = statisticsDAO.getTotalMembers();
        List<Map<String, Object>> membersByRegion = statisticsDAO.getMembersByRegion();
        int totalPets = statisticsDAO.getTotalPets();
        double averagePetsPerMember = statisticsDAO.getAveragePetsPerMember();
        List<Map<String, Object>> petsByBreed = statisticsDAO.getPetsByBreed();
        List<Map<String, Object>> pValueStatistics = statisticsDAO.getPValueStatistics();

        model.addAttribute("totalMembers", totalMembers);
        model.addAttribute("membersByRegion", membersByRegion);
        model.addAttribute("totalPets", totalPets);
        model.addAttribute("averagePetsPerMember", averagePetsPerMember);
        model.addAttribute("petsByBreed", petsByBreed);
        model.addAttribute("pValueStatistics", pValueStatistics);

        return "statistics/statistics";
    }
}
