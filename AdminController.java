/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medata.controller;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.medata.entities.Admin;
import com.medata.entities.Admin_response;
import com.medata.entities.AjaxJsonObject;
import com.medata.entities.Legal;
import com.medata.entities.SaveFAQ;
import com.medata.entities.Testimonial;
import com.medata.entities.UserSession;
import com.medata.entities.Users;
import com.medata.json.UserJson;
import com.medata.services.AdminServices;
import com.mongodb.BasicDBObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.aspectj.bridge.MessageUtil.fail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import sun.security.tools.KeyStoreUtil;
import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import org.json.JSONException;
import org.json.JSONObject;
import static org.springframework.core.convert.TypeDescriptor.collection;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
/**
 *
 * @author Chicken
 */

@RestController
public class AdminController {
    
    @Autowired
    private AdminServices adminServices;
    
    Admin_response json=new Admin_response();
//    Dummy code to test
//    @RequestMapping(value="/test",method = RequestMethod.GET)
//    public Object index(){
//       Admin admin =new Admin();
//       admin.setId("1");
//       admin.setFullname("Nitesh");
//       admin.setPassword("123");
//       admin.setUsername("ns");
//       adminServices.signUp(admin);
//       return "test";
//    }
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index(ModelMap modelMap){
        modelMap.put("admin", new Admin());
        return new ModelAndView("login");
    }
    
    
//    Controller for initial registration
    @RequestMapping(value="/signup", method = RequestMethod.GET)
    public ModelAndView signup(ModelMap modelMap){
        modelMap.put("admin", new Admin());
       return new ModelAndView("http://localhost:8080/MeData/index.html");
        
    }
    
    
    @RequestMapping(value="signup", method = RequestMethod.POST)
    public RedirectView signup(@ModelAttribute("admin") Admin admin){
        admin.setPassword(admin.getPassword());
       adminServices.signUp(admin);
       return new RedirectView("http://localhost:8080/MeData/index.html");
   }
    
//    Controller for logging into the portal
     @RequestMapping(value="/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletRequest req,ModelMap model ){
        try{
            
        System.out.println("welcome to godoctor");    
        boolean admin2 = adminServices.login(username,password);
        if(admin2){
             String session_id= UUID.randomUUID().toString();
             HttpSession session=req.getSession(true);
             session.setAttribute("session_id",session_id);
             UserSession us=new UserSession();
             us.setUsername(username);
             session.setAttribute("userName",username);
             us.setSession_id(session_id);
             model.put("username", username);
           
             adminServices.storeId(us);
           
 //            json.setCode(771);
 //            json.setMessage("Login successfully");
 //            json.setSuccess(true);
//            return json;
//               return "/redirect";
            return new ModelAndView("dashboard",model);
           
             
        }
        else{
             json.setCode(772);
             json.setMessage("Login fail");
             json.setSuccess(false);
  //           return json;
             return new ModelAndView("login");
        }
        }catch(Exception e){
             json.setCode(772);
             json.setMessage("Login fail "+e.getMessage());
             json.setSuccess(false);
  //           return json;
  
         return new ModelAndView("login");
        }
    }
    
    
   
//    Controller for logging out of the portal
    @RequestMapping(value="/logout", method = RequestMethod.POST)
    public ModelAndView logout(@RequestParam("username") String username,@RequestParam("session_id") String session_id,HttpServletRequest res)
    {
       
        try{
        boolean f = adminServices.logout(username, session_id);
         if(f){
             HttpSession session=res.getSession(true);
             session.removeAttribute(username);
             session.removeAttribute(session_id);
            // return "success";
            return new ModelAndView("login");
            }
         else{
             System.out.println("Invalid user");
             //return "fail";
             return new ModelAndView("index");
          }
        }catch(Exception e){
           // return false; 
            return new ModelAndView("index");
        }
    }
    
    
    
//    Controller for saving the faq into the database
    @RequestMapping(value="/savefaq", method = RequestMethod.POST)
    public ModelAndView SaveFAQ(@RequestParam("question") String question,@RequestParam("answer") String answer) throws ScriptException, Exception{
        DateFormat df = new SimpleDateFormat("dd/MM/yy");
        String uuid = UUID.randomUUID().toString();
       // System.out.println("get uuid is"+uuid);
        Calendar calobj = Calendar.getInstance();
        SaveFAQ sf=new SaveFAQ();
        sf.setUuid(uuid);
        sf.setQuestion(question);
        sf.setAnswer(answer);
        sf.setCreated_date(calobj.getTime());
           
       adminServices.savefaq(sf);
      // return sf;
      return new ModelAndView("dashboard");
    }
    

//    Controller for editing the faq 
    @RequestMapping(value="/editfaq.htm", method = RequestMethod.POST)
    public ModelAndView editfaq(@RequestParam("uuid") String uuid,@RequestParam("answer") String answer,@RequestParam("question") String question,ModelMap modelMap) throws ScriptException, Exception{
    {
        System.out.println("LMAOOOOO");
        System.out.println("uuid id"+uuid);
        System.out.println("answer id"+answer);
         if(adminServices.editfaq(uuid, answer, question))
         {
             System.out.println("working fine");
             return new ModelAndView("dashboard");
         }
         else
             return new ModelAndView("fail");
                 
    }
    }
    
    
     @RequestMapping(value="/editlegal.htm", method = RequestMethod.POST)
    public ModelAndView editlegal(@RequestParam("uuid") String uuid,@RequestParam("Title") String Title,@RequestParam("Description") String Description,ModelMap modelMap) throws ScriptException, Exception{
    {
        System.out.println("LMAOOOOO");
        System.out.println("uuid id"+uuid);
        System.out.println("title id"+Title);
         if(adminServices.editlegal(uuid, Title,Description))
         {
             System.out.println("working fine");
             return new ModelAndView("dashboard");
         }
         else
             return new ModelAndView("fail");
                 
    }
    }
    
    
     @RequestMapping(value="/edittestimonial.htm", method = RequestMethod.POST)
    public ModelAndView edittestimonial(@RequestParam("uuid") String uuid,@RequestParam("name") String name,@RequestParam("designation") String designation,@RequestParam("location") String location,@RequestParam("testimonial") String testimonial,@RequestParam("live") String live,ModelMap modelMap) throws ScriptException, Exception{
    {
        System.out.println("Inside testimonial controller");
        System.out.println("uuid id"+uuid);
        System.out.println("name id"+name);
        System.out.println("description id"+designation);
        System.out.println("location id"+location);
        System.out.println("testimonial id"+testimonial);
         if(adminServices.edittestimonial(uuid, name,designation,location,testimonial,live))
         {
             System.out.println("working fine");
             return new ModelAndView("dashboard");
         }
         else
             return new ModelAndView("fail");
                 
    }
    }
    
//    Controller for removing the faq
    @RequestMapping(value="/removefaq.htm", method = RequestMethod.GET)
    public ModelAndView removefaq(@RequestParam("uuid") String uuid)
    {
        try{
        boolean f = adminServices.removefaq(uuid);
         if(f){
//             return "success";
               System.out.println("removefaq working fine");
               return new ModelAndView("dashboard");
            }
         else{
//             return "fail";
               System.out.println("you are a disgrace");
               return new ModelAndView("fail");
          }
        }catch(Exception e){
//            return false; 
              System.out.println(" disgrace");
              return new ModelAndView("fail");
        }
    }
    
