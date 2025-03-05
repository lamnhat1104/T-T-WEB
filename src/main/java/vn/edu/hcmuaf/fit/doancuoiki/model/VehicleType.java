package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.util.Date;

public class VehicleType {
    private int id;
    private String name;
    private Date manufactureYear;
    private String brand;
    private String category;
    private double depositPrice;
    private double totalPrice;
    private String requiredLicense;
    private String description;
    private String image;
    private int totalVehicles;
    private int available;

    public VehicleType() {
    }

    public VehicleType(int id, String name, String brand, String category, double totalPrice, String description, String image, int totalVehicles, int available) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.category = category;
        this.totalPrice = totalPrice;
        this.description = description;
        this.image = image;
        this.totalVehicles = totalVehicles;
        this.available = available;
    }

    public VehicleType(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getManufactureYear() {
        return manufactureYear;
    }

    public void setManufactureYear(Date manufactureYear) {
        this.manufactureYear = manufactureYear;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getDepositPrice() {
        return depositPrice;
    }

    public void setDepositPrice(double depositPrice) {
        this.depositPrice = depositPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getRequiredLicense() {
        return requiredLicense;
    }

    public void setRequiredLicense(String requiredLicense) {
        this.requiredLicense = requiredLicense;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getTotalVehicles() {
        return totalVehicles;
    }

    public void setTotalVehicles(int totalVehicles) {
        this.totalVehicles = totalVehicles;
    }


    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "VehicleType{" +
                "description='" + description + '\'' +
                '}';
    }
}
