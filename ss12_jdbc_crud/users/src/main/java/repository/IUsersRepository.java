package repository;

import model.Users;

import java.util.List;

public interface IUsersRepository {
    List<Users> display();

    void deleteUser(int index);

    void create(Users user);

    void update(int id, Users users);
}
