package model;

public class Users {
    private int id;
    private String name;
    private String email;
    private String country;
    private Room room;

    public Users(int id, String name, String email, String country, Room room) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.country = country;
        this.room = room;
    }

    public Users(int id, String name, String email, String country) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.country = country;
    }

    public Users(String name, String email, String country, Room room) {
        this.name = name;
        this.email = email;
        this.country = country;
        this.room = room;
    }

    public Users() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
