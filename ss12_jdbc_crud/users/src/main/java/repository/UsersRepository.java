package repository;

import model.Room;
import model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsersRepository implements IUsersRepository {
    static private String DISPLAY = "call findAll()";
    static private String ADD = "call add(?,?,?)";
    static private String DELETE = "call delete(?)";

    @Override
    public List<Users> display() {
        Connection connection = BaseRepository.getConnection();
        List<Users> list = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(DISPLAY);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new Users(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void deleteUser(int index) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1, index);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void create(Users user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD);
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<Users> find(int roomId, String name) {
        return null;
    }
//    static private String DISPLAY = "select*from users join room where room.id = users.room_id";
//    static private String ADD = "insert into users(`name`, email, country) values(?,?,?);";
//    static private String DELETE = "delete from users where id =?;";
//    static private String UPDATE = "update users set " +
//            "name = ?, email = ?, country = ?" +
//            "where id =?;";
//
//    @Override
//    public List<Users> display() {
//        Connection connection = BaseRepository.getConnection();
//        return displayListUser(connection, DISPLAY);
//    }
//
//    @Override
//    public void deleteUser(int index) {
//        Connection connection = BaseRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
//            preparedStatement.setInt(1, index);
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//
//    }
//
//    @Override
//    public List<Users> find(int roomId, String name1) {
//        Connection connection = BaseRepository.getConnection();
//        String string;
//        if (roomId == 0) {
//            string = "select*from users join room where room.id = users.room_id and `name` like '%" + name1 + "%'";
//        }else {
//            string = "select*from users join room where room.id = users.room_id and room_id=" + roomId + " and `name` like '%" + name1 + "%'";
//            System.out.println(string);
//        }
//        return displayListUser(connection, string);
//    }
//
//    private List<Users> displayListUser(Connection connection, String string) {
//        List<Users> list = new ArrayList<>();
//        try {
//            Statement statement = connection.createStatement();
//            ResultSet resultSet = statement.executeQuery(string);
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                String email = resultSet.getString("email");
//                String country = resultSet.getString("country");
//                Room room = new Room(resultSet.getString("room_name"));
//                list.add(new Users(id, name, email, country, room));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//
//        return list;
//    }
//
//
//
//    public void create(Users user) {
//        Connection connection = BaseRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//
//    public void update(int id, Users user) {
//        Connection connection = BaseRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.setInt(4, id);
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
}
