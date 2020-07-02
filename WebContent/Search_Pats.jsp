<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <div class="row">
<div class="col-md-12">                                        
    <div class="main-card mb-3 card add_container1" style="margin-top:15px;">
        <!-- 查詢成員程式碼 -->
        <form class="form_pattern" action="" id="form_search" method="post" style="margin-top:15px;">
            <h2 style="text-align:center" id="search_result"></h2>
            <div class="container" id="form_search2">              
              <label for="patno"><b>Patient No.</b></label>
              <input type="text"  id="s_patno" name="patno"><br>
              
              <label for="pname"><b>Name</b></label>
              <input type="text" id="s_pname" name="pname" autocomplete="off"><br>
                
              <label for="birthday"><b>Birthday</b></label>                                                                                                   
              <input class="datepicker" type="text" id="s_birthday" name="birthday" autocomplete="off"/>

			  <div id="s_gender1">
              <label for="gender"><b>Gender</b></label><br>
              <select name="gender" class="gender">
                <option  disabled="disabled"  style='display: none' value=''></option> 
                <option value="Male">Male</option>
                <option value="Female">Female</option>
              </select><br></div>
              
			  <label for="Height"><b>Height</b></label>                                                  
              <input type="text" placeholder="Enter height with unit as cm." id="s_Height" name="Height" autocomplete="off"/>
              
              <label for="Weight"><b>Weight</b></label>                                                  
              <input type="text" placeholder="Enter height with unit as kg." id="s_Weight" name="Weight" autocomplete="off"/>
                      
			  <label for="M_phone"><b>Mobile phone No</b></label>
              <input type="text" placeholder="Enter Mobile Phone No." id="s_M_phone" name="M_phone" autocomplete="off"><br>
            
              <label for="E_contact"><b>Emergency Contact Person</b></label>
              <input type="text" placeholder="Enter Contact Person" id="s_E_contact" name="E_contact" autocomplete="off"><br>

              <label for="E_phone_no"><b>Emergency Contact phone no.</b></label>
              <input type="text" placeholder="Enter phone no." id="s_E_phone_no" name="E_phone_no" autocomplete="off"><br>

              <label for="E_relationship"><b>Emergency Contact relationship</b></label>
              <input type="text" placeholder="Enter relation" id="s_E_relationship" name="E_relationship" autocomplete="off"><br>

              <button class="form_button" type="submit" id="s_submit">Search</button>
              <button type="reset" class="cancelbtn" >Clear</button>                                                  
        
            </div>                                            
            <div class="add_container" style="background-color:#f1f1f1"></div>
              </form>                                          
        </div>                                        
    </div>
</div>
<script>
	$(function(){             
	    
	    $("#s_patno").nextUntil("#s_submit").hide();

	});
</script>
</body>
</html>