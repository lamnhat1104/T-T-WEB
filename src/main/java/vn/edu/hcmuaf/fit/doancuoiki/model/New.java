package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.util.Date;

public class New {
    private int id;
    private String title;
    private String content;
    private String image;
    private Date createdDate;
    private int isActive;

    public New(int id, String title, String content, String image, Date createdDate, int isActive) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.createdDate = createdDate;
        this.isActive = isActive;
    }

    public New() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }
}
