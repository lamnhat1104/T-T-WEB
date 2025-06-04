package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String email;
    private String password;
    private UserInfo userInfo;
    private int roleId;
    private int active;

    // ✅ Thêm các trường dùng cho Google login
    private String fullname;
    private String avatar;
    private String role;

    public User() {}

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

    public void setActive(int active) {
        this.active = active;
    }

    // ✅ Getter/setter cho fullname, avatar, role

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // Không cần các hàm tạm dưới này nữa nếu đã có hàm đúng
    // public void setName(String name) {}
    // public void setAvata(String picture) {}
    // public void getFacebookId(String id) {}

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", userInfo=" + userInfo +
                ", roleId=" + roleId +
                ", active=" + active +
                ", fullname='" + fullname + '\'' +
                ", avatar='" + avatar + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
