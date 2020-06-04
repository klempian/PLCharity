package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;


@RequiredArgsConstructor
@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

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
