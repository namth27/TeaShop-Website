/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package object;

import java.util.Objects;

/**
 *
 * @author admin
 */
public class CustomerObject implements Comparable<CustomerObject> {

    private int CustomerID;
    private String CustomerFullname;
    private String CustomerAddress;
    private String Phone;
    private String CustomerUsername;
    private String CustomerPassword;
    private String CustomerEmail;
    private int CustomerPosition;
    private String CustomerLogined;
    private String CustomerCreatedDate;
    private String CustomerModifiedDate;
    private String CustomerNotes;

    public CustomerObject() {
    }

    public CustomerObject(String CustomerEmail, String CustomerPassword) {
        this.CustomerPassword = CustomerPassword;
        this.CustomerEmail = CustomerEmail;
    }

    public CustomerObject(String CustomerUsername, String CustomerPassword, String CustomerEmail) {
        this.CustomerUsername = CustomerUsername;
        this.CustomerPassword = CustomerPassword;
        this.CustomerEmail = CustomerEmail;
    }
    
    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCustomerFullname() {
        return CustomerFullname;
    }

    public void setCustomerFullname(String CustomerFullname) {
        this.CustomerFullname = CustomerFullname;
    }

    public String getCustomerAddress() {
        return CustomerAddress;
    }

    public void setCustomerAddress(String CustomerAddress) {
        this.CustomerAddress = CustomerAddress;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getCustomerUsername() {
        return CustomerUsername;
    }

    public void setCustomerUsername(String CustomerUsername) {
        this.CustomerUsername = CustomerUsername;
    }

    public String getCustomerPassword() {
        return CustomerPassword;
    }

    public void setCustomerPassword(String CustomerPassword) {
        this.CustomerPassword = CustomerPassword;
    }

    public String getCustomerEmail() {
        return CustomerEmail;
    }

    public void setCustomerEmail(String CustomerEmail) {
        this.CustomerEmail = CustomerEmail;
    }

    public int getCustomerPosition() {
        return CustomerPosition;
    }

    public void setCustomerPosition(int CustomerPosition) {
        this.CustomerPosition = CustomerPosition;
    }

    public String getCustomerLogined() {
        return CustomerLogined;
    }

    public void setCustomerLogined(String CustomerLogined) {
        this.CustomerLogined = CustomerLogined;
    }

    public String getCustomerCreatedDate() {
        return CustomerCreatedDate;
    }

    public void setCustomerCreatedDate(String CustomerCreatedDate) {
        this.CustomerCreatedDate = CustomerCreatedDate;
    }

    public String getCustomerModifiedDate() {
        return CustomerModifiedDate;
    }

    public void setCustomerModifiedDate(String CustomerModifiedDate) {
        this.CustomerModifiedDate = CustomerModifiedDate;
    }

    public String getCustomerNotes() {
        return CustomerNotes;
    }

    public void setCustomerNotes(String CustomerNotes) {
        this.CustomerNotes = CustomerNotes;
    }

    @Override
    public String toString() {
        return "CustomerObject{" + "CustomerID=" + CustomerID + ", CustomerFullname=" + CustomerFullname + ", CustomerAddress=" + CustomerAddress + ", Phone=" + Phone + ", CustomerUsername=" + CustomerUsername + ", CustomerPassword=" + CustomerPassword + ", CustomerEmail=" + CustomerEmail + ", CustomerPosition=" + CustomerPosition + ", CustomerLogined=" + CustomerLogined + ", CustomerCreatedDate=" + CustomerCreatedDate + ", CustomerModifiedDate=" + CustomerModifiedDate + ", CustomerNotes=" + CustomerNotes + '}';
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + Objects.hashCode(this.CustomerPassword);
        hash = 29 * hash + Objects.hashCode(this.CustomerEmail);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CustomerObject other = (CustomerObject) obj;
        return Objects.equals(this.CustomerEmail, other.CustomerEmail);
    }

    @Override
    public int compareTo(CustomerObject o) {
        if (o == null) {
            throw new NullPointerException("The object to compare to is null");
        }

        // Compare by user_name first
        int nameComparison = this.CustomerEmail.compareTo(o.CustomerEmail);
        if (nameComparison != 0) {
            return nameComparison;
        }

        // If user_name is the same, compare by user_pass
        return this.CustomerPassword.compareTo(o.CustomerPassword);
    }

}
