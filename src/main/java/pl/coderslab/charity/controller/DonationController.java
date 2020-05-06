package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

@Controller
@RequestMapping("/donate")
public class DonationController {

    private CategoryRepository categoryRepository;
    private InstitutionRepository institutionRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }

    @GetMapping("/")
    public String viewForm(Model model) {

        model.addAttribute("donation", new Donation());

        model.addAttribute("categories", categoryRepository.findAll() );

        model.addAttribute("institutions", institutionRepository.findAll());

        return "form";
    }

}
