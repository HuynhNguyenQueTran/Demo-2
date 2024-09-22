/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

/**
 *
 * @author hd
 */
public class BookDTO {
    private String SKU;
    private String name;
    private double price;
    private String Description;
    private int quantity;

    public BookDTO(String SKU, String name, double price, String Description, int quantity) {
        this.SKU = SKU;
        this.name = name;
        this.price = price;
        this.Description = Description;
        this.quantity = quantity;
    }

    public BookDTO() {
    }

    public BookDTO(String SKU, String name, double price, int quantity) {
        this.SKU = SKU;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    
    public String getSKU() {
        return SKU;
    }

    public void setSKU(String id) {
        this.SKU = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

 
    
    
    
}
