<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="backtotop.jsp"%> 
		
 <div class="app-main__inner">
     <div class="app-page-title">
         <div class="page-title-wrapper">
             <div class="page-title-heading">
                 <div class="page-title-icon">
                     <i class="fas fa-user-cog">
                     </i>
                 </div>
                 <div>Edit patients info
                     <div class="page-title-subheading">You can add, search or modify Patients' Info
                     </div>
                 </div>
             </div>
         </div>
     </div>
     
    <ul class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
        <li class="nav-item active">
            <a role="tab" class="nav-link active show" id="tab-0" data-toggle="tab" href="#tab-content-0">
                <span>Add</span>
            </a>
        </li>
        <li class="nav-item">
            <a role="tab" class="nav-link " id="tab-1" data-toggle="tab" href="#tab-content-1">
                <span>Search/Modify</span>
            </a>
        </li>
    </ul>
    <div class="tab-content">
       <div class="tab-pane tabs-animation fade active show in" id="tab-content-0" role="tabpanel">
           	<jsp:include page="Add_Pats.jsp"></jsp:include>
        </div>
        <div class="tab-pane tabs-animation fade " id="tab-content-1" role="tabpanel">       
            <jsp:include page="Search_Pats.jsp"></jsp:include>
        </div>
    </div>
</div>

<script type="text/javascript">   
$(function() {
	CommonLib.destroyAllBlock(); // 清除loading頁面
	$("li.nav-item >a").click(function(){
	        $(this).addClass("active").parent().addClass("active").siblings().removeClass("active").children().removeClass("active");
	        if($(this).prop("id")=="tab-0"){
	        	$("#tab-content-0").addClass("active show in").siblings().removeClass("active show in");
	        }else{
	        	$("#tab-content-1").addClass("active show in").siblings().removeClass("active show in");
	        }
		});
	
	$("#form_add").submit(function(event) {   
		event.preventDefault();	
		$.ajax({  
	            type:"post", 
	            url:"AddPatient",   
	            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
	            data : $("#form_add").serialize(),
	            success:
	                function(data){              			
		            	$("#add_result").text("Add Successfully!");	
		            	$("#lab_patno").show().attr("readonly", true);
		            	$("#a_patno").val(data.Patno).attr("readonly", true);
		            	$("#a_pname").val(data.pName).attr("readonly", true);
		            	$("#a_gender2").show();
		            	$("#a_gender21").val(data.Gender).attr("readonly", true);
		            	$("#a_gender1").hide();
		            	$("#a_Height").val(data.Height).attr("readonly", true);
		            	$("#a_Weight").val(data.Weight).attr("readonly", true);
		            	$("#a_birthday").val(data.birthday).attr("readonly", true);
		            	$("#a_M_phone").val(data.m_phone).attr("readonly", true);
		            	$("#a_E_contact").val(data.e_contact_person).attr("readonly", true);
		            	$("#a_E_phone_no").val(data.e_contact_no).attr("readonly", true);
		            	$("#a_E_relationship").val(data.e_contact_relation).attr("readonly", true);
		            	$("#a_submit").hide();
		            	console.log(data);
	            	},  
	            error:
	                function(xhr, ajaxOptions, thrownError){
	            	$("#add_result").text("Add Fail!");    
	            	alert("Add Fail!"+xhr.status+"\n"+thrownError);
	                }
	        });  
	    }); 


	$("#form_search").submit(function(event){     
		event.preventDefault();
		event.stopPropagation();
		$.ajax({
	        type:"post", 
	        url:"Search_one",   
	        dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
	        data : $("#form_search").serialize(),
	        success:
	            function(data){   
	        		if(data.Gender=="Male"){
	        			$("#s_gender1 select option:eq(1)").attr("selected",true);
	            	}else{
	            		$("#s_gender1 select option:eq(2)").attr("selected",true);
	            	}
	        		$("#form_search").attr("id","form_edit");;
	        		$("#s_patno").nextUntil("#s_submit").show();
	        		$("#search_result").text("Search Successfully!");
	            	$("#s_patno").val(data.Patno).attr("readonly","readonly");
	            	$("#s_pname").val(data.pName);	            	
	            	$("#s_Height").val(data.Height);
	            	$("#s_Weight").val(data.Weight);
	            	$("#s_birthday").val(data.birthday);
	            	$("#s_M_phone").val(data.m_phone);
	            	$("#s_E_contact").val(data.e_contact_person);
	            	$("#s_E_phone_no").val(data.e_contact_no);
	            	$("#s_E_relationship").val(data.e_contact_relation);		            	
	            	$("#s_submit").html("Edit");
	            	$(".cancelbtn").html("Cancel").on('click', function(event){
	            		event.stopPropagation();
	            		$("#wrap_content").load('Edit_Pats.jsp');
	            		$('html,body').animate({
	        	            scrollTop: 0
	        	        }, 700);
	            	});
	            	$("#form_edit").submit(function(event) {     
	            		event.preventDefault();
	            		event.stopPropagation();
	            		$.ajax({  
	            	            type:"post", 
	            	            url:"EditPatient",   
	            	            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
	            	            data : $("#form_edit").serialize(),
	            	            success:
	            	                function(data){   
	            	            		console.log(data);
	            	            		if(data.Gender=="Male"){
	            	            			$("#s_gender1 select option:eq(1)").attr("selected",true);
	            		            	}else{
	            		            		$("#s_gender1 select option:eq(2)").attr("selected",true);
	            		            	};	            		
	            	            		//$("#s_patno").nextUntil("#s_submit").show();
	            	            		$("#search_result").text("Edit Successfully!");
	            		            	$("#s_patno").val(data.Patno).attr("readonly","readonly");
	            		            	$("#s_pname").val(data.pName)		            	
	            		            	$("#s_Height").val(data.Height)
	            		            	$("#s_Weight").val(data.Weight);
	            		            	$("#s_birthday").val(data.birthday);
	            		            	$("#s_M_phone").val(data.m_phone);
	            		            	$("#s_E_contact").val(data.e_contact_person);
	            		            	$("#s_E_phone_no").val(data.e_contact_no);
	            		            	$("#s_E_relationship").val(data.e_contact_relation);	            	
	            		            	$("#s_submit").html("Edit");
	            		            	/*$(".cancelbtn").html("Cancel").on('click', function(event){
	            		            		event.stopPropagation();
	            		            		$("#wrap_content").load('Edit_Pats2.jsp');
	            		            	});*/
	            		            	//$("#form_search2.cancelbtn").append("<button class=\"form_button\" type=\"button\" onclick=\"navigateToPage('Edit_Pats2.jsp')\">Cancel</button>")
	            	            	},  
	            	            error:
	            	                function(xhr, ajaxOptions, thrownError){
	            	            	$("#add_result").text("Edit Fail!");
	            	            	alert("Edit Fail!"+xhr.status+"\n"+thrownError);
	            	                }
	            	        });  
	            	    });
				},
	        error:
	            function(xhr, ajaxOptions, thrownError){
	            	$("#add_result").text("Search Fail!");
	            	alert("Search Fail!"+xhr.status+"\n"+thrownError);
	            },
	    });  
	}); 
	
	

	
	//19-jQuery datepicker Methods getDate setDate
    $(".birthday").datepicker({
      //設定日期格式
      dateFormat : "yy-mm-dd",
      width:"180px"
    });
    
     //$(".datepicker").datepicker({width:"180px"});
    

    
   
    

});
</script> 


 
