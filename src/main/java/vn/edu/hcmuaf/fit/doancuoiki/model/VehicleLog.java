package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.sql.Date;

public class VehicleLog {
    private int id;
    private int adminId;
    private int productId;
    private String action;
    private String oldData;
    private String newData;
    private Date createdAt;

    public VehicleLog(int adminId, int productId, String action, String oldData, String newData) {
        this.adminId = adminId;
        this.productId = productId;
        this.action = action;
        this.oldData = oldData;
        this.newData = newData;
    }

    public VehicleLog() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getOldData() {
        return oldData;
    }

    public void setOldData(String oldData) {
        this.oldData = oldData;
    }

    public String getNewData() {
        return newData;
    }

    public void setNewData(String newData) {
        this.newData = newData;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
