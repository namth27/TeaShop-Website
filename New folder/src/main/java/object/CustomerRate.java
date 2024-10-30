/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package object;

/**
 *
 * @author admin
 */
public class CustomerRate {
    private int rateID;
    private int ProductID;
    private String CustomerName;
    private String Email;
    private String TimeRate;
    private String Response;
    private int Seen;

    public CustomerRate() {
    }

    public CustomerRate(int rateID, int ProductID, String CustomerName, String Email, String TimeRate, String Response, int Seen) {
        this.rateID = rateID;
        this.ProductID = ProductID;
        this.CustomerName = CustomerName;
        this.Email = Email;
        this.TimeRate = TimeRate;
        this.Response = Response;
        this.Seen = Seen;
    }

    public int getRateID() {
        return rateID;
    }

    public void setRateID(int rateID) {
        this.rateID = rateID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTimeRate() {
        return TimeRate;
    }

    public void setTimeRate(String TimeRate) {
        this.TimeRate = TimeRate;
    }

    public String getResponse() {
        return Response;
    }

    public void setResponse(String Response) {
        this.Response = Response;
    }
    
    public int getSeen() {
        return rateID;
    }

    public void setSeen(int Seen) {
        this.Seen = Seen;
    }

    @Override
    public String toString() {
        return "CustomerRate{" + "rateID=" + rateID + ", ProductID=" + ProductID + ", CustomerName=" + CustomerName + ", Email=" + Email + ", TimeRate=" + TimeRate + ", Response=" + Response + '}';
    }
    
    
}
