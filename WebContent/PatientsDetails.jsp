<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*,com.patientinfo.HealthcareBean"%>
<%@ include file="backtotop.jsp"%> 
<div class="app-main__inner">
	<div class="app-page-title">
		<div class="page-title-wrapper">
			<div class="page-title-heading">
				<div class="page-title-icon">
					<i class="fas fa-user-friends"></i>
				</div>
				<div>Patients Detail
					<div class="page-title-subheading">All patients info can be checked here.</div>
				</div>
			</div>
		</div>
	</div>
	
		<div id="load" style="position: relative;">
			<img src="./assets/images/loading.gif" style="left:50% ; position: absolute; top: 50%; transform: translateX(-50%)"/>
		</div>
		<div id="div_patient_dashboard" class="row">
			<div class="col-xl-4 col-md-12 col-xs-12" >
				<div class=" main-card mb-3 card">
				<div class="card-body">
					<div class="widget-content pb-0">
						<div class="widget-content-outer">
							<div class="widget-content-wrapper" >
								<div class="widget-content-left  col-md-6">
									<div class="widget-heading">Patient No. </div>
									<span class="widget-numbers mt-0 fsize-3 text-secondary"style="display: inline" id="patno"></span>
								</div>
								<div class="widget-content-right col-md-6">
									<div class="widget-heading " >Cardiovascular Disease Status</div>
									<span class="widget-numbers mt-0 fsize-3 text-secondary "style="text-align: right;display: inline"></span>
								</div>
							</div>
							<div class="widget-content-wrapper">
								<div class="widget-content-left col-md-6">
									<img id="sex" class="PatientPic" >
								</div>
								<div class="widget-content-right col-md-6">
									<div class="widget-progress-wrapper">
										<div class="widget-heading">Height</div>
										<span class="widget-numbers text-success" style="display: inline;" id="height"></span>
										<span class="widget-subheading text-success" style="display: inline;">cm</span>
									</div>
									<div class="widget-progress-wrapper ">
										<div class="widget-heading">Weight</div>
										<span class="widget-numbers text-success" style="display: inline;" id="weight"></span>
										<span class="widget-subheading text-success" style="display: inline;">kg</span>
									</div>
									<div class="widget-progress-wrapper">
										<div class="widget-heading">BMI</div>
										<span id="BMI" class="widget-numbers text-success" style="display: inline;"></span>
									</div>
									<div class="widget-progress-wrapper">
										<div class="widget-heading">Blood Type</div>
										<span id="BMI" class="widget-numbers text-success" style="display: inline; text-align:right"></span>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 詳細健康數據2 -->
			<div class="col-xl-4 col-md-6 col-xs-12">
				<div class=" main-card mb-3 card">
				<div class="card-body">
					<div class="widget-content pb-0">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="widget-content pb-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">Pulse Rate</div>
											<span id="Pulse_Rate_num" class="widget-numbers mt-0 fsize-3" style="display: inline"></span>
											<span class="widget-subheading" style="line-height: 20px; display: inline">bpm</span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress" style="margin-top: -10px;">
										<div id="Pulse_Rate" class="progress-bar" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="widget-content pb-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">SBP</div>
											<span id="SBP_num" class="widget-numbers mt-0 fsize-3" style="display: inline"></span>
											<span class="widget-subheading" style="line-height: 20px; display: inline">mmHg</span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress" style="margin-top: -10px;">
											<div id="SBP" class="progress-bar" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="widget-content pb-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">DBP</div>
											<span id="DBP_num" class="widget-numbers mt-0 fsize-3" style="display: inline"></span>
												<span class="widget-subheading" style="line-height: 20px; display: inline">mmHg</span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress" style="margin-top: -10px;">
											<div id="DBP" class="progress-bar" role="progressbar"aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
			<!-- 詳細健康數據3 -->
			<div class="col-xl-4 col-md-6 col-xs-12">
				<div class=" main-card mb-3 card ">
					<div class="card-body">
						<div class="widget-content pb-0">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="widget-content pb-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">Blood Glucose</div>
											<span id="glucose_num" class="widget-numbers mt-0 fsize-3 " style="display: inline"></span>
												<span class="widget-subheading" style="line-height: 20px; display: inline">mg/dL</span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress" style="margin-top: -10px;">
											<div id="glucose" class="progress-bar " role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="widget-content pb-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">SpO2</div>
											<span id="SpO2_num" class="widget-numbers mt-0 fsize-3" style="display: inline"></span>
											<span class="widget-subheading" style="line-height: 20px; display: inline">%</span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress" style="margin-top: -10px;">
											<div id="SpO2" class="progress-bar" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0%</div>
											<div class="sub-label-right">100%</div>
										</div>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="widget-content pb-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">TBD</div>
											<span id="cardio" class="widget-numbers mt-0 fsize-3" style="display: inline">TBD</span>
											<span class="widget-subheading" style="line-height: 20px; display: inline"></span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress" style="margin-top: -10px">
										<div id="cardio_test" class="progress-bar" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width:100%"></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0%</div>
											<div class="sub-label-right">100%</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
		<ul class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
			<li class="nav-item">
				<a role="tab" class="nav-link active" id="tab-0" data-toggle="tab" href="#tab-content-0" aria-selected="true">
					<span>History Data</span>
				</a>
			</li>
			<li class="nav-item">
				<a role="tab" class="nav-link" id="tab-1" data-toggle="tab" href="#tab-content-1" aria-selected="false">
					<span>History Charts</span>
				</a>
			</li>
			<li class="nav-item">
				<a role="tab" class="nav-link" id="tab-2" data-toggle="tab" href="#tab-content-2" aria-selected="false">
					<span>Health Exam Records</span>
				</a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane tabs-animation fade show active in" id="tab-content-0" role="tabpanel">
				<div class="row">
					<div class="col-md-12 ">
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title">History Data</h5>
								<table class="mb-0 table table-hover" style="text-align: center;">
									<thead>
										<tr>
											<th>Date</th>
											<th>Pulse Rate</th>
											<th>SBP</th>
											<th>DBP</th>
											<th>Blood Glucose</th>
											<th>SpO2</th>
										</tr>
									</thead>
									<tbody id="history">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane tabs-animation fade" id="tab-content-1" role="tabpanel">
				<div class="row">
					<div class="col-xl-6 col-md-12">
						<div class="main-card mb-3 card">
							<div class="card-body" style="width: 100%;">
								<h5 class="card-title" style="text-align: center">Pulse Rate</h5>
								<canvas id="PR" width="733" height="270"></canvas>
							</div>
						</div>
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center">Glucose</h5>
								<canvas id="Glu" width="733" height="270"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-md-12">
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center">SBP/DBP</h5>
								<canvas id="BP" width="733" height="270"></canvas>
							</div>
						</div>
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center">SpO2</h5>
								<canvas id="Sp" width="733" height="270"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane tabs-animation fade" id="tab-content-2" role="tabpanel">
				<div class="row">
					<div class="col-md-12">
						<div class="main-card mb-3 card">
							<div class="card-body ">
								<h5 class="card-title">Health Exam Record - Basic</h5>
								<table class="mb-0 table table-hover " style="text-align: center;">
									<thead>
									<tr>
										<th>Weight</th>
										<th>Height</th>
										<th>Waist line</th>
										<th>Naked eye_R</th>
										<th>Naked eye_L</th>
										<th>Corrected R</th>
										<th>Corrected L</th>
										<th>Color Blindness</th>
										<th>Hearing Test</th>
									</tr>
								</thead>
								<tbody id="he1">
									
								</tbody>
							</table>
							</div>
							<hr>
							<div class="card-body ">
							<h5 class="card-title">Health Exam Record</h5>
								<table class="mb-0 table table-hover " style="text-align: center;">
									<thead>
									<tr>
										<th>SBP</th>
										<th>DBP</th>
										<th>PRO</th>
										<th>OB</th>
										<th>WBC</th>
										<th>Hb</th>
										<th>GPT</th>
										<th>Crea</th>
										<th>T_CHO</th>
										<th>TG</th>
										<th>HDL</th>
										<th>LDL</th>
										<th>AC</th>
									</tr>
									</thead>
									<tbody id="he2">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
