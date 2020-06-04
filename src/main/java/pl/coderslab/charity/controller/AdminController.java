package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

@RequiredArgsConstructor
@Controller
@Secured("ROLE_ADMIN")
public class AdminController {

    private final UserService userService;

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;

    @RequestMapping("/admin/")
    public String viewIndexPage(Model model) {

        Long userCount = userRepository.countAllByEnabledAndRolesContains(1, roleRepository.findByName("ROLE_USER"));
        model.addAttribute("userCount", userCount);

        Long institutionCount = institutionRepository.count();
        model.addAttribute("institutionCount", institutionCount);

        Long donationCount = donationRepository.count();
        model.addAttribute("donationCount", donationCount);
        Long quantitySum = donationRepository.countDonationsQuantitySum();
        model.addAttribute("donationBagCount", quantitySum == null ? 0 : quantitySum);

        Map<String, Integer> chartData = new LinkedHashMap<String, Integer>();
        List<Category> categories = categoryRepository.findAll();
        categories.forEach(c -> chartData.put(c.getName(), donationRepository.countAllByCategoryListContains(c)));
        model.addAttribute("chartData", chartData);

        return "admin/dashboard";
    }

    @RequestMapping("/admins/")
    public String viewAdminList(Model model) {

        List<User> admins = userRepository.findAllByRolesContainsOrderByLastNameAscFirstNameAscUsernameAscEnabledDesc(roleRepository.findByName("ROLE_ADMIN"));
        model.addAttribute("admins", admins);

        return "admin/list";
    }

    @RequestMapping("/admins/add-edit")
    public String adminForm(@RequestParam(required = false) Long adminId, Model model) {

        try {
            User admin = adminId == null ? new User() : userRepository.findById(adminId).get();
            model.addAttribute("admin", admin);
        } catch (NoSuchElementException e) {
//            add error message
            return "redirect:/admins/";
        }

        return "admin/form";
    }

    @PostMapping("/admins/add-edit")
    public String saveAdmin(User user) {

        if(user.getId() == null) {
            userService.saveAdmin(user);
        } else {
            userRepository.save(user);
        }

        return "redirect:/admins/";
    }

    @GetMapping("/admins/delete")
    public String deleteAdmin(@RequestParam Long adminId) {
        try {
            User admin = userRepository.findById(adminId).get();
            userService.removeAdmin(admin);
        } catch (NoSuchElementException e) {
//            add error message
            return "redirect:/admins/";
        }

        return "redirect:/admins/";
    }
}
