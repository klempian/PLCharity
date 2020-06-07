package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.CurrentUser;
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
public class UserController {

    private final UserService userService;
//
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
//    private final InstitutionRepository institutionRepository;
//    private final DonationRepository donationRepository;
//    private final CategoryRepository categoryRepository;
//
//    @RequestMapping("/admin/")
//    public String viewIndexPage(Model model) {
//
//        Long userCount = userRepository.countAllByEnabledAndRolesContains(1, roleRepository.findByName("ROLE_USER"));
//        model.addAttribute("userCount", userCount);
//
//        Long institutionCount = institutionRepository.count();
//        model.addAttribute("institutionCount", institutionCount);
//
//        Long donationCount = donationRepository.count();
//        model.addAttribute("donationCount", donationCount);
//        Long quantitySum = donationRepository.countDonationsQuantitySum();
//        model.addAttribute("donationBagCount", quantitySum == null ? 0 : quantitySum);
//
//        Map<String, Integer> chartData = new LinkedHashMap<String, Integer>();
//        List<Category> categories = categoryRepository.findAll();
//        categories.forEach(c -> chartData.put(c.getName(), donationRepository.countAllByCategoryListContains(c)));
//        model.addAttribute("chartData", chartData);
//
//        return "admin/dashboard";
//    }

    @Secured("ROLE_ADMIN")
    @RequestMapping("/users/")
    public String viewUserList(Model model) {

        List<User> users = userRepository.findAllByRolesContainsOrderByLastNameAscFirstNameAscUsernameAscEnabledDesc(roleRepository.findByName("ROLE_USER"));
        model.addAttribute("users", users);

        return "admin/userlist";
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping("/users/active")
    public String toggleUserActive(@RequestParam Long userId) {

        try {
            User user = userRepository.findById(userId).get();
            userService.toggleUserActive(user);
        } catch (NoSuchElementException e) {
//            add error message
            return "redirect:/users/";
        }

        return "redirect:/users/";
    }
//
//    @PostMapping("/admins/add-edit")
//    public String saveAdmin(User user) {
//
//        if(user.getId() == null) {
//            userService.saveAdmin(user);
//        } else {
//            userRepository.save(user);
//        }
//
//        return "redirect:/admins/";
//    }
//
@Secured("ROLE_ADMIN")
@GetMapping("/users/delete")
    public String deleteUser(@RequestParam Long userId) {
        try {
            User user = userRepository.findById(userId).get();
                userService.removeAdmin(user);
        } catch (NoSuchElementException e) {
//            add error message
            return "redirect:/users/";
        }

        return "redirect:/users/";
    }
}
