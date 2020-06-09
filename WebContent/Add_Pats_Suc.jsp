<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
    <div class="col-md-12">
        <div class="main-card mb-3 card add_container1">
            <!-- 新增成員程式碼 -->
            
            <form class="form_pattern" action="" method="get" style="margin-top:15px;">  
            <h2 style="text-align:center">Add Successfully!</h2>                                             
            <jsp:useBean id="pat" scope="request" class="com.patientinfo.HealthcareBean" />
			<% String patno=pat.getPatno(), pname=pat.getpName(), bd=pat.getBirthday(), ge=pat.getGender(), mp=pat.getM_phone(), 
			ep=pat.getE_contact_person(), en=pat.getE_contact_no(),er=pat.getE_contact_relation();%>	
                <div class="container">
                  
                  <label for="patno"><b>Patient No.</b></label>
                  <input type="text"  name="patno" value=<%=patno%> readonly><br>
                  
                  <label for="pname"><b>Name</b></label>
                  <input type="text"  name="pname" value=<%=pname%> readonly><br>
                    
                  <label for="birthday"><b>Birthday</b></label>                                                                                                   
                  <input class="datepicker" type="text" name="birthday" value=<%=bd%> readonly/>

                  <label for="gender"><b>Gender</b></label><br>
                  <input type="text" name="gender"  value=<%=ge%> readonly><br>
                  

                  <label for="M_phone"><b>Mobile phone No</b></label>
                  <input type="text" placeholder="Enter Mobile Phone No." name="M_phone" required="required" autocomplete="off" value=<%=mp%> readonly><br>
                
                  <label for="E_contact"><b>Emergency Contact Person</b></label>
                  <input type="text" placeholder="Enter Contact Person" name="E_contact" required="required" autocomplete="off" value=<%=ep%> readonly><br>

                  <label for="E_phone_no"><b>Emergency Contact phone no.</b></label>
                  <input type="text" placeholder="Enter phone no." name="E_phone_no" required="required" autocomplete="off" value=<%=en%> readonly><br>

                  <label for="E_relationship"><b>Emergency Contact relationship</b></label>
                  <input type="text" placeholder="Enter relation" name="E_relationship" required="required" autocomplete="off" value=<%=er%> readonly><br>

                  <%--<button class="form_button" type="submit">Submit</button> --%>
                  <button type="reset" class="cancelbtn" onclick="location.href='./Edit_members.jsp'">Back</button>                                                  
            
                </div>                                            
                <div class="add_container" style="background-color:#f1f1f1"></div>
              </form>
            <!-- 新增成員程式碼 -->                                            
        </div>
    </div>                                    
</div>