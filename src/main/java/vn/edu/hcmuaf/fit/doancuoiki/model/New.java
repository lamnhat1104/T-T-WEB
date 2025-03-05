package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.util.Date;

public class New {
    private int id;
    private String tittle;
    private String content;
    private String image;
    private Date createdDate;
    private int isActive;

    public New(int id, String tittle, String content, String image, Date createdDate, int isActive) {
        this.id = id;
        this.tittle = tittle;
        this.content = content;
        this.image = image;
        this.createdDate = createdDate;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
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
