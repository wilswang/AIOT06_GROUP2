<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="web_head.jsp">
	<jsp:param name="subTitle" value="File Management"/>
</jsp:include>
<body onbeforeunload="window.location='./logout.jsp'">
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
      	<%@ include file="header.jsp"%> 
		<div class="app-main">
			<jsp:include page="sidebar.jsp"></jsp:include>
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <div class="app-page-title">
                            <div class="page-title-wrapper">
                                <div class="page-title-heading">
                                    <div class="page-title-icon">
                                        <i class="pe-7s-paperclip icon-gradient bg-plum-plate">
                                        </i>
                                    </div>
                                    <div>Upload Files
                                        <div class="page-title-subheading">the uploaded files should follow specific format
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>           
                         <div class="">
                            <div class="row">
                                <div class="col-md-6">
                                <!-- <div class="col-lg-6 col-xl-4"> -->
                                    <div class="main-card mb-3 card add_container1">
                                    <!-- <div class="card mb-3 widget-content"> -->
                                        <!-- 上傳健檢資料程式碼 -->
                                        <form enctype="multipart/form-data" method="post" action="./UploadFile" style="margin-top:15px;"> 
                                            <div class="container">
                                            <jsp:useBean id="pat" scope="request" class="com.patientinfo.Patbean" />
                                            <% String flag=pat.getFlag(); 
                                            	if(flag!=null){%>
                                               <h2 style="text-align:center"><%=flag%> successfully</h2>
                                               <%} %>
                                              <label for="healthcheck"><b>Healthcheck File</b></label><br>
                                              <input type="file" placeholder="Please upload .csv file" name="healthcheck" required="required" accept=".csv"onchange="checkfile(this);"><br>
                                              <button type="submit">Submit</button>
                                              <button type="reset" class="cancelbtn"  onclick="location.href='./File_management.jsp'">Clear</button></div>
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

	<script type="text/javascript" src="./assets/scripts/main.js"></script>

	<script type="text/javascript">
	    function checkfile(sender) {
	    
	      // 可接受的附檔名
	      var validExts = new Array(".csv");
	    
	      var fileExt = sender.value;
	      fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
	      if (validExts.indexOf(fileExt) < 0) {
	        alert("檔案類型錯誤，可接受的副檔名有：" + validExts.toString());
	        sender.value = null;
	        return false;
	      }
	      else return true;
	    }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script >
		$(function(){             
        	$("ul.vertical-nav-menu li:nth-child(7)> a").addClass("mm-active");            
 		});
    </script>
    </body>
</html>