package service;

import model.Users;

import java.util.List;

public interface IUsersService {
    List<Users> display();

    List<Users> find(int roomId, String name1);

//    void create(Users user);
//
//    void delete(int index);
//
//    void update(int id, Users users);
}
