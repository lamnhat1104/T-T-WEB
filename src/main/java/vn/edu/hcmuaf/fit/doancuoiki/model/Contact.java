package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

public class Contact implements Serializable {
    private int id;
    private String fullName;
    private String email;
    private String message;
    private Date createDate;
    private int processingStatus;

    public Contact() {
    }

    public Contact(int id, String fullName, String email, String message, Date createDate, int processingStatus ) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.message = message;
        this.createDate = createDate;
        this.processingStatus = processingStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getProcessingStatus() {
        return processingStatus;
    }

    public void setProcessingStatus(int processingStatus) {
        this.processingStatus = processingStatus;
    }
}
