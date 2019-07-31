<!doctype html>
<html lang="en">

<head>
<title>Dashboard</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/material-dashboard.css" rel="stylesheet" />
<link href="css/demo.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<script src="godoctor/jquery-3.2.1.min.js" type="text/javascript"></script>



<script>
    $.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var min = parseInt( $('#min').val(), 10 );
        var max = parseInt( $('#max').val(), 10 );
        var age = parseFloat( data[3] ) || 0; // use data for the age column
 
        if ( ( isNaN( min ) && isNaN( max ) ) ||
             ( isNaN( min ) && age <= max ) ||
             ( min <= age   && isNaN( max ) ) ||
             ( min <= age   && age <= max ) )
        {
            return true;
        }
        return false;
    }
);


$(document).ready(function() {
    alert("hello sir");
    var table = $('#example').DataTable();
     
    // Event listener to the two range filtering inputs to redraw on input
    $('#min, #max').keyup( function() {
        table.draw();
    } );
} );
    
    
</script>


 <script>
        function showFAQ()
        {    
//            var div = document.getElementById('faqs_data');
//            while(div.firstChild){
//                    div.removeChild(div.firstChild);
//            }
            $.ajax({
                type: "GET",
                url: "getAllFaq.htm",
                
                success: function (data) {  
                    
            var txt='';
            var jsonData = JSON.parse(data);
            for (var i = 0; i < jsonData.faq.length; i++) 
            {
            var question = jsonData.faq[i].question;
            var answer = jsonData.faq[i].answer;
           // $('.card').html(question);
            var created_date = jsonData.faq[i].created_date;
            //$('.card').html(created_date);
            var uuid = jsonData.faq[i].uuid;
       
            txt += "<tr><td>"+(i+1)+"</td><td>"+question+"</td><td>"+created_date+"</td><td class='data_class' data='"+answer+"' data1='"+uuid+"' data2='"+question+"'><img class='view_img h' src='images/eye.svg' data-toggle='modal' data-target='#Modal' />\n\
                                                                                        <img class='edit_img h' src='images/edit.svg' data-toggle='modal' data-target='#EditModal' /></a>\n\
                                                                                        <img class='delete_img' src='images/delete.svg' id='"+uuid+"' /></td>\n\
                                                                                                      </tr>";
          
            //$("#faqs_data").append(txt);
           
            //$('.card').html(txt);
            } 
            $('#faqs_data tr:not(:first)').remove();
            $('#faqs_data tr:last').after(txt);
            
        },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
        }
      
        
        
    </script>
    
    <script>    
    function textValue()
    {
                  var answer= document.getElementById("editpopup").value;
                  var uuid= document.getElementById("popupuuid").value;
                  var question = document.getElementById("editpopupquestion").value;
//                  alert(uuid);    
                  $.ajax({
                  type: "POST",
                  url: "editfaq.htm",
                  data: { uuid: uuid, answer : answer, question : question} ,
                success: function (data) {  
                    showFAQ();
                     },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
    }
    </script>
    
    <script>
        function savefaq(){
           
            var question= document.getElementById("exampleInputEmail1").value;
            var answer= document.getElementById("exampleInputPassword1").value; 
            
//            if(question=="")
//            {
//                alert("Please Enter Question");
//                var data2= document.getElementById("validq").value;
//                alert(data2);
//                document.getElementById("validq").innerHTML="Please Enter Question";
//                return false;
//            }
//            else if(answer=="")
//            {
//               document.getElementById("valida").innerHTML="Please Enter Answer";
//               
//                return false;
//            }
            
            
//            alert(question);
//            alert(answer);
             $.ajax({
                  type: "POST",
                  url: "savefaq.htm",
                  data: { question: question, answer: answer} ,
                success: function (data) { 
                    
                  var question= document.getElementById("exampleInputEmail1").value="";
                  var answer= document.getElementById("exampleInputPassword1").value=""; 
//                    var x = document.getElementById("squarespaceModal");
//                    x.close(); 
                    showFAQ();
                     },       
                error: function (e) {

                    alert('Error: ' + e);
                }
            });
            
        }
        
        
        
        function clearField()
        {
             var question= document.getElementById("exampleInputEmail1").value="";
             var answer= document.getElementById("exampleInputPassword1").value=""; 
        }
        
    </script>
    
     <script>
    function removefaq(uuid)
    {
        
        var x = confirm("Are you sure you want to delete?");
       
         if (x)
         {
                  $.ajax({
                  type: "GET",
                  url: "removefaq.htm",
                  data: { uuid: uuid} ,
                success: function (data) {  
                    showFAQ();
                     },       
                error: function (e) {

                    alert('Error: ' + e);
                }
            });
             
        return true;
         }
        else
        {
         return false;
        }
    }
    </script>
    
    
    <script>
       
//       this is the viewfaq script
        $(document).ready(function() {
            $("#faqs_data").on("click", ".data_class", function(e){
                answer = $(this).attr("data");
                question = $(this).attr("data2");
                $("#viewpopup").val(answer);
                $("#viewpopupquestion").val(question);
            });    
//            this is the deletefaq script
            $("#faqs_data").on("click", ".delete_img", function(e){
                uuid = $(this).attr("id");
                removefaq(uuid);
            });
       });
        
   </script>
    
   
   <script>
//       this is the editfaq script
        $(document).ready(function() {
            $("#faqs_data").on("click", ".data_class", function(e){
                 data = $(this).attr("data1");
                 data3 = $(this).attr("data");
                 question = $(this).attr("data2");
                 $("#editpopup").val(data3);
                 $("#popupuuid").val(data);
                 $("#editpopupquestion").val(question);
           });
        });
        
        
        
        
   </script>
   
   
     <script>
        function showLegal()
        {    
            $.ajax({
                type: "GET",
                url: "getAllLegal.htm",
                
                success: function (data) {  
                    
            var txt='';
            var jsonData = JSON.parse(data);
            for (var i = 0; i < jsonData.legal.length; i++) 
            {
            var title = jsonData.legal[i].Title;
            
           // $('.card').html(question);
            var created_on = jsonData.legal[i].Update;
            var description = jsonData.legal[i].Description;
            //$('.card').html(created_date);
            var uuid = jsonData.legal[i].uuid;
            
             
            txt += "<tr><td>"+(i+1)+"</td><td>"+title+"</td><td>"+created_on+"</td><td class='data_class' data='"+description+"' data1='"+title+"' data2='"+uuid+"'><img class='view_img' src='images/eye.svg' onclick='viewlegal()' data-toggle='modal' data-target='#Modal'/>\n\
                                                                                           <img class='edit_img' src='images/edit.svg' data-toggle='modal' data-target='#EditModalLegal' />\n\
                                                                                           </td></tr>";
          
            //$("#legal_data").append(txt);
            //$('.card').html(txt);
            } 
            $('#legal_data tr:not(:first)').remove();
            $('#legal_data tr:last').after(txt);
        },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
        }
      
    </script>
    
     <script>
       
//       this is the viewlegal script
        $(document).ready(function() {
            $("#legal_data").on("click", ".data_class", function(e){
                description = $(this).attr("data");
                title = $(this).attr("data1");
                $("#viewpopup").val(description);
                $("#viewpopupquestion").val(title);
                
            });
        });
        
   </script>
   
    <script>
//       this is the editlegal script
        $(document).ready(function() {
            $("#legal_data").on("click", ".data_class", function(e){
                 title = $(this).attr("data1");
                 description = $(this).attr("data");
                 uuid = $(this).attr("data2");
                 $("#description").val(description);
                 $("#uuid").val(uuid);
                 $("#title").val(title);
                 
//                 alert(uuid);
                
            });
        });
        
   </script>
   
    <script>
        
       
    function textValuelegal()
    {
                  var description= document.getElementById("description").value;
                  var uuid= document.getElementById("uuid").value;
                  var title = document.getElementById("title").value;
//                 alert(uuid); 
//                 alert (title);
//                 alert(description);
                  $.ajax({
                  type: "POST",
                  url: "editlegal.htm",
                  data: { uuid: uuid, Title : title, Description : description} ,
                success: function (data) {  
                    showLegal();
                     },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
    }
    </script>

     <script>
        function showUsers()
        {    
            $.ajax({
                type: "GET",
                url: "getAllUsers.htm",
                  
                success: function (data) {  
                    
            var txt='';
            var jsonData = JSON.parse(data);
            for (var i = 0; i < jsonData.users.length; i++) 
            {
            var mid = jsonData.users[i].MID;
            
           // $('.card').html(question);
            var contact_no = jsonData.users[i].Contact_no;
            //$('.card').html(created_date);
            var id = jsonData.users[i].id;
            var username = jsonData.users[i].Username;
            var registerd_on = jsonData.users[i].Registerd_on;
            var last_login = jsonData.users[i].Last_login;
           
             
            txt += "<tr><td>"+(i+1)+"</td><td>"+mid+"</td><td>"+contact_no+"</td><td>"+username+"</td><td>"+registerd_on+"</td><td>"+last_login+"</td>\n\
                                                                                           <td><a href='users.htm?id="+id+"'><img class='view_img' src='images/eye.svg'/></a>\n\
                                                                                           <img class='edit_img' src='images/edit.svg'/>\n\
                                                                                         </td></tr>";
          
            $("#users_data").append(txt);
            //$('.card').html(txt);
            } 
            $('#users_data tr:not(:first)').remove();
            $('#users_data tr:last').after(txt);
        },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
        }
      
    </script>
    
    <script>
        function showTestimonial()
        {    
//            var div = document.getElementById('faqs_data');
//            while(div.firstChild){
//                    div.removeChild(div.firstChild);
//            }
            $.ajax({
                type: "GET",
                url: "getAllTestimonial.htm",
                
                success: function (data) {  
                    
            var txt='';
            var jsonData = JSON.parse(data);
            for (var i = 0; i < jsonData.testimonial.length; i++) 
            {
            var name = jsonData.testimonial[i].name;
            var designation = jsonData.testimonial[i].designation;
           // $('.card').html(question);
            var location = jsonData.testimonial[i].location;
            //$('.card').html(created_date);
            var testimonial = jsonData.testimonial[i].testimonial;
            var live = jsonData.testimonial[i].live;
            var uuid = jsonData.testimonial[i].uuid;
           
            txt += "<tr><td>"+(i+1)+"</td><td>"+name+"</td><td>"+designation+"</td><td>"+location+"</td><td>"+live+"</td><td class='data_class' data0='"+uuid+"' data='"+name+"' data1='"+designation+"' da_location='"+location+"' data3='"+testimonial+"' data4='"+live+"'>\n\
                                                                                           <img class='view_img' src='images/eye.svg' data-toggle='modal' data-target='#ModalTestimonial' />\n\
                                                                                           <img class='edit_img' src='images/edit.svg' data-toggle='modal' data-target='#EditModalTestimonial'/>\n\
                                                                                           <img class='delete_img' src='images/delete.svg' uuid='"+uuid+"'/></td>\n\
                                                                                                      </tr>";
          
            //$("#faqs_data").append(txt);
           
            //$('.card').html(txt);
            } 
            $('#testimonial_data tr:not(:first)').remove();
            $('#testimonial_data tr:last').after(txt);
            
        },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
        }
    </script>
    
    <script>    
    function textValueTestimonial()
    {
        
                  var name= document.getElementById("1").value;
                  var designation= document.getElementById("2").value;
                  var location = document.getElementById("3").value;
                  var testimonial = document.getElementById("4").value;
                  var live = document.getElementById("5").value;
                  var uuid = document.getElementById("uuid").value;
                    
                  $.ajax({
                  type: "POST",
                  url: "edittestimonial.htm",
                  data: { uuid: uuid,name: name, designation: designation, location: location, testimonial: testimonial, live: live } ,
                success: function (data) {  
                    showTestimonial();
                     },       
       error: function (e) {

                    alert('Error: ' + e);
                }
            });
    }
    </script>
    
    <script>
        function savetestimonial(){
           
            var name= document.getElementById("test1").value;
            var designation= document.getElementById("test2").value; 
            var location= document.getElementById("test3").value;
            var testimonial= document.getElementById("test4").value;
          

            var live= document.getElementById("test5").value;
            var live1= document.getElementById("test6").value;
            if(live=="Active")
            {
               
               var value='Active';
             
            }
            
            else if(live1=="InActive")
            {
             var  value='InActive';
            
            }
            
           
//            alert(answer);
             $.ajax({
                  type: "POST",
                  url: "testimonial.htm",
                  data: { name: name, designation: designation, location: location, testimonial: testimonial, live: value} ,
                success: function (data) { 
                    
                  var name= document.getElementById("test1").value="";
                  var designation= document.getElementById("test2").value=""; 
                  var location= document.getElementById("test3").value="";
                  var testimonial= document.getElementById("test4").value="";
                  var live= document.getElementById("test5").value;
                  var live1= document.getElementById("test6").value;
                  if(live=='Active')
                  {
                       
                       var live= document.getElementById("test5").value="";
                  }
                  else if(live1=="InActive")
                  {
                       var live1= document.getElementById("test6").value="";
                  }
                    
//                    var x = document.getElementById("squarespaceModal");
//                    x.close(); 
                    showTestimonial();
                     },       
                error: function (e) {

                    alert('Error: ' + e);
                }
            });
            
        }
        
        
        function clearAllField()
        {
                  var name= document.getElementById("test1").value="";
                  var designation= document.getElementById("test2").value=""; 
                  var location= document.getElementById("test3").value="";
                  var testimonial= document.getElementById("test4").value="";
                  var live= document.getElementById("test5").value="";
                    
        }
        
        
    </script>
    
     <script>
    function removetestimonial(uuid)
    {
        
        var x = confirm("Are you sure you want to delete?");
       
         if (x)
         {
                  $.ajax({
                  type: "GET",
                  url: "removetestimonial.htm",
                  data: { uuid: uuid} ,
                success: function (data) {  
                    showTestimonial();
                     },       
                error: function (e) {

                    alert('Error: ' + e);
                }
            });
             
        return true;
         }
        else
        {
         return false;
        }
    }
    </script>
    
    
    <script>
       
//       this is the viewtestimonial script
        $(document).ready(function() {
           
            $("#testimonial_data").on("click", ".data_class", function(e){
                 
                name = $(this).attr("data");
                designation = $(this).attr("data1");
                da_location = $(this).attr("da_location");
                testimonial = $(this).attr("data3");
                live = $(this).attr("data4");
                uuid = $(this).attr("data0");
                 
          
                 
                $("#nametest").val(name);
                $("#desitest").val(designation);
                $("#loctest").val(da_location);
                $("#test").val(testimonial);
                $("#livetest").val(live);
                $("#uuid").val(uuid);
            });    
//            this is the deletetestimonial script
            $("#testimonial_data").on("click", ".delete_img", function(e){
                uuid = $(this).attr("uuid");
                removetestimonial(uuid);
            });
       });
        
   </script>
    
   
   <script>
//       this is the edittestimonial script
        $(document).ready(function() {
            $("#testimonial_data").on("click", ".data_class", function(e){
                 name = $(this).attr("data");
                 designation = $(this).attr("data1");
                 location_test = $(this).attr("da_location");
                 testimonial = $(this).attr("data3");
                 live = $(this).attr("data4");
                 uuid = $(this).attr("data0");
                 
                
                 
                 $("#1").val(name);
                 $("#2").val(designation);
                 $("#3").val(location_test);
                 $("#4").val(testimonial);
                 $("#5").val(live);
                 $("#uuid").val(uuid);
           });
        });
        
   </script>
   
    
  
    <body>
<!--  <div class="wrapper">
      <div class="sidebar" > -->
           <div class="leftmenu">
            <div class="logo">
                <a href="dashboard.jsp" class="simple-text">
                   <img src="images/logo.png">
                </a>
            </div>
            <div class="menu_left">
                <ul class="nav">
                    <div class="faq_dashboard" onclick="showFAQ();">
                        <a>
                            <img src="images/faq.svg" class="faq_img">
                            <span class="faq_text">FAQ</span>
                            <span class="box_side1"></span> 
                         </a>
                    </div>
                    <!-- <li>
                        <a >
                            <img src="../img/privacy_policy.svg" class="privacy_policy_img">
                            <span>PRIVACY POLICY</span>
                        </a>
                    </li> -->
                    <div class="legal_dashboard" onclick="showLegal();">
                        <a>
                            <img src="images/legal.svg" class="legal_img">
                            <span>LEGAL</span>
                            <span class="box_side2"></span>
                        </a>
                    </div>
                    <div class="users_dashboard" onclick="showUsers();">
                       <a>
                            <img src="images/user1.svg" class="query_img">
                            <span>USERS</span>
                            <span class="box_side3"></span>
                        </a>
                    </div>
                    <!-- <li>
                        <a >
                            <img src="../img/support_ticket.svg" class="support_img">
                            <span>SUPPORT TICKET</span>
                        </a>
                    </li> -->
                    <div class="testimonial_dashboard" onclick="showTestimonial();">
                        <a>
                            <img src="images/testimonial.svg" class="testimonial_img">
                            <span>TESTIMONIAL</span>
                            <span class="box_side4"></span>
                        </a>
                    </div>
                    
                </ul>
            </div> 
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                        <div class="row">
                             <div class="top_menu">
                            <div class="col-sm-2"></div>
                            <form>
                            <div class="col-sm-1 search_img_top">
                            <img src="images/search.svg" class="search_img" height="35px">
                            </div>
                            <div class="col-sm-3">
                            <div class="form-group  is-empty">
                            <input type="text" id="example" class="form-control1" placeholder="SEARCH">
                            <span class="material-input"></span>
                            </div>
                            
                            </div>
                        </form>
                            <div class="col-sm-2"></div>
                            
                            <div class="col-sm-3 user_name_text" style="margin: 0px 20px -5px -20px">
                              <p class="user_text">Welcome ${username}</p>
                          
                           
                             <img src="images/user.svg" class="login_img_right">
                            
                           
                             </div> 
                              <div class="col-sm-1 login_img">
                                <a href="logout.htm" />
                               <img src="images/login.svg" class="user_img_right"></a>
                            </div>
                    </div>
                </div>
                </div>
            </nav>
           
    </div>                         

                                 <!-- faqpage starts here -->

                                  <div class="row">
                                    <div class="col-sm-8"></div>
                                    <div class="col-sm-4">
                                      <div class="Faq-add-lable">
                                       <a href="#squarespaceModal" class="btn btn-md add_color"  data-toggle="modal">+ADD NEW</a>
                                      </div>
                                     <input type="text" id="myInput"  placeholder="Search for names..">
                                </div>
                                     </div>
                                      
                                     </div> 

                                     <div class="faq_page">
                             <div class="row">
                                  <div class="col-sm-4"></div>
                                 <div class="col-sm-8">
                                 <div class="card">
                                <div class="card-header">
                                <div class="card-content table-responsive">
                                    <table class="table table-hover" id="faqs_data">
                                        <thead class="text-warning">
                                            <th>ID</th>
                                            <th>Question</th>
                                            <th>Create-on</th>
<!--                                            <th>Update</th>-->
                                            <th class="text-center">Action</th>

                                        </thead>
                                        <tbody>
<!--                                            <tr>
                                                <td>1</td>
                                                <td>Is there more than one condition (disease) that could be causing my problem?</td>
                                                <td>5/2/2016</td>
                                                <td>12/3/2017</td>
                                                <td class="text-center"> 
                                                  <img class="view_img" src="images/eye.svg">
                                                  <img class="edit_img" src="images/edit.svg">
                                                  <img class="delete_img" src="images/delete.svg">
                                                </td>
                                            </tr>-->
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    </div>       
                         



                          <div class="row navigation_text"> 
                        <div class="col-sm-9"></div>
                            <div class="col-sm-3 ">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                       <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                    </nav>
                </div>
            </div>
                     <!-- faq page ends here    -->
<!--view_popup-->
<div class="modal fade" id="Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="nitesh">VIEW</h4>
        </div>
          <div class="modal-body">
               <p class="question_text">QUESTION</p>
           <textarea  rows="2" cols="10"  style="background-color:#ebecee;" name="question"  class="form-control" id="viewpopupquestion" ></textarea>
        </div>
        <div class="modal-body">
             <p class="answer_text">ANSWER</p>
           <textarea  rows="6" cols="50"  style="background-color:#ebecee;" name="answer"  class="form-control" id="viewpopup" ></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="submit_text">Close</button>
          
        </div>
      </div>
      
      <input type="hidden" name="datavalue" id="abc">
      
    </div>
  </div>
<!--popupends-->

<!--view_popup for testimonials-->
<div class="modal fade" id="ModalTestimonial" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="nitesh">VIEW</h4>
        </div>
          <div class="modal-body">
               <p>NAME</p>
           <textarea  rows="1" cols="10"  style="background-color:#ebecee;" name="name"  class="form-control" id="nametest" ></textarea>
        </div>
        <div class="modal-body">
             <p>DESIGNATION</p>
           <textarea  rows="1" cols="10"  style="background-color:#ebecee;" name="designation"  class="form-control" id="desitest" ></textarea>
        </div>
          <div class="modal-body">
               <p>LOCATION</p>
           <textarea  rows="1" cols="10"  style="background-color:#ebecee;" name="location"  class="form-control" id="loctest" ></textarea>
        </div>
          <div class="modal-body">
               <p>TESTIMONIAL</p>
           <textarea  rows="2" cols="10"  style="background-color:#ebecee;" name="testimonial"  class="form-control" id="test" ></textarea>
        </div>
           <div class="modal-body">
                <p>LIVE</p>
           <textarea  rows="1" cols="10"  style="background-color:#ebecee;" name="live"  class="form-control" id="livetest" ></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="submit_text">Close</button>
          
        </div>
      </div>
     
    </div>
  </div>
<!--popupends-->


<!--edit_popup faq-->
<div class="modal fade" id="EditModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="nitesh">EDIT</h4>
        </div>
          <div class="modal-body">
               <p class="question_text">QUESTION</p>
           <textarea  rows="2" cols="10"  style="background-color:#ebecee;" name="question"  class="form-control" id="editpopupquestion" ></textarea>
           <input type="hidden" name="uuid"  id="popupuuid">
        </div>
        
        <div class="modal-body">
             <p class="answer_text">ANSWER</p>
        <textarea rows="8" cols="70" class="form-control" id="editpopup" style="background-color:#ebecee;"  name="answer"/></textarea>
        <input type="hidden" name="uuid"  id="popupuuid">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-warning" id="button2" onclick="textValue()"  data-dismiss="modal">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id="submit_text">Close</button>
<!--           <button type="submit"  class="btn  text-right" id="submit_text">Submit</button>-->
        </div> 
      </div>  
    </div>
  </div>
<!--popupends-->

<!--edit_popup testimonial-->
<div class="modal fade" id="EditModalTestimonial" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="nitesh">EDIT</h4>
        </div>
          <div class="modal-body">
              <p>NAME</p>
           <textarea  rows="1" cols="10"  style="background-color:#ebecee;" name="name"  class="form-control" id="1" ></textarea>
           <input type="hidden" name="uuid"  id="uuid">
        </div>
        
        <div class="modal-body">
            <p>DESIGNATION</p>
        <textarea rows="1" cols="10" class="form-control" id="2" style="background-color:#ebecee;"  name="destination"/></textarea>
        <input type="hidden" name="uuid"  id="uuid">
        </div>
           <div class="modal-body">
               <p>LOCATION</p>
        <textarea rows="1" cols="10" class="form-control" id="3" style="background-color:#ebecee;"  name="location"/></textarea>
        <input type="hidden" name="uuid"  id="uuid">
        </div>
           <div class="modal-body">
               <p>TESTIMONIAL</p>
        <textarea rows="1" cols="10" class="form-control" id="4" style="background-color:#ebecee;"  name="testimonial"/></textarea>
        <input type="hidden" name="uuid"  id="uuid">
        </div>
           <div class="modal-body">
               <p>LIVE</p>
        <textarea rows="1" cols="70" class="form-control" id="5" style="background-color:#ebecee;"  name="live"/></textarea>
        <input type="hidden" name="uuid"  id="uuid">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-warning" id="button2" onclick="textValueTestimonial();"  data-dismiss="modal">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id="submit_text">Close</button>
<!--           <button type="submit"  class="btn  text-right" id="submit_text">Submit</button>-->
        </div> 
      </div>  
    </div>
  </div>
<!--popupends-->


<!--edit_popup legal-->
<div class="modal fade" id="EditModalLegal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="nitesh">EDIT</h4>
        </div>
          <div class="modal-body">
              <p>TITLE</p>
           <textarea  rows="2" cols="10"  style="background-color:#ebecee;" name="Title"  class="form-control" id="title" ></textarea>
           <input type="hidden" name="uuid"  id="uuid">
        </div>
        
        <div class="modal-body">
            <p>DESCRIPTION</p>
        <textarea rows="8" cols="70" class="form-control" id="description" style="background-color:#ebecee;"  name="Description"/></textarea>
        <input type="hidden" name="uuid"  id="uuid">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-warning" id="button2" onclick="textValuelegal()"  data-dismiss="modal">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id="submit_text">Close</button>
<!--           <button type="submit"  class="btn  text-right" id="submit_text">Submit</button>-->
        </div>
        
      </div>
      
    </div>
  </div>
<!--popupends-->
           
<!--view_popup user-->
<div class="modal fade" id="ViewModalUSERS" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="nitesh">VIEW</h4>
        </div>
        <div class="user_testimonial_image">
        <img src="images/user_image.png" class="testimonial_image" > 
        </div>
         
        <div class="modal-body">
        <p>NAME</p>
        <textarea  rows="1" cols="10"  style="background-color:#ebecee;" name="Name"  class="form-control" id="user_name" ></textarea>
        <input type="hidden" name="uuid"  id="uuid">
        </div>
        <div class="modal-body">
        <p>CONTACT NO</p>
        <textarea rows="1" cols="10" class="form-control" id="user_no" style="background-color:#ebecee;"  name="Contact_no"/></textarea>
        </div>
        <div class="modal-body">
        <p>MID</p>
        <textarea rows="1" cols="10" class="form-control" id="user_mid" style="background-color:#ebecee;"  name="MID"/></textarea>
        </div>
        <div class="modal-body">
        <p>MEMBER_ID</p>
        <textarea rows="1" cols="10" class="form-control" id="user_mid" style="background-color:#ebecee;"  name="MID"/></textarea>
        </div>
        <div class="modal-body">
        <p>RECORDS</p>
        <textarea rows="1" cols="10" class="form-control" id="user_mid" style="background-color:#ebecee;"  name="MID"/></textarea>
        </div>
        <div class="modal-body">
        <p>GENERAL REMAINDERS</p>
        <textarea rows="1" cols="10" class="form-control" id="user_mid" style="background-color:#ebecee;"  name="MID"/></textarea>
        </div>
        <div class="modal-body">
        <p>MEDICINE REMAINDERS</p>
        <textarea rows="1" cols="10" class="form-control" id="user_mid" style="background-color:#ebecee;"  name="MID"/></textarea>
        </div>
        <div class="modal-footer">
            
          <button type="button" class="btn btn-default" data-dismiss="modal" id="submit_text">Close</button>
<!--           <button type="submit"  class="btn  text-right" id="submit_text">Submit</button>-->
        </div>
        
      </div>
      
    </div>
  </div>
<!--popupends-->
           
                     <!-- addnew page for faq starts here -->

            <div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                  <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal" onclick="clearField();"><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">CREATE</h3>
              </div>
              <div class="modal-body" >
              
              <div class="form-group">
                <p class="question_text">QUESTION</p>
                <input type="text" class="form-control " required="false" name="question" style="background-color:#ebecee; " id="exampleInputEmail1" placeholder="Enter question">
                
                <h2 id="validq" style="color: red;font: bold;"></h2>
                
              </div>
              <div class="form-group">
                <p class="answer_text">ANSWER</p>
                <textarea  rows="8" cols="70"  style="background-color:#ebecee;" required="false" name="answer"  class="form-control" id="exampleInputPassword1" placeholder="ENTER ANSWER..."></textarea>
                <p id="valida"></p>
              </div>
                  <button type="submit" class="btn  text-right" id="submit_text" onclick="savefaq();" data-dismiss="modal">Submit</button>
             
          </div>
            
          </div>
        </div>
      </div>
 <!-- addnew page for faq ends here -->

                      <!-- legal page starts -->
                              
                              <div class="legal_page_content">
                             <div class="row">
                                 
                                 <div class="col-sm-4">
                                     
                                 </div>
                                 <div class="col-sm-8">
                                     
                                      <div class="card1">
                                         
                                <div class="card-header">
                                   <input type="text" id="myInput1"  placeholder="Search for names..">
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover" id="legal_data">
                                        <thead class="text-warning">
                                            <th>S.No</th>
                                            <th>Title</th>
                                            <th>Create-on</th>
<!--                                            <th>Update</th>-->
                                            <th class="text-center">Action</th>

                                        </thead>
                                        <tbody>
<!--                                            <tr>
                                                <td>1</td>
                                                <td>Terms of services</td>
                                                <td>5/2/2016</td>
                                                <td>12/3/2017</td>
                                                <td class="text-center"> 
                                                 <img href="#"  onclick="$('#squareModal').modal({'backdrop': 'static'});" class="view_img1" src="images/eye.svg">
                                                <img class="edit_img1" src="images/edit.svg">
                                                  
                                                </td>
                                            </tr>-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>

                          <!-- legalpage ends -->

                         <!--  users page starts -->
                           <div class="users_page">
                             <div class="row">
                                  <div class="col-sm-4"></div>
                                 <div class="col-sm-8">
                                 <div class="card2">
                                <div class="card-header">
                                <div class="card-content table-responsive">
                                    <table class="table table-hover" id="users_data">
                                        <thead class="text-warning">
                                            <th>ID</th>
                                            <th>MID</th>
                                            <th>Contact No</th>
                                            <th>User Name</th>
                                             <th>Registered On</th>
                                             <th>Last Login</th>
                                             <th style="text-align: center;">Actions</th>
                                        </thead>
                                        <tbody>
<!--                                            <tr>
                                                <td>1</td>
                                                <td>AB12</td>
                                                <td>9999888877</td>
                                                <td>SE</td>
                                                <td>05/03/18</td>
                                                <td>05/03/18 &nbsp  12:00</td>
                                                <td class="text-center"> 
                                                  <img class="view_img" src="images/eye.svg">
                                                  <img class="edit_img" src="images/edit.svg">
                                                  </td>
                                            </tr>-->
                                       
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    </div>       
                          <!-- users page  ends here -->
 
                          
<!--                          users page start here-->
                           <div class="users_page">
                             <div class="row">
                                  <div class="col-sm-4"></div>
                                 <div class="col-sm-8">
                                 <div class="card2">
                                <div class="card-header">
                                <div class="card-content table-responsive">
                                    <table class="table table-hover" id="users1_data">
                                        <thead class="text-warning">
                                            
                                            <th>MID</th>
                                            <th>Contact No</th>
                                            <th>User Name</th>
                                            
                                             
                                        </thead>
                                        <tbody>
                                            <tr>
                                                
                                                <td>${name}</td>
                                                <td>${mid}</td>
                                                <td>${contact_no}</td>
                                               
                                               
                                            </tr>
                                       
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    </div>    
<!--                              user page ends-->

                    <!-- addnew page for legal starts here -->

            <div class="modal fade" id="squareModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <img src="images/cancel.svg" style="margin-top: 5px;" type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">VIEW</h3>
              </div>
              <div class="modal-body">
              <form>
              <!-- <div class="form-group">
                <p class="question_text">QUESTION</p>
                <input type="text" class="form-control " style="background-color:#ebecee; " id="exampleInputEmail1" placeholder="Enter question">
              </div>
           -->    <div class="form-group">
                  <span class="title_model1">TERMS OF SERVICES</span>
                <p class="answer_text"></p>
                <textarea  rows="13" cols="70"  style="background-color:#ebecee;"  class="form-control" id="exampleInputPassword1">hahahahahahahahahahahahahahahah </textarea>
              </div>
              <button class="btn text-right" data-dismiss="modal" id="submit_text1" aria-hidden="true">Close</button>
              <!-- <button  class="btn  text-right" >close</button> -->
             </form>
          </div>
            
          </div>
        </div>
      </div>
 <!-- addnew page for legal page ends here -->


  
    <!-- testimonial page starts here -->
                                   
                                      
                                      <div class="row">
                                    <div class="col-sm-4"></div>
                                    <div class="col-sm-8">
                                      <div class="testimonial_division">
                                        <div class="row">
                                        <div class="col-sm-4">
                                          <div class="user_testimonial_image">
                                          <img src="images/user_image.png" class="testimonial_image" > 
                                        </div>
                                        <div class="add_image_text">
                                         <p class="add_text_image">+ADD IMAGE</p>
                                        </div>
                                        </div>
                                        <div class="col-sm-2">
                                         <p class="name_text">NAME</p>
                                         <p class="designation_text">DESIGNATION</p>
                                         <p class="location_text">LOCATION</p>
                                         <p class="testimonial_text">TESTIMONIAL</p>
                                         <p class="live_text">LIVE</p>
                                        </div>
                                        <div class="col-sm-6">
                                          <form class="form-horizontal">
                                            <div calss="name_input" >
                                              <input type="text" class="form-control2" placeholder="Name" name="name" id="test1">
                                            </div>
                                           <div calss="designation_input" >
                                              <input type="text" class="form-control3" placeholder="Designation" name="designation" id="test2">
                                            </div>
                                            <div calss="location_input" >
                                              <input type="text" class="form-control4"  name="location" id="test3">
                                            </div>
                                            <div calss="testimonial_input" >
                                            <textarea class="form-control5" name="testimonial" id="test4"></textarea>
                                            </div>
                                            <div class="radio_button">
                                             <label class="yes_text">YES</label><span><input type="radio" name="radio1" value="Active" id="test5">
                                             <label class="no_text">NO</label><span><input type="radio" name="radio1" value="InActive" id="test6">
                                             </span>
                                            </div> 
                                            <div class="form_cancel_submit">
                                                <button type="button" class="btn add_color cancle_btn" onclick="clearAllField();">CANCEL</button>
                                             <button type="button" class="btn add_color submit_btn" onclick="savetestimonial();">SUBMIT</button>
                                            </div>
                                          </form>    
                                         </div>
                                         </div>
                                        </div>
                                      </div>
                                    </div> 

                                    
                                                                   

    <!-- testimonial page ends here -->



<!--                       testimonial data starts here   -->
                                       
                                  <div class="row">
                                    <div class="col-sm-8"></div>
                                    <div class="col-sm-4">
                                      <div class="testimonial-add-lable">
                                       <a href="" class="btn btn-md add_color"  data-toggle="modal">+ADD NEW</a>
                                      </div>
                                     </div>
                                     </div>  
                                
                                      <div class="testimonial_data">
                                  <div class="row">
                                  <div class="col-sm-4"></div>
                                 <div class="col-sm-8">
                                 <div class="card4">
                                <div class="card-header">
                                <div class="card-content table-responsive">
                                    <table class="table table-hover" id="testimonial_data">
                                        <thead class="text-warning">
                                            <th>S.NO</th>
                                            <th>Name</th>
                                            <th>Designation</th>
                                            <th>Location</th>
                                            <th class="text-center">Live</th>
                                            <th >Action</th>


                                        </thead>
                                        <tbody>
<!--                                            <tr>
                                                <td>1</td>
                                                <td>Ravikumar</td>
                                                <td>Doctor</td>
                                                <td>Hyderabad</td>
                                                <td class="text-center">No</td>
                                                <td>2/02/18</td>
                                                <td > 
                                                 <img class="view_img" src="../img/eye.svg">
                                                <img class="edit_img1" src="../img/edit.svg">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Rk</td>
                                                <td>kidney</td>
                                                <td>Hyderabad</td>
                                                <td class="text-center">Yes</td>
                                                <td>28/12/18</td>
                                                <td > 
                                                 <img class="view_img" src="../img/eye.svg">
                                                <img class="edit_img1" src="../img/edit.svg">
                                                </td>
                                            </tr>
                                            <tr>-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    </div>       
                         



                          <div class="row navigation_text"> 
                        <div class="col-sm-9"></div>
                            <div class="col-sm-3 ">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                       <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                    </nav>
                </div>
            </div>
                     <!-- testimonial data page ends here    -->
                     
                     
                     
                      <div class="userview_card">
                                    <div class="row">
                                    <div class="col-sm-4"></div>
                                    <div class="col-sm-8">
                                      <div class="user_view_division">
                                        <div class="row">
                                        <div class="col-sm-4">
                                          <div class="user_view_image">
                                          <img src="images/user_image.png" class="user_view_image1" style="height:150px;" > 
                                        </div>
                                        </div>
                                        <div class="col-sm-8 ">
                                            <h4 class="view_name">NAME :<span>${name}</span></h4>
                                           <h4 class="view_email">EMAIL : </h4>
                                           <h4 class="view_contact_no">CONTACT NO : <span>${contact_no}</span></h4>

                                         </div>
                                         </div>
                                         <div class="row">
                                         <div class="col-sm-6 left_divi">
                                             <h4 class="m_id">MID :<span> ${mid}<span></h4>
                                         <h4 class="member_id">MEMBER_ID</h4>
                                         </div>
                                         <div class="col-sm-6 right_divi">
                                         <h4 class="records">RECORDS :</h4>
                                         <h4 class="g_reminder">G REMINDER :</h4>
                                         <h4 class="mem-reminder">M REMINDER :</h4>
                                         </div>
                                         </div>


                                        </div>
                                      </div>
                                    </div>

                                   </div>

</div>
                                   

<script src="godoctor/bootstrap.min.js" type="text/javascript"></script>
<script src="godoctor/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="godoctor/demo1.js"></script>
<script src="godoctor/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="godoctor/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="godoctor/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="godoctor/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<!-- Material Dashboard javascript methods -->
<script src="godoctor/material-dashboard.js?v=1.2.0"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->

</body>


</html>