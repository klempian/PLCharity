package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

@Controller
@Secured("ROLE_ADMIN")
public class AdminController {

    private final UserService userService;

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private InstitutionRepository institutionRepository;
    private DonationRepository donationRepository;
    private CategoryRepository categoryRepository;

    @Autowired
    public AdminController(UserService userService, UserRepository userRepository, RoleRepository roleRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository, CategoryRepository categoryRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
    }

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

}
