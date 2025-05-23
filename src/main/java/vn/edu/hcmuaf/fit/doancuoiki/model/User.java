package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String email;
    private String password;
    private UserInfo userInfo;
    private int roleId;
    private int active;

    public int getActive() {
        return active;
    }

    public User() {
    }

    public User(String email, String password, UserInfo userInfo, int active) {
        this.email = email;
        this.password = password;
        this.userInfo = userInfo;
        this.roleId = 2;
        this.active = active;
    }

    public User(int id, String email, String password, UserInfo userInfo, int roleId, int active) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.userInfo = userInfo;
        this.roleId = roleId;
        this.active = active;
    }

    public User(int id, String email, UserInfo userInfo, int roleId, int active) {
        this.id = id;
        this.email = email;
        this.userInfo = userInfo;
        this.roleId = roleId;
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int isActive() {
        return active;
    }

    public void setActive(int active) {this.active = active;}

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", userInfo=" + userInfo +
                ", roleId=" + roleId +
                ", isActive=" + active +
                '}';
    }

    public void getFacebookId(String id) {
    }

    public void setName(String name) {
    }

    public void setAvata(String picture) {
    }

    public void setFullname(String name) {
    }
}