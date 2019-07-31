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
@Document(collection = "testimonials")
public class Testimonial {
    @Id
    private String id;
    private String uuid;
    private String name;
    private String designation;
    private String location;
    private String testimonial;
    private String live;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(String testimonial) {
        this.testimonial = testimonial;
    }

    public String getLive() {
        return live;
    }

    public void setLive(String live) {
        this.live = live;
    }

   
}