    @RequestMapping(value="/removetestimonial.htm", method = RequestMethod.GET)
    public ModelAndView removetestimonial(@RequestParam("uuid") String uuid)
    {
        try{
        boolean f = adminServices.removetestimonial(uuid);
         if(f){
//             return "success";
               System.out.println("removetestimonial working fine");
               return new ModelAndView("dashboard");
            }
         else{
//             return "fail";
               System.out.println("you are a disgrace");
               return new ModelAndView("fail");
          }
        }catch(Exception e){
//            return false; 
              System.out.println(" disgrace");
              return new ModelAndView("fail");
        }
    }
    
    
//     Controller for viewing individual faq
     @RequestMapping(value="/getfaq.htm", method = RequestMethod.POST)
    public ModelAndView getfaq(@RequestParam("uuid") String uuid)
    {
        UserJson json1=new UserJson();
      
        try{
        SaveFAQ f = adminServices.getfaq(uuid);
        
        json1.setSuccess("true");
        json1.setMessage("Successfully Data");
        json1.setData(f);
        //return json1;
        return new ModelAndView("dashboard");
        
 
        }catch(Exception e){
            
           json1.setSuccess("false");
           json1.setMessage("fail data");
           //json1.setData(null);
           //return json1;
            return new ModelAndView("fail");
           
        }
    }
    

    
//    Controller for listing all the faq 
     @RequestMapping(value="/getAllFaq.htm", method = RequestMethod.GET)
     public  @ResponseBody ModelAndView getAllfaq(HttpServletResponse res) throws IOException
    {
        Writer out= res.getWriter();
        UserJson json1=new UserJson();
        System.out.println("welcome to sameer");
        try {
        List<SaveFAQ> f = adminServices.getAllfaq();   
        AjaxJsonObject object=new AjaxJsonObject();
        object.setFaq(f);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(object);
        System.out.println("get json object is"+json2);
//        GsonBuilder gsonBuilder = new GsonBuilder();
//        Gson gson = gsonBuilder.create();
//       String data = new Gson().toJson(f);
//    String data = gson.toJson(f);
//       System.out.println("data is"+data);
         out.write(json2);
//       out.print(json2);
        return null;
        }catch(Exception e){
           e.printStackTrace();
        }
        return null;
    }
    
     
//     Controller for saving the testimonial to the DB
    @RequestMapping(value="/testimonial.htm", method = RequestMethod.POST)
    public ModelAndView Testimonial(@RequestParam("name") String name,@RequestParam("designation") String designation,@RequestParam("location") String location,@RequestParam("testimonial")String testimonial,@RequestParam("live") String live ) throws ScriptException, Exception{
        String uuid = UUID.randomUUID().toString();
        Testimonial t=new Testimonial();
        t.setUuid(uuid);
        t.setName(name);
        t.setDesignation(designation);
        t.setLocation(location);
        t.setTestimonial(testimonial);
        t.setLive(live);
      
        adminServices.testimonial(t);
      //  return testimonial;
          return new ModelAndView("dashboard");
   }
    
      
//    Controller for listing all the Legal
     @RequestMapping(value="/getAllLegal.htm", method = RequestMethod.GET)
     public  @ResponseBody ModelAndView getAllLegal(HttpServletResponse res) throws IOException
    {
        Writer out= res.getWriter();
        UserJson json1=new UserJson();
        //System.out.println("welcome");
        try {
        List<Legal> f = adminServices.getAllLegal();   
        AjaxJsonObject object=new AjaxJsonObject();
        object.setLegal(f);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(object);        
        System.out.println("get Legal json object is"+json2);
         out.write(json2);
        return null;
        }catch(Exception e){           
           e.printStackTrace();
        }
        return null;
   }
     
     
//     Controller for retrieving all the users
     @RequestMapping(value="/getAllUsers.htm", method = RequestMethod.GET)
     public  @ResponseBody ModelAndView getAllUsers(HttpServletResponse res) throws IOException
    {
        Writer out= res.getWriter();
        UserJson json1=new UserJson();
        //System.out.println("welcome");
        try {
        List<Users> f = adminServices.getAllUsers();
        AjaxJsonObject object=new AjaxJsonObject();
        object.setUsers(f);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(object);
        System.out.println("get Users json object is"+json2);
         out.write(json2);
        return null;
        }catch(Exception e){   
           e.printStackTrace();
        }
        return null;
   }
     
     @RequestMapping(value="/getAllTestimonial.htm", method = RequestMethod.GET)
     public Object getAllTestimonial(HttpServletResponse res,HttpServletRequest req) throws  JSONException ,IOException
    {
        try{
             Testimonial t1=new Testimonial();
             List<Testimonial> f = adminServices.getAllTestimonial();
             AjaxJsonObject object=new AjaxJsonObject();
             object.setTestimonial(f);
             return new Gson().toJson(object);
         }catch(Exception e){
            return "";
         }

   }
     
     
     
     
     @RequestMapping(value="/users.htm", method = RequestMethod.GET)
     public ModelAndView users(HttpServletResponse res,HttpServletRequest req,ModelMap model) throws  JSONException ,IOException
    {
             String uid=req.getParameter("id");
             System.out.println("Abhi tak barabar"+uid);
             Users user= adminServices.getUserById(uid);
             String name= user.getUsername();
             String mid= user.getMID();
             String contact_no= user.getContact_no();
             model.put("name", name);
             model.put("mid", mid);
             model.put("contact_no", contact_no);
             System.out.println("get user data is"+name);
             System.out.println("get user data is"+mid);
             System.out.println("get user data is"+contact_no);
             return new ModelAndView("users",model);
        
   }
     
}