</div>
<!-- <script type="text/javascript" src="./assets/scripts/main.js"></script> -->
<script >
$(function(){             
	$(".row .col-md-4 .card-body:eq(0)").height($(".row .col-md-4 .card-body:eq(2)").height());
	$(".row .col-md-4 .card-body:eq(1)").height($(".row .col-md-4 .card-body:eq(2)").height());
	$("div.widget-content-outer").height($(".row .col-md-4 .card-body:eq(1)").height());
	
	$("li.nav-item >a").click(function(){
        $(this).addClass("active").parent().addClass("active").siblings().removeClass("active").children().removeClass("active");
        if($(this).prop("id")=="tab-0"){
        	$("#tab-content-0").addClass("active show in").siblings().removeClass("active show in");
        }else if($(this).prop("id")=="tab-1"){
        	$("#tab-content-1").addClass("active show in").siblings().removeClass("active show in");
        }else{
        	$("#tab-content-2").addClass("active show in").siblings().removeClass("active show in");
        }
	});
	
	console.log('Here is PD2.jsp');
	let dataNo = <%=request.getParameter("patno")%>;
	let dataNo_ = "patno="+dataNo;
	let labels = ["10","9","8","7","6","5","4","3","2","1"];
	let data = [];
	
	function config(labels,datas,ylabelString,suggestedMin_,suggestedMax_){
		let config_ = {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: '#CE0000',
                    data: datas,
                    fill: true,
                }]
            },
            options: {
                responsive: true,
                title: {
                    display: false,
                    text: 'Histogram of detection',
                },
                legend: {
                    display: false
                },
                tooltips: {
                	mode: 'index',
                    intersect: false,
                } ,
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Days Before'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: ylabelString
    	               		},
                   		ticks: {
    	                    suggestedMin: suggestedMin_,
    	                    suggestedMax: suggestedMax_,
    	                    stepSize:20,
    	                    padding:0
    	                    }
                    }]
                },
            }};return config_;
    }; // config_ end
    
    function config2(labels,data1,data2,ylabelString,suggestedMin_,suggestedMax_){
    	let config2_ = {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label:'SBP',
                    	backgroundColor: '#CE0000',
                        borderColor: '#CE0000',
                        data: data1,
                        fill: false,
                    }, {
                        fill: false,
                        label:'DBP',
                        backgroundColor: '#0080FF',
                        borderColor: '#0080FF',
                        data: data2,
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: false,
                        text: 'Histogram of detection',
                        
                    },
                    tooltips: {
	                	mode: 'index',
	                    intersect: false,
	                } ,
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Days Before'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: ylabelString
        	               		},
                       		ticks: {
        	                    suggestedMin: suggestedMin_,
        	                    suggestedMax: suggestedMax_,
        	                    stepSize:20,
        	                    padding:0
        	                    }
                        }]
                    },
                   }
            }; return config2_;
		};//config2 end
        
		// plot the charts
		let ctx1 = document.getElementById('PR').getContext('2d');
		let chart1 = new Chart(ctx1, config(labels,data,'bpm',50,200));
		let ctx2 = document.getElementById('Glu').getContext('2d');
		let chart2 = new Chart(ctx2, config(labels,data,'mmHg',50,200));
		let ctx3 = document.getElementById('BP').getContext('2d');
		let chart3 = new Chart(ctx3, config2(labels,data,data,'mg/dL',50,150));
		let ctx4 = document.getElementById('Sp').getContext('2d');
		let chart4 = new Chart(ctx4, config(labels,data,'percentage',60,120));
	    
		// ajax loading animation
