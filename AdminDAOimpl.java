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
import org.springframework.stereotype.Repository;
import com.medata.entities.Admin;
import com.medata.entities.SaveFAQ;
import com.medata.entities.Testimonial;
import com.medata.entities.UserSession;
import com.medata.dao.AdminDAO;
import com.medata.entities.Legal;
import com.medata.entities.Users;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import static org.springframework.data.mongodb.core.query.Update.update;

/**
 *
 * @author Chicken
 */
@Repository("AdminDAO")
public class AdminDAOimpl implements AdminDAO{

    @Autowired
    private MongoTemplate mongoTemplate;
    
    @Override
    public boolean login(String username, String password) {
        try {
            Query query = new Query();
            Admin  admin= mongoTemplate .findOne(query.addCriteria( Criteria.where("username").is(username).and("password").is(password)), Admin.class);
            if(admin.getUsername().equals(username)){
               return true;
                }
            else
            {
                return false;
            }
        } 
        catch (Exception e) {
            return false;
        }
    }
    
   @Override
   public void signUp(Admin admin){
       mongoTemplate.insert(admin);
   }

    @Override
    public boolean editfaq(String uuid,String answer,String question) {
    try{
        
        Query query=new Query();
        query.addCriteria(Criteria.where("uuid").is(uuid));
        Update update=new Update();
        update.set("answer", answer);
        update.set("question", question);
        WriteResult wr= mongoTemplate.updateFirst(query, update, "save_faq");
        if(wr.getN()>0)
            return true;
        else
            return false;
        
    }catch(Exception e){
           return false;
    }
    }
    
    @Override
    public boolean editlegal(String uuid,String Title,String Description) {
    try{
        System.out.println("reached");
        Query query=new Query();
        query.addCriteria(Criteria.where("uuid").is(uuid));
        Update update=new Update();
        update.set("Title", Title);
        update.set("Description", Description);
        WriteResult wr= mongoTemplate.updateFirst(query, update, "legal");
        if(wr.getN()>0)
            return true;
        else
            return false;
        
    }catch(Exception e){
           return false;
    }
    }
    
    @Override
    public boolean edittestimonial(String uuid,String name,String designation,String location,String testimonial,String live) {
    try{
        System.out.println("reached");
        Query query=new Query();
        query.addCriteria(Criteria.where("uuid").is(uuid));
        Update update=new Update();
        update.set("name", name);
        update.set("designation", designation);
        update.set("location", location);
        update.set("testimonial", testimonial);
        update.set("live", live);
        WriteResult wr= mongoTemplate.updateFirst(query, update, "testimonials");
        if(wr.getN()>0)
            return true;
        else
            return false;
        
    }catch(Exception e){
           return false;
    }
    }

    @Override
    public Admin find(String username) {
        try {
            Query query;
            query = new Query(Criteria.where("username").is(username));
            return mongoTemplate.findOne(query, Admin.class);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Admin findById(String session_id,String username) {
        try {
            Query query1;
            query1 = new Query(Criteria.where("session_id").is(session_id).and("username").is(username));
            return mongoTemplate.findById(query1, Admin.class);
        } catch (Exception e) {
            return null;
        }
  
    }

    @Override
    public void storeId(UserSession us) {
            mongoTemplate.insert(us);
            
    }

    @Override
    public boolean logout(String username,String session_id) {
        try {
            Query query1;
            query1 = new Query(Criteria.where("username").is(username).and("session_id").is(session_id));
            UserSession us= mongoTemplate.findOne(query1,UserSession.class);
           if(us.getUsername().equals(username) && us.getSession_id().equals(session_id)){
               mongoTemplate.remove(query1, UserSession.class);
               return true;
           }
           else{
               return false;
           }
        } catch (Exception e) {
            return false;
        }
    }
    
    @Override
    public SaveFAQ findId(String _id) {
         try {
            Query query1;
            query1 = new Query(Criteria.where("_id").is(_id));
            return mongoTemplate.findById(query1, SaveFAQ.class);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean removefaq(String uuid) {
         try {
           mongoTemplate.remove(new Query(Criteria.where("uuid").is(uuid)), SaveFAQ.class);
           return true;

        } catch (Exception e) {
            return false;
        }
        
    }
    
    
    @Override
    public boolean removetestimonial(String uuid) {
         try {
           mongoTemplate.remove(new Query(Criteria.where("uuid").is(uuid)), Testimonial.class);
           return true;

        } catch (Exception e) {
            return false;
        }
        
    }


    @Override
    public SaveFAQ getfaq(String uuid) {
        try {
                 
//           SaveFAQ faq= mongoTemplate.findById(new Query(Criteria.where("_id").is(_id)), SaveFAQ.class);          
//           return faq;
 
           Query query2 = new Query();
           query2.addCriteria(Criteria.where("uuid").is(uuid));
           SaveFAQ faq=mongoTemplate.findOne(query2,SaveFAQ.class);
           if(faq==null)
           {
               System.out.println("welcome");           
           }
           else
           {
               System.out.println("not good");
           }
           return faq;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
     @Override
    public List<SaveFAQ> getAllfaq() {

           List<SaveFAQ> faq=mongoTemplate.findAll(SaveFAQ.class);
           return faq;
           
    }
    
    @Override
    public List<Legal> getAllLegal() {

           List<Legal> legal=mongoTemplate.findAll(Legal.class);
           return legal;
           
    }
    
     
    @Override
    public List<Testimonial> getAllTestimonial() {
          return mongoTemplate.findAll(Testimonial.class);
          
    }
    
    @Override
    public void savefaq(SaveFAQ savefaq) {
        //savefaq.("getNextSequenceValue(\"questionid\")");
        mongoTemplate.insert(savefaq);
    }

    @Override
    public void testimonial(Testimonial testimonial) {
         mongoTemplate.insert(testimonial);
    }

    @Override
    public List<Users> getAllUsers() {
         List<Users> users=mongoTemplate.findAll(Users.class);
         return users;
           
    }

    @Override
    public Users getUserById(String uid) {
           Query query2 = new Query();
           query2.addCriteria(Criteria.where("id").is(uid));
           Users user=mongoTemplate.findOne(query2,Users.class);
           return user;
     }

   
}
