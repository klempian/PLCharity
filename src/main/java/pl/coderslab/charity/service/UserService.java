package pl.coderslab.charity.service;

import pl.coderslab.charity.model.User;

public interface UserService {

    User findByUsername (String username);

    void saveUser (User user);
}
