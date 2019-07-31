/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.json;

import com.medata.entities.Legal;
import com.medata.entities.SaveFAQ;

/**
 *
 * @author Chicken
 */
public class UserJson {
    private String success;
    private String message;
    private SaveFAQ data; 

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public SaveFAQ getData() {
        return data;
    }

    public void setData(SaveFAQ data) {
        this.data = data;
    }

    public void setData(Legal f) {
        this.data = data;
    }
    
    
    
    
}

