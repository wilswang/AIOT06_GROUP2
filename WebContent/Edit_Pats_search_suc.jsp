<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Edit Members</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="Wide selection of forms controls, using the Bootstrap 4 code base, but built with React.">
    <meta name="msapplication-tap-highlight" content="no">    
    <link href="./main.css" rel="stylesheet">
    <link href="./Edit_upload.css" rel="stylesheet">
    
    <link rel="Shortcut Icon" type="image/x-icon" href="./favicon.ico" />
    
</head>
<body onbeforeunload="window.location='./logout.jsp'">
    <div id="pagetop"style="visibility:hidden"></div>
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <%@ include file="backtotop.jsp"%> 
		<%@ include file="header.jsp"%> 
		<div class="app-main">
			<%@ include file="sidebar.jsp"%>
			<div class="app-main__outer">
                    <div class="app-main__inner">
                        <div class="app-page-title">
                            <div class="page-title-wrapper">
                                <div class="page-title-heading">
                                    <div class="page-title-icon">
                                        <i class="pe-7s-magic-wand icon-gradient bg-plum-plate">
                                        </i>
                                    </div>
                                    <div>Edit members
                                        <div class="page-title-subheading">You can add, search or modify Patients' Info
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>            
                        <ul class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
                            <li class="nav-item">
                                <a role="tab" class="nav-link " id="tab-0" data-toggle="tab" href="#tab-content-0">
                                    <span>Add</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a role="tab" class="nav-link active" id="tab-1" data-toggle="tab" href="#tab-content-1">
                                    <span>Search/Modify</span>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                 	        <div class="tab-pane tabs-animation fade " id="tab-content-0" role="tabpanel">
                                <%@ include file="Add_Pats.jsp"%> 
                            </div>
                            <div class="tab-pane tabs-animation fade show active" id="tab-content-1" role="tabpanel">
                                
                                
                                
                                <div class="row">
	<div class="col-md-12">                                        
	    <div class="main-card mb-3 card add_container1" style="margin-top:15px;">
	        <!-- 查詢成員程式碼 -->
	        <form class="form_pattern" action="/FinalProject/EditPatient" method="post" style="margin-top:15px;">  
	                                                     
	        <jsp:useBean id="pat" scope="request" class="com.patientinfo.HealthcareBean" />
			<% String patno=pat.getPatno(), pname=pat.getpName(), bd=pat.getBirthday(), ge=pat.getGender(), mp=pat.getM_phone(), 
			ep=pat.getE_contact_person(), en=pat.getE_contact_no(),er=pat.getE_contact_relation() ,flag=pat.getFlag(), mvalue="", fvalue="";
			if(ge.equals("Male")){
				mvalue="selected";}
			if(ge.equals("Female")){
				fvalue="selected";}
			%>	
	            <div class="container">
	              <h2 style="text-align:center"><%=flag%> successfully</h2>
	              <label for="patno"><b>Patient No.</b></label>
	              <input type="text"  name="patno" value=<%=patno%> readonly><br>
	              
	              <label for="pname"><b>Name</b></label>
	              <input type="text"  name="pname" value=<%=pname%> required="required" autocomplete="off"><br>
	                
	              <label for="birthday"><b>Birthday</b></label>                                                                                                   
	              <input class="datepicker" type="text" name="birthday" value=<%=bd%>  required="required" autocomplete="off"/>
	
	              <label for="gender"><b>Gender</b></label><br>
	              <select name="gender" class="gender">
	                <option  disabled="disabled"  style='display: none' value=''></option> 
	                <option value="Male" <%=mvalue%>>Male</option>
	                <option value="Female" <%=fvalue%>>Female</option>
	              </select><br>
	              
	
	              <label for="M_phone"><b>Mobile phone No</b></label>
	              <input type="text" placeholder="Enter Mobile Phone No." name="M_phone" required="required" autocomplete="off" value=<%=mp%>><br>
	            
	              <label for="E_contact"><b>Emergency Contact Person</b></label>
	              <input type="text" placeholder="Enter Contact Person" name="E_contact" required="required" autocomplete="off" value=<%=ep%>><br>
	
	              <label for="E_phone_no"><b>Emergency Contact phone no.</b></label>
	              <input type="text" placeholder="Enter phone no." name="E_phone_no" required="required" autocomplete="off" value=<%=en%>><br>
	
	              <label for="E_relationship"><b>Emergency Contact relationship</b></label>
	              <input type="text" placeholder="Enter relation" name="E_relationship" required="required" autocomplete="off" value=<%=er%>><br>
	
	              <button class="form_button" type="submit">Edit</button>
	              <button type="reset" class="cancelbtn" onclick="location.href='./Edit_Pats.jsp'">Cancel</button>                                                  
	        
	            </div>                                            
	            <div class="add_container" style="background-color:#f1f1f1"></div>
	              </form>                                          
	        </div>                                        
	    </div>
	</div>
                                
                                
                            </div>
                        </div>
                    </div>
                 </div>
        </div>
    </div>
    
  
<script type="text/javascript" src="./assets/scripts/main.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>

    $(function() {
    	$("ul.vertical-nav-menu li:nth-child(8)> a").addClass("mm-active");
    	//19-jQuery datepicker Methods getDate setDate
        $(".datepicker").datepicker({
          //設定日期格式
          dateFormat : "yy-mm-dd"  	      
        });
        
         $(".datepicker").datepicker({width:"180px"});
        
        $(".opt").click(function(){
            var $theClass= $(this).attr("class").substr(4);
            var tempClass='.'+$theClass+"_t";  	    	
            //$(this).css("display","");
            $(tempClass).css("display","")
            .siblings().css("display","none");  	    	
        })
      });
</script>
</body>
</html>