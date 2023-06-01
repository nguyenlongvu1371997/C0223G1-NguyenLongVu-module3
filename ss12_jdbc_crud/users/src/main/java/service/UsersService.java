package service;

import model.Users;
import repository.UsersRepository;

import java.util.List;

public class UsersService implements IUsersService {
    UsersRepository usersRepository = new UsersRepository();

    @Override
    public List<Users> display() {
        return usersRepository.display();
    }

    @Override
    public void create(Users user) {
        usersRepository.create(user);
    }

    @Override
    public void delete(int index) {
        usersRepository.deleteUser(index);
    }

    @Override
    public void update(int id, Users users) {
        usersRepository.update(id, users);
    }
}
