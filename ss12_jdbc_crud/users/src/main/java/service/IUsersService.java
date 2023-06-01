package service;

import model.Users;

import java.util.List;

public interface IUsersService {
    List<Users> display();

    void create(Users user);

    void delete(int index);

    void update(int id, Users users);
}
