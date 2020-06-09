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
                                        
                                        <div class="main-card mb-3 card add_container1">
                                            <!-- 查詢成員程式碼 -->
                                            <form action="/FinalProject/Search_one" method="post" style="margin-top:15px;">                                               
                                            
                                                <div class="container">
                                                  <label for="patno"><b>Patient No.</b></label>
                                                  <input type="text" placeholder="Enter patient No." name="patno" required="required" autocomplete="off"><br>
                                                  <button type="submit">Submit</button>
                                                  <button type="reset" class="cancelbtn">Clear</button></div>
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
    <jsp:useBean id="pat" scope="request" class="com.patientinfo.HealthcareBean" />
	<% String patno=pat.getPatno();
		if(patno!= null){%>
	  	<script type="text/javascript">alert("Patient no. <%=patno%> is not existed");</script>
	 <% }%>
  
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