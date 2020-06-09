<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="web_head.jsp">
	<jsp:param name="subTitle" value="Edit Members"/>
</jsp:include>
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
                        <jsp:useBean id="pat" scope="request" class="com.patientinfo.HealthcareBean" />
						<% String add="", search="", a_show="", e_show="", patno=pat.getPatno(); 
						if(pat.getFlag()!=null){
							if(pat.getFlag().equals("add")){ //由flag判斷目前狀態，如果為add，表示add分頁為顯示狀態(show)
								add="active";
								a_show="show";
								//如果為edit或Search，表示Search分頁為顯示狀態(show)
							}else if(pat.getFlag().equals("edit") || pat.getFlag().equals("Search") || pat.getFlag().equals("Search_fail")){
								search="active";
								e_show="show";
								//如果為Search_Fail，表示Search分頁為顯示狀態(show)
								if(pat.getFlag().equals("Search_fail") && patno!= null){%>
							  	<script type="text/javascript">alert("Patient no. <%=patno%> is not existed");</script>
							<%}}
							else{
								add=""; search=""; a_show=""; e_show="";
							}
						}else{  //如果flag為null，表示add分頁為顯示狀態(show)
							add="active";
							a_show="show";
						}
						
						%>	            
                        <ul class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
                            <li class="nav-item">
                                <a role="tab" class="nav-link <%=add%>" id="tab-0" data-toggle="tab" href="#tab-content-0">
                                    <span>Add</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a role="tab" class="nav-link <%=search%>" id="tab-1" data-toggle="tab" href="#tab-content-1">
                                    <span>Search/Modify</span>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                           <div class="tab-pane tabs-animation fade <%=a_show%> <%=add%>" id="tab-content-0" role="tabpanel">
                               <!-- 如果flag為add，代表新增成功，載入add_suc的頁面 -->
                               <% if(pat.getFlag()!=null){
                            	  	if(pat.getFlag().equals("add")){%>
                            	  		<jsp:include page="Add_Pats_Suc.jsp"></jsp:include>
                                   <% } %>
                               <% }else{ %>
                               	<jsp:include page="Add_Pats.jsp"></jsp:include>
                               <%} %>
                               
                            </div>
                            <div class="tab-pane tabs-animation fade <%=e_show%> <%=search%>" id="tab-content-1" role="tabpanel">
                           
                                	<div class="row">
                                    <div class="col-md-12">                                        
                                        <div class="main-card mb-3 card add_container1">
                                            <!-- 查詢成員程式碼 -->
                                            <form action="./Search_one" method="post" style="margin-top:15px;">                                           
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