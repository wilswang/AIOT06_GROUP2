<%@ page language="java" contentType="text/html;charset=UTF-8"
	import="java.util.*,com.patientinfo.HealthcareBean"%>
<%!@SuppressWarnings("unchecked")%>
<!doctype html>
<html lang="en">
<jsp:include page="web_head.jsp">
	<jsp:param name="subTitle" value="Members Details"/>
</jsp:include>
<body onbeforeunload="window.location='./logout.jsp'">
	<div id="pagetop" style="visibility: hidden"></div>
	<% HealthcareBean ml = (HealthcareBean)request.getAttribute("ml");%>
	<%
			HealthcareBean DM = (HealthcareBean)request.getAttribute("DM");
		%>
	<%
		List<HealthcareBean> DMs = (ArrayList<HealthcareBean>)request.getAttribute("DMs");
	%>
	<%
		HealthcareBean DMLatest = (HealthcareBean)request.getAttribute("DMLatest");
	%>
	<%
		HealthcareBean pat = (HealthcareBean)request.getAttribute("pat");
	%>
	<%
		List<HealthcareBean> DMCrts = (ArrayList<HealthcareBean>)request.getAttribute("DMCrts");
	%>	
	
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
									<i class="pe-7s-users icon-gradient bg-happy-itmeo"> </i>
								</div>
								<div>
									Members Detail
									<div class="page-title-subheading">All members info can
										be checked here.</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xl-4"
						style="display: inline-block; width: 33.1%; padding-left: 0px;">
						<div class=" mb-3 widget-chart widget-chart2 text-left card">
							<div class="widget-content" style="padding-bottom:11px;">
								<div class="widget-content-outer">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">Patient No. <%=DM.getPatno()%></div>											
											<span class="widget-numbers mt-0 fsize-3 text-secondary"
												style="display: inline"> ${pat.pName}</span>
										</div>
									</div>
									<div style="display: flex; flex-direction: row;">
										<div class="widget-progress-wrapper">
											<img id="sex" class="PatientPic"
												style="width: 120px; height: 335px; margin-top: -10px; margin-left: 55px;">
										</div>
										<div class="widget-progress-wrapper"
											style="margin-left: 50px; position: relative;">
											<div class="widget-heading">Height</div>
											<span class="widget-numbers text-success"
												style="display: inline;"><%=pat.getHeight()%></span> <span
												class="widget-subheading text-success"
												style="display: inline;">cm</span>
										</div>
										<div class="widget-progress-wrapper"
											style="margin-left: 225px; margin-top: 145px; position: absolute;">
											<div class="widget-heading">Weight</div>
											<span class="widget-numbers text-success"
												style="display: inline;"><%=pat.getWeight()%></span> <span
												class="widget-subheading text-success"
												style="display: inline;">kg</span>
										</div>
										<div class="widget-progress-wrapper"
											style="margin-left: 225px; margin-top: 270px; position: absolute;">
											<div class="widget-heading">BMI</div>													
											<span id="BMI" class="widget-numbers text-success"
												style="display: inline;"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 詳細健康數據2 -->
					<div class="col-md-6 col-xl-4"
						style="display: inline-block; width: 33.1%">
						<div class=" mb-3 widget-chart widget-chart2 text-left card">
							<div class="widget-content">
								<div class="widget-content-outer">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">Pulse Rate</div>
											<span id="Pulse_Rate_num" class="widget-numbers mt-0 fsize-3"
												style="display: inline">${DMLatest.pulse_Rate}</span> <span
												class="widget-subheading"
												style="line-height: 20px; display: inline">bpm</span>
										</div>
									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress"
											style="margin-top: -10px;">
											<div id="Pulse_Rate" class="progress-bar" role="progressbar"
												aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"
												></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
									<hr style="margin: 17px 0px;">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">SBP</div>
											<span id="SBP_num" class="widget-numbers mt-0 fsize-3"
												style="display: inline">${DMLatest.SBP}</span> <span
												class="widget-subheading"
												style="line-height: 20px; display: inline">mmHg</span>
										</div>

									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress"
											style="margin-top: -10px;">
											<div id="SBP" class="progress-bar" role="progressbar"
												aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"
												></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
									<hr style="margin: 17px 0px;">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">DBP</div>
											<span id="DBP_num" class="widget-numbers mt-0 fsize-3"
												style="display: inline">${DMLatest.DBP}</span> <span
												class="widget-subheading"
												style="line-height: 20px; display: inline">mmHg</span>
										</div>

									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress"
											style="margin-top: -10px;">
											<div id="DBP" class="progress-bar" role="progressbar"
												aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"
												></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 詳細健康數據3 -->
					<div class="col-md-6 col-xl-4"
						style="display: inline-block; width: 33.1%; padding-right: 0px;">
						<div class=" mb-3 widget-chart widget-chart2 text-left card">
							<div class="widget-content">
								<div class="widget-content-outer">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">Blood Glucose</div>
											<span id="glucose_num" class="widget-numbers mt-0 fsize-3 "
												style="display: inline">${DMLatest.glucose}</span> <span
												class="widget-subheading"
												style="line-height: 20px; display: inline">mg/dL</span>
										</div>										
									</div>									
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress"
											style="margin-top: -10px;">
											<div id="glucose"class="progress-bar " role="progressbar"
												aria-valuenow="65" aria-valuemin="0" aria-valuemax="200"
												></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0</div>
											<div class="sub-label-right">200</div>
										</div>
									</div>
									<hr style="margin: 17px 0px;">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div class="widget-heading">SpO2</div>
											<span id="SpO2_num"class="widget-numbers mt-0 fsize-3"
												style="display: inline">${DMLatest.spO2}</span> <span
												class="widget-subheading"
												style="line-height: 20px; display: inline">%</span>
										</div>

									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs progress"
											style="margin-top: -10px;">
											<div id="SpO2"class="progress-bar" role="progressbar"
												aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"
												></div>
										</div>
										<div class="progress-sub-label">
											<div class="sub-label-left">0%</div>
											<div class="sub-label-right">100%</div>
										</div>
									</div>
									<hr style="margin: 17px 0px;">
									<div class="widget-content-wrapper">
										<div class="widget-content-left pr-2 fsize-1">
											<div  class="widget-heading">Cardiovascular Disease Status</div>
											<span id="cardio" class="widget-numbers mt-0 fsize-3 "
												style="display: inline">${ml.result}</span> 
										</div>

									</div>
									<div class="widget-progress-wrapper">
										<div class="progress-bar-xs "
											style="margin-top: -10px;height:16px;opacity: .5;">
											Please make an appointment immediately if the status shows "Danger"
										</div>
										<div class="progress-sub-label" style="height:20px">
											<div class="sub-label-left"></div>
											<div class="sub-label-right"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<ul
						class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
						<li class="nav-item"><a role="tab" class="nav-link active"
							id="tab-0" data-toggle="tab" href="#tab-content-0"> <span>History
									Data</span>
						</a></li>
						<li class="nav-item"><a role="tab" class="nav-link"
							id="tab-1" data-toggle="tab" href="#tab-content-1"> <span>History
									Charts</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane tabs-animation fade show active"
							id="tab-content-0" role="tabpanel">
							<div class="row">
								<div class="col-md-12">
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">History Data</h5>
											<table class="mb-0 table table-hover" style="text-align:center;">
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
												<tbody>
													<%for(int i = 0; i <DMs.size(); i++) { %>
													<tr>
														<th><%=(DMs.get(i)).getDate()%></th>
														<td><%=(DMs.get(i)).getPulse_Rate()%></td>
														<td><%=(DMs.get(i)).getSBP()%></td>
														<td><%=(DMs.get(i)).getDBP()%></td>
														<td><%=(DMs.get(i)).getGlucose()%></td>
														<td><%=(DMs.get(i)).getSpO2()%></td>
													</tr>
														<%}%>
												</tbody>
											</table>
										</div>
									</div>

								</div>
							</div>
	
						</div>
						<div class="tab-pane tabs-animation fade" id="tab-content-1"
							role="tabpanel">
							<div class="row">
								<div class="col-md-6">
                                     <div class="main-card mb-3 card">
                                        <div class="card-body"style="width:100%;">
                                            
                                            <h5 class="card-title" style="text-align:center">Pulse Rate</h5>
                                            <canvas id="PR" width="733" height="270"></canvas>
                                        </div>
                                    </div> 
                                    <div class="main-card mb-3 card">
                                        <div class="card-body">
                                            <h5 class="card-title" style="text-align:center">SBP</h5>
                                            <canvas id="Glu" width="733" height="270"></canvas>
                                        </div>
                                    </div>
                                </div>
								<div class="col-md-6">
                                    <div class="main-card mb-3 card">
                                        <div class="card-body">
                                            <h5 class="card-title" style="text-align:center">SBP/DBP</h5>
                                            <canvas id="BP" width="733" height="270"></canvas>
                                        </div>
                                    </div>
                                    <div class="main-card mb-3 card">
                                        <div class="card-body">
                                            <h5 class="card-title" style="text-align:center">SpO2</h5>
                                            <canvas id="Sp" width="733" height="270"></canvas>
                                        </div>
                                    </div>
                                </div>								
							</div>
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
<script>
	

    var config1 = {
        type: 'line',
        data: {
            labels: [
            	<% String x="";
			for (int i=DMCrts.size(); i>0;i--){
				x+="'"+i+"',";%>
			<%}%>
			<%=x%>
            	],
            datasets: [{
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: window.chartColors.red,
                data: [
                	<% String p="";
					for (int i=(DMCrts.size()-1); i>=0;i--){
						p+=DMCrts.get(i).getPulse_Rate()+",";%>
					<%}%>
					<%=p%>
                ],
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
                callbacks: {
                   label: function(tooltipItem) {
                          return tooltipItem.yLabel;
                   }
                }
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
                        labelString: 'bpm'
	               		},
               		ticks: {
	                    suggestedMin: 50,
	                    suggestedMax: 200,
	                    stepSize:20,
	                    padding:0
	                    }
                }]
            },
           }
    };
    var config2 = {
            type: 'line',
            data: {
                labels: [
	                <%=x%>
    			],
                datasets: [{
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: window.chartColors.red,
                    data: [
                    	<% String y="";
    					for (int i=(DMCrts.size()-1); i>=0;i--){
    						y+=DMCrts.get(i).getGlucose()+",";%>
    					<%}%>
    					<%=y%>
                    ],
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
                    callbacks: {
                       label: function(tooltipItem) {
                              return tooltipItem.yLabel;
                       }
                    }
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
                            labelString: 'mmHg'
    	               		},
                   		ticks: {
    	                    suggestedMin: 50,
    	                    suggestedMax: 200,
    	                    stepSize:20,
    	                    }
                    }]
                },
               }
        };
    var config3 = {
            type: 'line',
            data: {
                labels: [
                	<%=x%>
               	],
                datasets: [{
                    label:'SBP',
                	backgroundColor: window.chartColors.red,
                    borderColor: window.chartColors.red,
                    data: [
                    	<% String j="";
    					for (int i=(DMCrts.size()-1); i>=0;i--){
    						j+=DMCrts.get(i).getSBP()+",";%>
    					<%}%>
    					<%=j%>
                    ],
                    fill: false,
                }, {
                    fill: false,
                    label:'DBP',
                    backgroundColor: window.chartColors.blue,
                    borderColor: window.chartColors.blue,
                    data: [
                    	<% String k="";
    					for (int i=(DMCrts.size()-1); i>=0;i--){
    						k+=DMCrts.get(i).getDBP()+",";%>
    					<%}%>
    					<%=k%>
                    ],
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
                            labelString: 'mg/dL'
    	               		},
                   		ticks: {
    	                    suggestedMin: 50,
    	                    suggestedMax: 150,
    	                    stepSize:20,
    	                    padding:0
    	                    }
                    }]
                },
               }
        };
    var config4 = {
            type: 'line',
            data: {
                labels: [
                	<%=x%>
                ],
                datasets: [{
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: window.chartColors.red,
                    data: [
                    	<% String q="";
    					for (int i=(DMCrts.size()-1); i>=0;i--){
    						q+=DMCrts.get(i).getSpO2()+",";%>
    					<%}%>
    					<%=q%>
                    ],
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
                    callbacks: {
                       label: function(tooltipItem) {
                              return tooltipItem.yLabel;
                       }
                    }
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
                            labelString: 'percentage'
    	               		},
                   		ticks: {
    	                    suggestedMin: 60,
    	                    suggestedMax: 100,
    	                    stepSize:5,
    	                    }
                    }]
                },
               }
        };
    window.onload = function() {
        var ctx1 = document.getElementById('PR').getContext('2d');
        // ctx.fillRect(20,20,800,360);
        window.myLine = new Chart(ctx1, config1);
        var ctx2 = document.getElementById('Glu').getContext('2d');
        // ctx.fillRect(20,20,800,360);
        window.myLine = new Chart(ctx2, config2);
        var ctx3 = document.getElementById('BP').getContext('2d');
        // ctx.fillRect(20,20,800,360);
        window.myLine = new Chart(ctx3, config3);
        var ctx4 = document.getElementById('Sp').getContext('2d');
        // ctx.fillRect(20,20,800,360);
        window.myLine = new Chart(ctx4, config4);
        
        //連接Servlet之DB內容
		$("#sex").attr("src","./assets/images/"+"<%=pat.getGender()%>"+".png");
		//設定身高體重
		var WT='<%=pat.getWeight()%>';
		var HT='<%=pat.getHeight()%>';
		var BMI=parseInt(WT)/((parseInt(HT)**2)/10000);
		$("#BMI").text(BMI.toFixed(1));
		
		var PR=<%=DMLatest.getPulse_Rate()%>;
		$("#Pulse_Rate").attr("style","width:"+parseInt(PR)*100/200+"%");
		if (PR<60){
		$("#Pulse_Rate").addClass('bg-danger')
		$("#Pulse_Rate_num").addClass('text-danger')
		}else if(PR>=60 & PR<100){
		$("#Pulse_Rate").addClass('bg-success')
		$("#Pulse_Rate_num").addClass('text-success')
		}else if(PR>=100){
		$("#Pulse_Rate").addClass('bg-danger')
		$("#Pulse_Rate_num").addClass('text-danger')
		}

		var SBP=<%=DMLatest.getSBP()%>;
		$("#SBP").attr("style","width:"+parseInt(SBP)*100/200+"%");
		if (SBP<140){
		$("#SBP").addClass('bg-success')
		$("#SBP_num").addClass('text-success')
		}else if(SBP>=140 & SBP<180){
		$("#SBP").addClass('bg-warning')
		$("#SBP_num").addClass('text-warning')
		}else if(SBP>=180){
		$("#SBP").addClass('bg-danger')
		$("#SBP_num").addClass('text-danger')
		}

		var DBP=<%=DMLatest.getDBP()%>;
		$("#DBP").attr("style","width:"+parseInt(DBP)*100/200+"%");
		if (DBP<90){
		$("#DBP").addClass('bg-success')
		$("#DBP_num").addClass('text-success')
		}else if(DBP>=90 & DBP<120){
		$("#DBP").addClass('bg-warning')
		$("#DBP_num").addClass('text-warning')
		}else if(DBP>=120){
		$("#DBP").addClass('bg-danger')
		$("#SBP_num").addClass('text-danger')
		}

		var glucose=<%=DMLatest.getGlucose()%>;
		$("#glucose").attr("style","width:"+parseInt(glucose)*100/200+"%");
		if (glucose<100){
		$("#glucose").addClass('bg-success')
		$("#glucose_num").addClass('text-success')
		}else if(glucose>=100){
		$("#glucose").addClass('bg-danger')
		$("#glucose_num").addClass('text-danger')
		}

		var SpO2=<%=DMLatest.getSpO2()%>;
		$("#SpO2").attr("style","width:"+parseInt(SpO2)+"%");
		if (SpO2<85){
		$("#SpO2").addClass('bg-danger')
		$("#SpO2_num").addClass('text-danger')
		}else if(SpO2>=85 & SpO2<95){
		$("#SpO2").addClass('bg-warning')
		$("#SpO2_num").addClass('text-warning')
		}else if(SpO2>=95){
		$("#SpO2").addClass('bg-success')
		$("#SpO2_num").addClass('text-success')
		}
		
		var cardio="<%=ml.getResult()%>";
		if (cardio == "Safe"){
		$("#cardio").addClass('text-success')
		}else if(cardio == "Danger"){
		$("#cardio").addClass('text-danger')
		}
    };

    document.getElementById('randomizeData').addEventListener('click', function() {
        config.data.datasets.forEach(function(dataset) {
            dataset.data = dataset.data.map(function() {
                return randomScalingFactor();
            });

        });

        window.myLine.update();
    });

    var colorNames = Object.keys(window.chartColors);
    document.getElementById('addDataset').addEventListener('click', function() {
        var colorName = colorNames[config.data.datasets.length % colorNames.length];
        var newColor = window.chartColors[colorName];
        var newDataset = {
            label: 'Dataset ' + config.data.datasets.length,
            backgroundColor: newColor,
            borderColor: newColor,
            data: [],
            fill: false
        };

        for (var index = 0; index < config.data.labels.length; ++index) {
            newDataset.data.push(randomScalingFactor());
        }

        config.data.datasets.push(newDataset);
        window.myLine.update();
    });

    document.getElementById('addData').addEventListener('click', function() {
        if (config.data.datasets.length > 0) {
            var month = MONTHS[config.data.labels.length % MONTHS.length];
            config.data.labels.push(month);

            config.data.datasets.forEach(function(dataset) {
                dataset.data.push(randomScalingFactor());
            });

            window.myLine.update();
        }
    });

    document.getElementById('removeDataset').addEventListener('click', function() {
        config.data.datasets.splice(0, 1);
        window.myLine.update();
    });

    document.getElementById('removeData').addEventListener('click', function() {
        config.data.labels.splice(-1, 1); // remove the label first

        config.data.datasets.forEach(function(dataset) {
            dataset.data.pop();
        });

        window.myLine.update();
    });
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</body>
</html>