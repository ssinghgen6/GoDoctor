/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.entities;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Chicken
 */

@Document(collection = "admin")
public class Admin {
    
    @Id
    private String id;
    private String username;
    private String password;
    private String fullname;
    private String mobile;
//    private boolean status;
    
    public String getId(){
        return id;
    }
    
    public void setId(String id){
        this.id = id;
    }
    
    public String getUsername(){
        return username;
    }
    
    public void setUsername(String username){
        this.username = username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public String getFullname(){
        return fullname;
    }
    
    public void setFullname(String fullname){
        this.fullname = fullname;
    }
    
//    public String getMobile(){
//        return mobile;
//    }
//    
//    public void setMobile(String mobile){
//        this.mobile = mobile;
//    }   
}

