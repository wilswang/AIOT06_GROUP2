
    <div class="row">
        <div class="col-md-12">
            <div class="main-card mb-3 card add_container1">
                <!-- 新增成員程式碼 -->
                <form class="form_pattern" action="./AddPatient" method="post" style="margin-top:15px;">                                               
                
                    <div class="container">
                      <label for="pname"><b>Name</b></label>
                      <input type="text" placeholder="Enter Name" name="pname" required="required" autocomplete="off"><br>
                        
                      <label for="birthday"><b>Birthday</b></label>                                                  
                      <input class="datepicker" type="text" name="birthday" autocomplete="off" required="required"/>

                      <label for="gender"><b>Gender</b></label><br>
                      <select name="gender" class="gender">
                        <option selected="selected" disabled="disabled"  style='display: none' value=''></option> 
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                      </select><br>

                      <label for="M_phone"><b>Mobile phone No</b></label>
                      <input type="text" placeholder="Enter Mobile Phone No." name="M_phone" required="required" autocomplete="off" ><br>
                    
                      <label for="E_contact"><b>Emergency Contact Person</b></label>
                      <input type="text" placeholder="Enter Contact Person" name="E_contact" required="required" autocomplete="off" ><br>

                      <label for="E_phone_no"><b>Emergency Contact phone no.</b></label>
                      <input type="text" placeholder="Enter phone no." name="E_phone_no" required="required" autocomplete="off" ><br>

                      <label for="E_relationship"><b>Emergency Contact relationship</b></label>
                      <input type="text" placeholder="Enter relation" name="E_relationship" required="required" autocomplete="off" ><br>

                      <button class="form_button" type="submit">Submit</button>
                      <button type="reset" class="cancelbtn">Clear</button>                                                  
                
                    </div>                                            
                    <div class="add_container" style="background-color:#f1f1f1"></div>
                  </form>
                                                          
            </div>
        </div>                                    
    </div>