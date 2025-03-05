package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.io.Serializable;

public class Product implements Serializable {
    private int number;
    private int id;
    private String name;
    private int year;

    private String brand;
    private String type;
    private double price;
    private String description;
    private String img;
    private int quantity;

    private String numberPlate;
    public int getQuantity() {
        return quantity;
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

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }



    public String getNumberPlate() {
        return numberPlate;
    }

    public void setNumberPlate(String numberPlate) {
        this.numberPlate = numberPlate;
    }

    public Product(int id, String name, int year, String brand, String type, double price, String description, String img, String numberPlate) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.brand = brand;
        this.type = type;
        this.price = price;
        this.description = description;
        this.img = img;
        this.numberPlate = numberPlate;
    }


    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", year=" + year +
                ", brand='" + brand + '\'' +
                ", type='" + type + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", img='" + img + '\'' +
                ", numberPlate='" + numberPlate + '\'' +
                '}';
    }
    public Product(int id, String name, int year, String brand, String type, double price, String description, String img, int number) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.brand = brand;
        this.type = type;
        this.price = price;
        this.description = description;
        this.img = img;
        this.number = number;
    }


    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

}


