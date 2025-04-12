package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private int productId;
    private String username;
    private String comment;
    private Timestamp createdAt;

    public Comment() {}

    public Comment(int productId, String username, String comment) {
        this.productId = productId;
        this.username = username;
        this.comment = comment;
    }

    // Getters và Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", productId=" + productId +
                ", username='" + username + '\'' +
                ", comment='" + comment + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
