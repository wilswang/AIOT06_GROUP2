<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="row">
        <div class="col-md-12">
            <div class="main-card mb-3 card add_container1">
                <!-- 新增成員程式碼 -->
                <form class="form_pattern" id="form_add" action="" method="post" style="margin-top:15px;" accept-charset=utf-8>                                               
                	<h2 style="text-align:center" id="add_result"></h2>
                    <div class="container">
                      <div id="lab_patno">
                      <label for="a_patno"><b>Patient No.</b></label>
                  	  <input type="text"  id="a_patno" name="patno" value="" readonly><br>
                      </div>
                      <label for="a_pname"><b>Name</b></label>
                      <input type="text" placeholder="Enter Name" id="a_pname" name="pname" required="required" autocomplete="off"><br>
                        
                      <label for="a_birthday"><b>Birthday</b></label>                                                  
                      <input class="datepicker" type="text" id="a_birthday" name="birthday" autocomplete="off" required="required"/>
                      
                      <div id="a_gender1">
                      <label for="gender" ><b>Gender</b></label><br>
                      <select name="gender"  class="gender">
                        <option selected="selected" disabled="disabled"  style='display: none' value=''></option> 
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                      </select><br></div>
					  
					  <div id="a_gender2">
					  <label for="a_gender21"><b>Gender</b></label><br>
                      <input type="text" name="gender2" id="a_gender21" autocomplete="off"><br>
					  </div>
					  
					  <label for="a_Height"><b>Height</b></label>                                                  
                      <input type="text" placeholder="Enter height with unit as cm." id="a_Height" name="Height" autocomplete="off" required="required"/>
                      
                      <label for="a_Weight"><b>Weight</b></label>                                                  
                      <input type="text" placeholder="Enter height with unit as kg." id="a_Weight" name="Weight" autocomplete="off" required="required"/>
                      
                      <label for="a_M_phone"><b>Mobile phone No</b></label>
                      <input type="text" placeholder="Enter Mobile Phone No." id="a_M_phone" name="M_phone" required="required" autocomplete="off" ><br>
                    
                      <label for="a_E_contact"><b>Emergency Contact Person</b></label>
                      <input type="text" placeholder="Enter Contact Person" id="a_E_contact" name="E_contact" required="required" autocomplete="off" ><br>

                      <label for="a_E_phone_no"><b>Emergency Contact phone no.</b></label>
                      <input type="text" placeholder="Enter phone no." id="a_E_phone_no" name="E_phone_no" required="required" autocomplete="off" ><br>

                      <label for="a_E_relationship"><b>Emergency Contact relationship</b></label>
                      <input type="text" placeholder="Enter relation" id="a_E_relationship" name="E_relationship" required="required" autocomplete="off" ><br>

                      <button  class="form_button" id="a_submit" type="submit" >Submit</button>
                      <button type="reset" class="cancelbtn" onclick="navigateToPage('Edit_Pats2.jsp')">Clear</button>                                                  
                
                    </div>                                            
                    <div class="add_container" style="background-color:#f1f1f1"></div>
                  </form>
                                                          
            </div>
        </div>                                    
    </div>
<script >
        $(function(){             
	        $("#lab_patno").hide();
	        $("#a_gender2").hide();
        });
</script>