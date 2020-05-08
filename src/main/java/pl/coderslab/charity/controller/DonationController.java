package pl.coderslab.charity.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.CurrentUser;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
//@RequestMapping("/donate")
@Secured("ROLE_USER")
public class DonationController {

    private CategoryRepository categoryRepository;
    private InstitutionRepository institutionRepository;
    private DonationRepository donationRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/donate")
    public String viewForm(@AuthenticationPrincipal CurrentUser currentUser, Model model) {

        Donation donation = new Donation();
        donation.setUser(currentUser.getUser());
        model.addAttribute("donation", donation);

        model.addAttribute("categories", categoryRepository.findAll() );

        model.addAttribute("institutions", institutionRepository.findAll());

        return "form";
    }

    @PostMapping("/donate")
    public String saveDonation(Donation donation) {

        donationRepository.save(donation);
        return "thankyou";
    }

    @RequestMapping("/user/donations")
    public String viewUserDonations(@AuthenticationPrincipal CurrentUser currentUser, Model model) {

        User user = currentUser.getUser();
        List<Donation> userDonations = donationRepository.findAllByUserOrderByPickUpDateDesc(user);
        model.addAttribute("donations", userDonations);

        return "user/donations";
    }

}
