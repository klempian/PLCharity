package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    Long countAllByEnabledAndRolesContains(int enabled, Role role);
}
