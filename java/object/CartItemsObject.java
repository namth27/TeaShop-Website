/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package object;

/**
 *
 * @author admin
 */
public class CartItemsObject {

    private int cartItemID;
    private int customerID;
    private int productID;
    private String ProductImage;
    private String ProductName;
    private double UnitPrice;
    private int quantity;
    private String createdDate;

    public CartItemsObject() {
    }

    public CartItemsObject(int customerID, int productID, String ProductImage, String ProductName, double UnitPrice, int quantity) {
        this.customerID = customerID;
        this.productID = productID;
        this.ProductImage = ProductImage;
        this.ProductName = ProductName;
        this.UnitPrice = UnitPrice;
        this.quantity = quantity;
    }
    

    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public Double tongTien(Double UnitPrice, int quantity) {
        return UnitPrice * quantity;
    }

    @Override
    public String toString() {
        return "CartItemsObject{" + "cartItemID=" + cartItemID + ", customerID=" + customerID + ", productID=" + productID + ", ProductImage=" + ProductImage + ", ProductName=" + ProductName + ", UnitPrice=" + UnitPrice + ", quantity=" + quantity + ", createdDate=" + createdDate + '}';
    }

}
