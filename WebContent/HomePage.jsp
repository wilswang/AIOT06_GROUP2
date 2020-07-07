<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.patientinfo.HealthcareBean"%>
<%@ include file="backtotop.jsp"%> 

<div class="app-main__inner">
	<div class="app-page-title">
		<div class="page-title-wrapper">
			<div class="page-title-heading">
				<div class="page-title-icon">
					<i class="fas fa-home"></i>
				</div>
				<div>
					HomePage
					<div class="page-title-subheading">Today's detection.</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 首頁三個重要指標 -->
	<div class="row">
		<div class="col-md-6 col-xl-4">
			<div class="card mb-3 widget-content bg-midnight-bloom">
				<div class="widget-content-wrapper text-white">
					<div class="widget-content-left">
						<div class="widget-heading">Pulse Rate</div>
						<div class="widget-subheading">Abnormal number</div>
					</div>
					<div class="widget-content-right">
						<!-- 回傳檢測值 -->
						<div class="widget-numbers text-white">
							<span class="prc"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-xl-4">
			<div class="card mb-3 widget-content bg-arielle-smile">
				<div class="widget-content-wrapper text-white">
					<div class="widget-content-left">
						<div class="widget-heading">SBP/DBP</div>
						<div class="widget-subheading">Abnormal number</div>
					</div>
					<div class="widget-content-right">
						<!-- 回傳檢測值 -->
						<div class="widget-numbers text-white">
							<span class="sbp_dbp"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-xl-4">
			<div class="card mb-3 widget-content bg-grow-early">
				<div class="widget-content-wrapper text-white">
					<div class="widget-content-left">
						<div class="widget-heading">Glucose</div>
						<div class="widget-subheading">Abnormal number</div>
					</div>
					<div class="widget-content-right">
						<!-- 回傳檢測值 -->
						<div class="widget-numbers text-white">
							<span class="glc"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- RWD 出現的標籤 : 目前使用SpO2-->
		<div class="d-xl-none d-lg-block col-md-6 col-xl-4">
          <div class="card mb-3 widget-content bg-secondary">
              <div class="widget-content-wrapper text-white">
                  <div class="widget-content-left">
                      <div class="widget-heading">SpO2</div>
                      <div class="widget-subheading">Abnormal number</div>
                  </div>
                  <div class="widget-content-right">
                      <div class="widget-numbers text-white"><span class="spo2_c"></span></div>
                  </div>
              </div>
          </div>
		</div>
	</div>
	<!-- 小方塊置放區 -->
	<div class="allmember1 row">		
	</div>
</div>

<script type="text/javascript">
$(function(){
	CommonLib.destroyAllBlock(); // 清除loading頁面
	//第一次讀取
	DetectAbnormal();
	
	// 宣告一變數去接time id的值
	let timer_id = setInterval(function(){ DetectAbnormal(); }, 150000); //每15秒執行一次DetectAbnormal
	
	//自動更新
	if(timer_id){
		timer_id;  
 	};
 	
 	// 當切換至別的頁面時，清除time id的值
	$(".vertical-nav-menu li:not(.app-sidebar__heading)").click(function(){
		clearInterval(timer_id);
	});
	
	function DetectAbnormal(){
		$.ajax({  
	            type:"post", 
	            url:"DetectAbnormal",   
	            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
	            success:
	                function(data){
						$("div.allmember1").empty();
						$(".prc").text(data[data.length-1]["PRc"]);
						$(".sbp_dbp").text(data[data.length-1]["SBP_DBP_C"]);
						$(".glc").text(data[data.length-1]["glc"]);
						$(".spo2_c").text(data[data.length-1]["spo2_count"]);
	            		for(var i=0; i< data.length-1;i++){
		            		let glucose_ , img_src, bp_status;
		            		let glucose=parseInt(data[i]['glucose']);
		            		let pulseRate=parseInt(data[i]['Pulse_Rate']);
		            		let sbp=parseInt(data[i]['SBP']);
		            		let dbp=parseInt(data[i]['DBP']);
		            		if(glucose >100){
		            			glucose_="prcss";
		            		}else{
		            			glucose_="alltext"
		            		};
		            		if(pulseRate > 100 | pulseRate < 60){
		            			pulse_status = "prcss";
		            		}else{
		            			pulse_status = "alltext";
		            		}
		            		if(sbp>=140 | dbp>=90){
		            			bp_status = "prcss";
		            		}else{
		            			bp_status = "alltext";
		            		};
		            		if(glucose <= 100 & pulseRate <= 100 & pulseRate >= 60 & sbp<140 & dbp < 90){
		            			continue;
		            		}else{
		            			$("div.allmember1").append(
		            				'<div class="col-xl-2 col-lg-3 col-md-3 col-6" style="margin-top:5px;padding: 0px 5px;"><form class="member " method="post" action="">'
		            	            +'<div class="member-head"><p class="alltext name">'+data[i]['pName']+'</p>'
		            	            +'<div class="glucose">'
		            	            +'<img src="./assets/images/glucose.png" alt="glucose">'
		            	            +'<p class="Gluid '+glucose_+'">'+data[i]['glucose']+'</p></div>'
		            	            +'</div>'
		            	            +'<div class="pic"><img class="mebimg rounded-circle" src="./assets/images/oldperson/'+ data[i]['Patno'] +'.png" onclick="navigateToPage2('+data[i]['Patno']+','+timer_id+')"/>'
		            	            +'</div>'
		            	            +'<div class="hart"><img src="./assets/images/hart.png" alt="hart">'    
		            	            +'<p class="Prid" '+pulse_status+'>'+pulseRate+'</p></div>'
		            	            +'<div class="bdpresseure">'
		            	            +'<img src="./assets/images/bdpressure.png" alt="bdpresseure">'
		            	            +'<p class="SDBPid '+bp_status+'">'+sbp+'/'+dbp+'</p></div></form></div>'  
		            			);
		            		}
	            		}
	            	},  
	            error:
	                function(xhr, ajaxOptions, thrownError){
		            	alert("Detect abnormal Fail!"+xhr.status+"\n"+thrownError);
	                }
        });return true
	};
}); 

</script>
