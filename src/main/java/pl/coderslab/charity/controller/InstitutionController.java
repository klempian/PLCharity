package pl.coderslab.charity.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;
import java.util.NoSuchElementException;

@Controller
@Secured("ROLE_ADMIN")
@RequestMapping("/institutions")
public class InstitutionController {

    private InstitutionRepository institutionRepository;

    public InstitutionController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @RequestMapping("/")
    public String viewInstitutionList(Model model) {

        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("institutions", institutions);

        return "institution/list";
    }

    @GetMapping("/add-edit")
    public String institutionForm(@RequestParam(required = false) Long institutionId, Model model) {
        try {
            Institution institution = institutionId == null ? new Institution() : institutionRepository.findById(institutionId).get();
            model.addAttribute("institution", institution);
        } catch (NoSuchElementException e) {
//            add error message
            return "redirect:/institutions/";
        }

        return "institution/form";
    }

    @PostMapping("/add-edit")
    public String saveInstitution(Institution institution) {

        institutionRepository.save(institution);
        return "redirect:/institutions/";
    }

    @GetMapping("/delete")
    public String deleteInstitution(@RequestParam Long institutionId) {

        try {
        Institution institution = institutionRepository.findById(institutionId).get();
            institutionRepository.delete(institution);
        } catch (NoSuchElementException e) {
//            add error message
            return "redirect:/institutions/";
        }

        return "redirect:/institutions/";
    }
}
