/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.services;

import com.medata.dao.AdminDAO;
import com.medata.entities.Admin;
import com.medata.entities.Legal;
import com.medata.entities.SaveFAQ;
import com.medata.entities.Testimonial;
import com.medata.entities.UserSession;
import com.medata.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.medata.services.AdminServices;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chicken
 */
@Service("AdminServices")
public class AdminServicesImpl implements AdminServices {

    @Autowired
    private AdminDAO adminDAO;
    
    @Override
    @Transactional
    public boolean login(String username, String password) {
        return adminDAO.login(username, password);
    }
    
    @Override
    @Transactional
    public void signUp(Admin admin) {
        adminDAO.signUp(admin);
    }

    @Override
    @Transactional
    public boolean editfaq(String uuid,String answer,String question){
       return adminDAO.editfaq(uuid,answer,question);
    }
    
    @Override
    @Transactional
    public boolean editlegal(String uuid,String Title,String Description){
       return adminDAO.editlegal(uuid,Title,Description);
    }
    
    @Override
    @Transactional
    public boolean edittestimonial(String uuid,String name,String designation,String location,String testimonial,String live){
       return adminDAO.edittestimonial(uuid,name,designation,location,testimonial,live);
    }

    @Override
    @Transactional

    public Admin find(String username) {
        return adminDAO.find(username);
    }

    @Transactional
    @Override
    public void storeId(UserSession us) {
          adminDAO.storeId(us);
    }
    
    @Transactional
    @Override
    public boolean logout(String username, String session_id) {
         return adminDAO.logout(username, session_id);
    }

    @Override
    @Transactional
    public void savefaq(SaveFAQ savefaq) {
        adminDAO.savefaq(savefaq);
    }

    @Override
    public SaveFAQ findId(String id) {
      return adminDAO.findId(id);  
    }

    @Override
    public boolean removefaq(String uuid) {
         return adminDAO.removefaq(uuid);
    }
    
    @Override
    public boolean removetestimonial(String uuid) {
         return adminDAO.removetestimonial(uuid);
    }

    @Override
    public SaveFAQ getfaq(String question) {
        return adminDAO.getfaq(question);
    }

    @Override
    @Transactional
    public void testimonial(Testimonial testimonial) {
        adminDAO.testimonial(testimonial);
    }

    @Override
    public List<SaveFAQ> getAllfaq() {
        return adminDAO.getAllfaq();
    }

    @Override
    public List<Legal> getAllLegal() {
        return adminDAO.getAllLegal();
    }

    @Override
    public List<Users> getAllUsers() {
        return adminDAO.getAllUsers();
    }
    
//     @Override
//    public List<Testimonial> getAllTestimonial() {
//        return adminDAO.getAllTestimonial();
//    }


    @Override
    public Legal getlegal(String uuid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Testimonial> getAllTestimonial() {
      return adminDAO.getAllTestimonial();
      
    }

    @Override
    public Users getUserById(String uid) {
             return adminDAO.getUserById(uid);
    }

    
    
    
}
