package com.example;

import java.time.LocalDateTime;

public class Customer {
    private int id;
    private String Name;
   
    private String email;
    private String phone;
    private LocalDateTime registeredDate;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return Name; }
    public void setName(String Name) { this.Name = Name; }

    

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public LocalDateTime getRegisteredDate() { return registeredDate; }
    public void setRegisteredDate(LocalDateTime registeredDate) { this.registeredDate = registeredDate; }
}
