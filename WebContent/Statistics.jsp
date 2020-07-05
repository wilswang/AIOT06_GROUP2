<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
                    <div class="app-main__inner">
                        <div class="app-page-title">
                            <div class="page-title-wrapper">
                                <div class="page-title-heading">
                                    <div class="page-title-icon">
                                        <i class="fas fa-chart-bar">
                                        </i>
                                    </div>
                                    <div>Statistic
                                        <div class="page-title-subheading">Histogram
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content">
                                <div class="row">
					<div class="col-md-6">
						<div class="main-card mb-3 card">
							<div class="card-body" style="width: 100%;">
								<h5 class="card-title" style="text-align: center">Pulse Rate</h5>
								<canvas id="pulse_" width="733" height="270"></canvas>
							</div>
						</div>
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center">Glucose</h5>
								<canvas id="glu_" width="733" height="270"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center">SBP/DBP</h5>
								<canvas id="sd_bp" width="733" height="270"></canvas>
							</div>
						</div>
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center">SpO2</h5>
								<canvas id="sp_" width="733" height="270"></canvas>
							</div>
						</div>
					</div>
				</div>          
                                                        
                        </div>            
                    </div>                    
       
<script type="text/javascript"> 
	console.log("Here is Statistic");
	CommonLib.destroyAllBlock(); // 清除loading頁面
	function config(){
		let config_ = {
            type: 'bar',
            data: {
                labels: ["7","6","5","4","3","2","1"],
                datasets: [{
                    backgroundColor: '#0080FF',
                    borderColor: 	'#0080FF',
                    data: [],
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
                            labelString: '#'
    	               		},
                   		ticks: {
    	                    suggestedMin: 0,
    	                    suggestedMax: 10,
    	                    stepSize:2,
    	                    padding:0
    	                    }
                    }]
                },
            }};return config_;
    }; // config_ end
    
    initialChart();
    function initialChart(){
	    let ctx1 = document.getElementById('pulse_').getContext('2d');
		let chart1 = new Chart(ctx1, config());
		let ctx2 = document.getElementById('glu_').getContext('2d');
		let chart2 = new Chart(ctx2, config());
		let ctx3 = document.getElementById('sd_bp').getContext('2d');
		let chart3 = new Chart(ctx3, config());
		let ctx4 = document.getElementById('sp_').getContext('2d');
		let chart4 = new Chart(ctx4, config());
    };
    
	GetStatistics();
	
	/****call ajax fucntion and set the timer by setInterval****/
	//let timer_id = setInterval(function(){ GetStatistics(); }, 15000); //每15秒執行一次PatientsDetails
	
	//if(timer_id){
		//timer_id;  
		//console.log("timer_id: "+timer_id);
 	//};
	 	
 	//$(".vertical-nav-menu li:not(.app-sidebar__heading)").click(function(){
		//clearInterval(timer_id);
		//console.log('Clear Statistics: '+timer_id);
	//});
 	/****End****/
 	
 	/****call ajax fucntion and set the timer by setTimeout ****/
	//setTimeout(function(){GetStatistics()}, 5000);
 	
	function GetStatistics(){
		$.ajax({  
            type:"post",
            async: "false",
            url:"Statistics",   
            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
            //data : dataNo_,
            success:
                function(data){  
            		
            		// count of keys in json
            		let count = Object.keys(data).length;
           		    
            		// canvas 的data	
            		let canvas1_data=[]; //pulse rate
            		let canvas2_data=[]; //glucose
            		let canvas3_data=[]; //SBP DBP
            		let canvas4_data=[]; //SpO2
           			let j = 0;
           		    for(let i=count-1; i>=0; i--){
           		    	canvas1_data[j] = data[i]["Date"][0]["Pulse_Rate"];
           		    	canvas2_data[j] = data[i]["Date"][0]["glucose"];
           		    	canvas3_data[j] = data[i]["Date"][0]["sd_bp"];
           		    	canvas4_data[j] = data[i]["Date"][0]["SpO2"];
           		    	j++;
           		    };
            		
			        // 更新圖表
			        let ctx1 = document.getElementById('pulse_').getContext('2d');
					let chart1 = new Chart(ctx1, config());
			        chart1.data.datasets[0].data = canvas1_data;
            		chart1.update();
            		let ctx2 = document.getElementById('glu_').getContext('2d');
            		let chart2 = new Chart(ctx2, config());
            		chart2.data.datasets[0].data = canvas2_data;
            		chart2.update();
            		let ctx3 = document.getElementById('sd_bp').getContext('2d');
            		let chart3 = new Chart(ctx3, config());
            		chart3.data.datasets[0].data = canvas3_data;
            		chart3.update();
            		let ctx4 = document.getElementById('sp_').getContext('2d');
            		let chart4 = new Chart(ctx4, config());
            		chart4.data.datasets[0].data = canvas4_data;
            		chart4.update();
            },// success end  
            error:
                function(xhr, ajaxOptions, thrownError){
	            	alert("Statistics Get Data Fail!"+xhr.status+"\n"+thrownError);
                },
            complete:
            	function(){
	            	/****call ajax fucntion and set the timer by setTimeout ****/	
	            	//setTimeout(function(){GetStatistics()}, 5000);
            		//console.log("Complete!");
            	}
        });return true
	}
    
</script>
