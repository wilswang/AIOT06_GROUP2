<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.patientinfo.membersBean"%>
    
<%! @SuppressWarnings("unchecked") %>
<!doctype html>
<html lang="en">
<jsp:include page="web_head.jsp">
	<jsp:param name="subTitle" value="Members"/>
</jsp:include>
<body onbeforeunload="window.location='./logout.jsp'">
	<div id="pagetop"style="visibility:hidden"></div>
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <%@ include file="backtotop.jsp"%> 
		<%@ include file="header.jsp"%> 
		<div class="app-main">
			<jsp:include page="sidebar.jsp"></jsp:include>
            <div class="app-main__outer">
                <div class="app-main__inner">
                    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-users icon-gradient bg-happy-itmeo">
                                    </i>
                                </div>
                                <div>Members
                                    <div class="page-title-subheading">All members info can be checked here.
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>                    
                    
                     <div class="allmember">                
                        
                        <% List<membersBean> pms = (ArrayList<membersBean>)request.getAttribute("pms"); 
   		                      for(membersBean pms_ : pms) { %>
   		                               		                            
                     	<form  class="member" id="member01" method="post" action="./MembersDetails">
                            <p class="alltext name"><%=pms_.getpName()%></p>
                            <div class="glucose">
                                <img src="./assets/images/glucose.png" alt="glucose">
                                                                        
                                <% 
                                    String g = "";
                                    if (Integer.parseInt(pms_.getGlucose())>100){
                                    	 g = "prcss";}
                                        
                                    else{
                                    	 g = "alltext";
                                    }                               
                                %>
                             
                                <p id="Gluid" class=<%=g %> ><%=pms_.getGlucose() %></p>                                                
                            </div>
                            <div class="pic">    
                                 <bottom type="submit" >
                                 
                                   <% 
                                    String imgg = "";
                                    if (Integer.parseInt(pms_.getGlucose())>100 || Integer.parseInt(pms_.getPulse_Rate())>100 || Integer.parseInt(pms_.getPulse_Rate())<60 || Integer.parseInt(pms_.getSBP())>=140 || Integer.parseInt(pms_.getDBP())>=90 ){
                                    	 imgg = "./assets/images/NHMan.png";}
                                        
                                    else{
                                    	 imgg = "./assets/images/HMan.png";
                                    }                               
                                %>
                                 <input class="mebimg" type="image" src=<%=imgg %>  />
                                 <input type="text" value=<%=pms_.getPatno() %> name=patno style="display: none;">
                                 </bottom>                                              
                            </div>                                
                            <div class="hart">                                      
                                <img src="./assets/images/hart.png" alt="hart">                                                
                                <% 
                                    String p = "";
                                    if (Integer.parseInt(pms_.getPulse_Rate())>100 || Integer.parseInt(pms_.getPulse_Rate())<60){
                                    	p = "prcss";}
                                    else{
                                    	p = "alltext";
                                    }                               
                                %>                                          
                                <p id="Prid" class=<%=p %>><%=pms_.getPulse_Rate() %></p>                                
                            </div>
                            <div class="bdpresseure">
                                <img src="./assets/images/bdpressure.png" alt="bdpresseure">
                                
                                <% 
                                    String s = "";
                                    if (Integer.parseInt(pms_.getSBP())>=140 || Integer.parseInt(pms_.getDBP())>=90){
                                    	s = "prcss";}
                                    else{
                                    	s = "alltext";
                                    }                               
                                %>                                                
                                <p id="SDBPid" class=<%=s %>><%=pms_.getSBP()%>/<%=pms_.getDBP() %></p>                               
                            </div>
                        </form>                                       
                    <% } %> 
                    </div>                    
                </div>
            </div>            
        </div>
    </div>

<script type="text/javascript" src="./assets/scripts/main.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script >
		$(function(){             
        	$("ul.vertical-nav-menu li:nth-child(4)> a").addClass("mm-active");            
 		});
    </script>
</body>

</html>