// 		$(document).on({
// 		  ajaxStart: function() {
// 			  $("#load1 #load").show().siblings().hide();
			 
// 		  },
// 		  ajaxStop: function() {
// 			  $("#load1 #load").hide().siblings().show();
// 		  }
// 		});
		// call ajax fucntion and set the timer
		let flag = false;
		PatientsDetails();
		let PD_timer = setInterval(function(){ PatientsDetails(); }, 15000); //每15秒執行一次PatientsDetails
		
		if(PD_timer){
			PD_timer;  
	 	};
	 	
	 	$(".vertical-nav-menu li:not(.app-sidebar__heading)").click(function(){
			clearInterval(PD_timer);
		});
	 	
		function PatientsDetails(){
			if(flag){
				flag = true;
			}else{
				flag = true;
				CommonLib.block("div_patient_dashboard",load);
			}
				$.ajax({  
			            type:"post",
			            async: "false",
			            url:"PatientsDetails",   
			            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
			            data : dataNo_,
			            success:
			                function(data){  
			            		// Patient info 
			            		let patno = data["DMs"][0]["Patno"];
			            		let pname = data["Pat"][0]["pName"];
			            		$("div.app-main__inner .widget-heading:eq(0)").html('Patient No. '+patno);
			            		$("div.app-main__inner span.widget-numbers:eq(0)").html(pname);
			            		
			            		// 性別判斷
			            		$("#sex").attr("src","./assets/images/"+data["Pat"][0]["Gender"]+".png");
			            		
			            		//BMI
			            		let height = data["Pat"][0]["Height"];
			            		let h = height/100;
			            		let weight = data["Pat"][0]["Weight"]
			            		let BMI = Math.round(10*weight/Math.pow(h,2))/10;
			            		$("div.app-main__inner span.widget-numbers:eq(2)").html(height);
			            		$("div.app-main__inner span.widget-numbers:eq(3)").html(weight);
			            		$("div.app-main__inner span.widget-numbers:eq(4)").html(BMI);
			            		
			            		// Blood type
			            		let blood_type = data["Pat"][0]["Blood_Type"];
			            		$("div.app-main__inner span.widget-numbers:eq(5)").html(blood_type);
			            		
			            		// bar樣式設定
			            		function barwidth(data){return data*100/200};
			            		let pr = data["DMLatest"][0]["Pulse_Rate"];
			            		let pulse_bar = barwidth(pr)+"%";
			            		let SBP = data["DMLatest"][0]["SBP"];
			            		let SBP_bar = barwidth(SBP)+"%";
			            		let DBP = data["DMLatest"][0]["DBP"];
			            		let DBP_bar = barwidth(DBP)+"%";
			            		let glucose = data["DMLatest"][0]["glucose"];
			            		let glucose_bar = barwidth(glucose)+"%";
			            		let SpO2 = data["DMLatest"][0]["SpO2"];
			            		let SpO2_bar = SpO2+"%";
			            		let cardio = data["ml"][0]["result"];
			            		let pulse_class, pulse_num, SBP_class, SBP_num, DBP_class, DBP_num, glucose_class, glucose_num, SpO2_class, SpO2_num, cardio_class;
			            		$("div.app-main__inner span.widget-numbers:eq(1)").html(cardio);
			            		
			            		// pulse_rate
			            		$("div.app-main__inner span.widget-numbers:eq(6)").html(pr);
			            		$("#Pulse_Rate").attr("style","width:"+pulse_bar);		            		
			            		if (pr<60){
			            			$("#Pulse_Rate").addClass('bg-danger')
			            			$("#Pulse_Rate_num").addClass('text-danger')
		            			}else if(pr>=60 & pr<100){
			            			$("#Pulse_Rate").addClass('bg-success')
			            			$("#Pulse_Rate_num").addClass('text-success')
		            			}else if(pr>=100){
			            			$("#Pulse_Rate").addClass('bg-danger')
			            			$("#Pulse_Rate_num").addClass('text-danger')
		            			};
            					
            					// SBP
            					$("div.app-main__inner span.widget-numbers:eq(7)").html(SBP);
            					$("#SBP").attr("style","width:"+SBP_bar);
            					if (SBP<140){
            						$("#SBP").addClass('bg-success')
            						$("#SBP_num").addClass('text-success')
           						}else if(SBP>=140 & SBP<180){
            						$("#SBP").addClass('bg-warning')
            						$("#SBP_num").addClass('text-warning')
           						}else if(SBP>=180){
            						$("#SBP").addClass('bg-danger')
            						$("#SBP_num").addClass('text-danger')
           						};
            					
            					// DBP
            					$("div.app-main__inner span.widget-numbers:eq(8)").html(DBP);
            					$("#DBP").attr("style","width:"+DBP_bar);
            					if (DBP<90){
            						$("#DBP").addClass('bg-success')
            						$("#DBP_num").addClass('text-success')
           						}else if(DBP>=90 & DBP<120){
            						$("#DBP").addClass('bg-warning')
            						$("#DBP_num").addClass('text-warning')
           						}else if(DBP>=120){
            						$("#DBP").addClass('bg-danger')
            						$("#SBP_num").addClass('text-danger')
           						};
            					
            					// glucose
            					$("div.app-main__inner span.widget-numbers:eq(9)").html(glucose);
            					$("#glucose").attr("style","width:"+glucose_bar);
            					if (glucose<100){
            						$("#glucose").addClass('bg-success')
            						$("#glucose_num").addClass('text-success')
           						}else if(glucose>=100){
            						$("#glucose").addClass('bg-danger')
            						$("#glucose_num").addClass('text-danger')
           						};
            					
            					// SpO2
            					$("div.app-main__inner span.widget-numbers:eq(10)").html(SpO2);
            					$("#SpO2").attr("style","width:"+SpO2_bar);
            					if (SpO2<90){
            						$("#SpO2").addClass('bg-danger')
            						$("#SpO2_num").addClass('text-danger')
           						}else if(SpO2>=90 & SpO2<95){
            						$("#SpO2").addClass('bg-warning')
            						$("#SpO2_num").addClass('text-warning')
           						}else if(SpO2>=95){
            						$("#SpO2").addClass('bg-success')
            						$("#SpO2_num").addClass('text-success')
           						};
            					
            					// cardio
            					//$("div.app-main__inner span.widget-numbers:eq(11)").html(cardio);
            					if (cardio == "Safe"){
            						$("#cardio").addClass('text-success')
            						$("div.app-main__inner span.widget-numbers:eq(1)").addClass('text-success')
           						}else if(cardio == "Danger"){
            						$("#cardio").addClass('text-danger')
            						$("div.app-main__inner span.widget-numbers:eq(1)").addClass('text-danger blink_me')
           						};
            					
           						// 建立history data的table
								let table_ = "";
           						let j = data["DMs"].length-1
								for(let i=0; i<data["DMs"].length;i++){
									let table = '<tr><th>'+data["DMs"][j]["date"]+'</th>'+
									'<td>'+data["DMs"][j]["Pulse_Rate"]+'</td><td>'+
									data["DMs"][j]["SBP"]+'</td><td>'+
									data["DMs"][j]["DBP"]+'</td><td>'+
									data["DMs"][j]["glucose"]+'</td><td>'+
									data["DMs"][j]["SpO2"]+'</td></tr>';
									table_=table_+table;
									j--
								};
								$("#history").html(table_);
			            					            		
								// 建立health exam 的table
								let table_basic = "";
								let table_advance = "";
								for(let i=0; i<data["HealthExam"].length;i++){
									let table = '<tr><td>'+data["HealthExam"][i]["Weight"]+'</td><td>'+
									data["HealthExam"][i]["Height"]+'</td><td>'+
									data["HealthExam"][i]["wasistline"]+'</td><td>'+
									data["HealthExam"][i]["Naked_eye_R"]+'</td><td>'+
									data["HealthExam"][i]["Naked_eye_L"]+'</td><td>'+
									data["HealthExam"][i]["Corrected_R"]+'</td><td>'+
									data["HealthExam"][i]["Corrected_R"]+'</td><td>'+
									data["HealthExam"][i]["Color_Blindness"]+'</td><td>'+
									data["HealthExam"][i]["Hearing_Test"]+'</td></tr>';
									
									
									let table1 = '<tr><td>'+
									data["HealthExam"][i]["SBP"]+'</td><td>'+
									data["HealthExam"][i]["DBP"]+'</td><td>'+
									data["HealthExam"][i]["PRO"]+'</td><td>'+
									data["HealthExam"][i]["OB"]+'</td><td>'+
									data["HealthExam"][i]["WBC"]+'</td><td>'+
									data["HealthExam"][i]["Hb"]+'</td><td>'+
									data["HealthExam"][i]["GPT"]+'</td><td>'+
									data["HealthExam"][i]["Crea"]+'</td><td>'+
									data["HealthExam"][i]["T_CHO"]+'</td><td>'+
									data["HealthExam"][i]["TG"]+'</td><td>'+
									data["HealthExam"][i]["HDL"]+'</td><td>'+
									data["HealthExam"][i]["LDL"]+'</td><td>'+
									data["HealthExam"][i]["AC"]+'</td></tr>';
									table_basic = table_basic + table;
									table_advance = table_advance + table1;
								};
								$("#he1").html(table_basic);
								$("#he2").html(table_advance);
								
								// canvas1 的data
			            		let canvas1_data=[];
			            		for(let i=data["DMCrts"].length-1; i>=0;i--){
			            			canvas1_data[i]=data["DMCrts"][i]["Pulse_Rate"];
			            		};
			            		
			            		// canvas2 的data
			            		let canvas2_data=[];
			            		for(let i=data["DMCrts"].length-1; i>=0;i--){
			            			canvas2_data[i]=data["DMCrts"][i]["glucose"];
			            		};
			            		
			            		// canvas3 的data
			            		let canvas3_data1=[];
			            		for(let i=data["DMCrts"].length-1; i>=0;i--){
			            			canvas3_data1[i]=data["DMCrts"][i]["SBP"];
			            		};
			            		
			            		let canvas3_data2=[];
			            		for(let i=data["DMCrts"].length-1; i>=0;i--){
			            			canvas3_data2[i]=data["DMCrts"][i]["DBP"];
			            		};
			            		
			            		// canvas4 的data
			            		let canvas4_data=[];
			            		for(let i=data["DMCrts"].length-1; i>=0;i--){
			            			canvas4_data[i]=data["DMCrts"][i]["SpO2"];
			            		};
			            		
						        // 更新圖表
						        chart1.data.datasets[0].data = canvas1_data;
			            		chart1.update();
			            		chart2.data.datasets[0].data = canvas2_data;
			            		chart2.update();
			            		chart3.data.datasets[0].data = canvas3_data1;
			            		chart3.data.datasets[1].data = canvas3_data2;
			            		chart3.update();
			            		chart4.data.datasets[0].data = canvas4_data;
			            		chart4.update();
			            		
			            		setTimeout(function(){
						        	CommonLib.unblock("div_patient_dashboard");
						        },200);
			            },// success end  
			            error:
			                function(xhr, ajaxOptions, thrownError){
				            	alert("PatientsDetails Fail!"+xhr.status+"\n"+thrownError);
				            	setTimeout(function(){
						        	CommonLib.unblock("div_patient_dashboard");
						        },200);
			                }
			            
			        });return true
			        
			       
	
			}; // PatientsDetails end
 		});
</script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
