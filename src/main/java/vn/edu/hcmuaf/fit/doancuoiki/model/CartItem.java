package vn.edu.hcmuaf.fit.doancuoiki.model;

public class CartItem {
    private Product product;
    private int quantity;

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuanlity() {
        return quantity;
    }

    public void setQuanlity(int quanlity) {
        this.quantity = quanlity;
    }

    public boolean addQuanlity(int quanlity){
        this.quantity+=quanlity;
        return true;
    }
    public double getTotalPrice(){
        return this.quantity*this.product.getPrice();
    }
}
