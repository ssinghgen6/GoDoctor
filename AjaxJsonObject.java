/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.entities;

import java.util.List;

/**
 *
 * @author Chicken
 */
public class AjaxJsonObject {
    
    List<SaveFAQ> faq;
    List<Legal> legal;
    List<Users> users;
    List<Testimonial> testimonial;

    public List<SaveFAQ> getFaq() {
        return faq;
    }

    public void setFaq(List<SaveFAQ> faq) {
        this.faq = faq;
    }

    public void setLegal(List<Legal> legal) {
        this.legal = legal;
    }

    public void setUsers(List<Users> users) {
        this.users = users;
    }
    
    public void setTestimonial(List<Testimonial> testimonial) {
        this.testimonial = testimonial;
    }
    
}
