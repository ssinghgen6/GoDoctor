/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.entities;

import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Chicken
 */
@Document(collection = "user_session")
public class UserSession {
    private String session_id;
    private String username;

    public String getSession_id() {
        return session_id;
    }

    public void setSession_id(String session_id) {
        this.session_id = session_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
