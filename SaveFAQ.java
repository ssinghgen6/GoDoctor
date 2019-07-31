/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.entities;

import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Chicken
 */

@Document(collection = "save_faq")
public class SaveFAQ {
     
    
   @Id
//@GeneratedValue(strategy = GenerationType.AUTO)
//@Column(name = "id")
   private String _id;
    private String uuid;
    private String question;
    private String answer;
    private Date created_date;
    private String update_date;

    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    
    
    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

   

    


    
}
