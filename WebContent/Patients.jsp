<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.patientinfo.HealthcareBean"%>
    
<script type="text/javascript">
$(function(){
	CommonLib.destroyAllBlock(); // 清除loading頁面
	//第一次讀取
	GetPatients();
	
	// 宣告一變數去接time id的值
	let timer_id = setInterval(function(){ GetPatients(); }, 15000); //每15秒執行一次DetectAbnormal
	
	//自動更新
	if(timer_id){
		timer_id;  
		//console.log("timer_id: "+timer_id);
 	};

 	// 當切換至別的頁面時，清除time id的值
	$(".vertical-nav-menu li:not(.app-sidebar__heading)").click(function(){
		clearInterval(timer_id);
		//console.log('Clear: '+timer_id);
	})
	
	function GetPatients(){
		$.ajax({  
	            type:"post", 
	            url:"GetPatients",   
	            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
	            //data : $("#form_add").serialize(),
	            success:
	                function(data){              			
	            		//console.log("timer_id: "+timer_id);
	            		$("div.allmember1").empty();
	            		for(var i=0; i< data.length;i++){
		            		let glucose_ , img_src, bp_status, pulse_status;
		            		let glucose=parseInt(data[i]['glucose']);
		            		let pulseRate=parseInt(data[i]['Pulse_Rate']);
		            		let sbp=parseInt(data[i]['SBP']);
		            		let dbp=parseInt(data[i]['DBP']);
		            		if(glucose >100){
		            			glucose_="prcss";
		            		}else{
		            			glucose_="alltext"
		            		};
		            		if(pulseRate>100 | pulseRate<60){
		            			pulse_status = "prcss"
		            		}else{
		            			pulse_status = "alltext"
		            		}
		            		if(sbp>=140 | dbp>=90){
		            			bp_status = "prcss";
		            		}else{
		            			bp_status = "alltext";
		            		};
		            		$("div.allmember1").append(
		            				'<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6" style="margin-top:5px;padding: 0px 5px"><form  class="member" method="post" action="">'
		            	            +'<div class="member-head"><p class="alltext name">'+data[i]['pName']+'</p>'
		            	            +'<div class="glucose">'
		            	            +'<img src="./assets/images/glucose.png" alt="glucose">'
		            	            +'<p class="Gluid '+glucose_+'">'+data[i]['glucose']+'</p></div>'
		            	            +'</div>'                                          
		            	            +'<div class="pic"><img class="mebimg rounded-circle" src="./assets/images/oldperson/'+ data[i]['Patno'] +'.png" onclick="navigateToPage2('+data[i]['Patno']+')"/>'
		            	            +'</div>'
		            	            +'<div class="hart"><img src="./assets/images/hart.png" alt="hart">'    
		            	            +'<p class="Prid '+pulse_status+'">'+data[i]['Pulse_Rate']+'</p></div>'
		            	            +'<div class="bdpresseure">'
		            	            +'<img src="./assets/images/bdpressure.png" alt="bdpresseure">'
		            	            +'<p class="SDBPid '+bp_status+'">'+sbp+'/'+dbp+'</p></div></form></div>'  
	            			);
	            		}
	            	},  
	            error:
	                function(xhr, ajaxOptions, thrownError){
		            	alert("Get Patients Fail!"+xhr.status+"\n"+thrownError);
	                }
	        });
	}
 }); 

</script>

<%@ include file="backtotop.jsp"%> 
<div class="app-main__inner">
    <div class="app-page-title">
        <div class="page-title-wrapper">
            <div class="page-title-heading">
                <div class="page-title-icon">
                    <i class="fas fa-user-friends"></i>
                </div>
                <div>Patients
                    <div class="page-title-subheading">All patients info can be checked here.</div>                    
                </div>
            </div>                            
        </div>
    </div>  
     <div class="allmember1 row"></div>                    
</div>
