package vn.edu.hcmuaf.fit.doancuoiki.model;

public class Vehicle {
    private String id;
    private int typeId;
    private String licensePlate;
    private String status;
    private int rentalCount;
    private int isInUse;

    public Vehicle(String id, int typeId, String licensePlate, String status, int rentalCount, int isInUse) {
        this.id = id;
        this.typeId = typeId;
        this.licensePlate = licensePlate;
        this.status = status;
        this.rentalCount = rentalCount;
        this.isInUse = isInUse;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRentalCount() {
        return rentalCount;
    }

    public void setRentalCount(int rentalCount) {
        this.rentalCount = rentalCount;
    }

    public int getIsInUse() {
        return isInUse;
    }

    public void setIsInUse(int isInUse) {
        this.isInUse = isInUse;
    }
}

