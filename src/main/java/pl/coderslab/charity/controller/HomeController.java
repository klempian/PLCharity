package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {

    private InstitutionRepository institutionRepository;
    private DonationRepository donationRepository;

    @Autowired
    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }


    @RequestMapping("/")
    public String homeAction(Model model){

        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("institutions", institutions);

        Long quantitySum = donationRepository.countDonationsQuantitySum();
        model.addAttribute("quantitySum", quantitySum == null ? 0 : quantitySum);

        Long donationCount = donationRepository.count();
        model.addAttribute("donationCount", donationCount);

        return "index";
    }
}
