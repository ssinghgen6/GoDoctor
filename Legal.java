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
@Document(collection = "legal")
public class Legal {
     @Id
//@GeneratedValue(strategy = GenerationType.AUTO)
//@Column(name = "id")
    private String id;
    private String uuid;
    private String Title;
    private String Description;
    private Date Created_on;
    private String Update;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    

    public Date getCreated_on() {
        return Created_on;
    }

    public void setCreated_on(Date Created_on) {
        this.Created_on = Created_on;
    }

    public String getUpdate() {
        return Update;
    }

    public void setUpdate(String Update) {
        this.Update = Update;
    }

    
    
}
