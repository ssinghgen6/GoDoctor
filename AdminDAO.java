/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.dao;

/**
 *
 * @author Chicken
 */
import com.medata.entities.Admin;
import com.medata.entities.Legal;
import com.medata.entities.SaveFAQ;
import com.medata.entities.Testimonial;
import com.medata.entities.UserSession;
import com.medata.entities.Users;
import java.util.List;
/**
 *
 * @author Chicken
 */
public interface AdminDAO {
    
    /**
     *
     * @param username
     * @param password
     * @return
     */
    public boolean login(String username, String password);
    
    public void signUp(Admin admin);
    
    public Admin find(String username);
    
    public Admin findById(String session_id,String username);

    public void storeId(UserSession us);
    
    public boolean logout(String username,String session_id);

    public void savefaq(SaveFAQ savefaq);

    public boolean editfaq(String uuid,String answer, String question);
    
    public boolean editlegal(String uuid,String Title, String Description);
    
    public boolean edittestimonial(String uuid,String name, String designation, String location,String testimonial, String live);
    
    public SaveFAQ findId(String id);

    public boolean removefaq(String uuid);
    
    public boolean removetestimonial(String uuid);

    public SaveFAQ getfaq(String question);
    
    public void testimonial(Testimonial testimonial);
    
    public List<SaveFAQ> getAllfaq();
    
    public List<Legal> getAllLegal();

    public List<Users> getAllUsers();
    
    public List<Testimonial> getAllTestimonial();
    
    public Users getUserById(String uid);
}

