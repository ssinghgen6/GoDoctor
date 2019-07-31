/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.entities;

import java.util.Date;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Chicken
 */
@Document(collection = "users")
public class Users {
    @Id
//@GeneratedValue(strategy = GenerationType.AUTO)
//@Column(name = "id")
    private String id;
    private String MID;
    private String Contact_no;
    private String Username;
    private Date Registerd_on;
    private Date Last_login;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMID() {
        return MID;
    }

    public void setMID(String MID) {
        this.MID = MID;
    }

    public String getContact_no() {
        return Contact_no;
    }

    public void setContact_no(String Contact_no) {
        this.Contact_no = Contact_no;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public Date getRegisterd_on() {
        return Registerd_on;
    }

    public void setRegisterd_on(Date Registerd_on) {
        this.Registerd_on = Registerd_on;
    }

    public Date getLast_login() {
        return Last_login;
    }

    public void setLast_login(Date Last_login) {
        this.Last_login = Last_login;
    }

  

    

}
