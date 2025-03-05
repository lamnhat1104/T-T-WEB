package vn.edu.hcmuaf.fit.doancuoiki.model;

public class OrderDetail {
    private int orderId;
    private String licensePlate;
    private String vehicleName;
    private double priceAtOrder;

    public OrderDetail(int orderId, String licensePlate, String name, double priceAtOrder) {
        this.orderId = orderId;
        this.licensePlate = licensePlate;
        this.vehicleName = name;
        this.priceAtOrder = priceAtOrder;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public double getPriceAtOrder() {
        return priceAtOrder;
    }

    public void setPriceAtOrder(double priceAtOrder) {
        this.priceAtOrder = priceAtOrder;
    }
}
