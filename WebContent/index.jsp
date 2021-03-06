<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="emp" scope="session" class="com.userinfo.Empbean" />
<% String name = emp.getEname(), title = emp.getTitle(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Health Care</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Language" content="en">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="Shortcut Icon" type="image/x-icon" href="./assets/images/LogoIcon.ico" />
    <link rel="apple-touch-icon" href="./assets/images/LogoIcon.ico">
    <link rel="icon" href="./assets/images/LogoIcon.ico">
	<link href="assets/fonts/font-awesome5/css/all.css" rel="stylesheet" type="text/css"/>
	<link href="./assets/vendor/jquery/jquery-ui.css" rel="stylesheet" >
	<link href="./assets/vendor/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
	<link href="sidebar.css" rel="stylesheet">
	<link href="css/Style.css" rel="stylesheet">
	<link href="index_homepage.css" rel="stylesheet">	
	<link href="Edit_upload.css" rel="stylesheet">
	<link href="./assets/vendor/chartjs/Chart.css" rel="stylesheet">

</head>

<body> 
	<script type="text/javascript" src="./assets/vendor/jquery/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="./assets/vendor/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="./assets/vendor/jquery-loading/jquery.loading.js"></script>
	<script type="text/javascript" src="./assets/vendor/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./assets/vendor/chartjs/Chart.bundle.js"></script>
	<script type="text/javascript" src="./assets/scripts/CommonLib.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
	<script>
		function navigateToPage(pageName) {
		  $("#wrap_content").load(pageName); 		  
		};
		
		function navigateToPage2(patno,timerid) {
			$("#wrap_content").load('PatientsDetails.jsp',{'patno':patno});
			clearInterval(timerid);
		};
		
		//Idle detection
		var oTimeId;
		var mTimeId;
		var cTimeId;
		async function countDown(time){
			for(time;time>=0;time--){
				$("#countdown").html(time+'s');
				await new Promise(r => cTimeId=setTimeout(r, 1000));
			}
		}
		function Timeout(){
			location.href='./Logout.jsp';
		}
		function Msg(){
			
			const startTime = moment().format('hh:mm:ss');
			$("#msg").html('Idle is detected at '+startTime+'.<br/>If you are not in use, you will be logout after ')
			countDown(10);
			$("#myModal").modal('show');
		}
		function ReCalculate(){
			clearTimeout(oTimeId);
			clearTimeout(mTimeId);
			clearTimeout(cTimeId);
			mTimeId = setTimeout('Msg()',15000);
			oTimeId = setTimeout('Timeout()',25000);
			console.log('recalculate');
		}
		document.onmousedown = ReCalculate;
		document.onkeydown = ReCalculate;
		document.onmousewheel = ReCalculate;
		ReCalculate();
		
    </script>
	
	<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<div class="app-header header-shadow">
			<div class="app-header__logo">
				<img id="logo_text" src="./assets/images/HCLogoIcon.png" style="width:auto; height:56px;">
				<img id="logo_icon" src="./assets/images/LogoIcon.png" style="width:auto; height:56px; padding-left: 10px;">
				<div class="header__pane ml-auto">
					<div>
						<button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
							<span class="hamburger-box"> 
								<span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
			</div>
			<div class="app-header__mobile-menu">
				<div>
					<button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
						<span class="hamburger-box"> 
							<span class="hamburger-inner"></span>
						</span>
					</button>
				</div>
			</div>
			<div class="app-header__menu">
				<div class="header-btn-lg pr-0">
						<div class="widget-content p-0">
							<div class="widget-content-wrapper">
								<div class="widget-content-left">
									<div class="btn-group" style="color: #888888;margin-left: 10px;">
										<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
											<i class="fa fa-user fa-2x"></i>
											<i class="fa fa-angle-down ml-2 opacity-8"></i>
										</a>
										<div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right" style="z-index:999;">
											<button type="button" tabindex="0" class="dropdown-item" onclick="location.href='./user_account.jsp'">User Account: <%=name%> (<%=title%>)</button>
												<div tabindex="-1" class="dropdown-divider"></div>
											<button type="button" tabindex="0" class="dropdown-item" onclick="location.href='./Logout.jsp'">Logout</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- 				<span> -->
<!-- 					<button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav"> -->
<!-- 						<span class="btn-icon-wrapper">  -->
<!-- 							<i class="fa fa-ellipsis-v fa-w-6"></i> -->
<!-- 						</span> -->
<!-- 					</button> -->
<!-- 				</span> -->
			</div>
			<div class="app-header__content">
				<div class="app-header-right">
					<div class="header-btn-lg pr-0">
						<div class="widget-content p-0">
							<div class="widget-content-wrapper">
								
								<div class="widget-content-left  ml-3 header-user-info noselect">
									<div class="widget-heading"><%=name%></div>
									<div class="widget-subheading"><%=title%></div>
								</div>
								<div class="widget-content-left">
									<div class="btn-group" style="color: #888888;margin-left: 10px;">
										<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
											<i class="fa fa-user fa-2x"></i>
											<i class="fa fa-angle-down ml-2 opacity-8"></i>
										</a>
										<div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
											<button type="button" tabindex="0" class="dropdown-item" onclick="location.href='./user_account.jsp'">User Account</button>
												<div tabindex="-1" class="dropdown-divider"></div>
											<button type="button" tabindex="0" class="dropdown-item" onclick="location.href='./Logout.jsp'">Logout</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="app-main">
			<div class="app-sidebar sidebar-shadow">
				<div class="app-header__logo">
					<img src="./assets/images/HCLogo.png" style="width:auto; height:56px;">
					<div class="header__pane ml-auto">
						<div>
							<button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
								<span class="hamburger-box">
									<span class="hamburger-inner"></span>
								</span>
							</button>
						</div>
					</div>
				</div>
				<div class="app-header__mobile-menu">
					<div>
						<button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
							<span class="hamburger-box">
								<span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
				<div class="app-header__menu">
					<span>
						<button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
							<span class="btn-icon-wrapper">
								<i class="fa fa-ellipsis-v fa-w-6"></i>
							</span>
						</button>
					</span>
				</div>
				<div class="scrollbar-sidebar">
					<div class="app-sidebar__inner">
						<ul class="vertical-nav-menu">
							<li class="app-sidebar__heading">Homepage</li>
							<li onclick="navigateToPage('HomePage.jsp')"><a class="mm-active"><i class="fas fa-home"></i> <span>HomePage</span></a></li>
							<li class="app-sidebar__heading">Information</li>
							<li onclick="navigateToPage('Patients.jsp')"><a><i class="fas fa-user-friends"></i> <span>Patients</span></a></li>
							<li onclick="navigateToPage('Statistics.jsp')"><a><i class="fas fa-chart-bar"></i> <span>Statistics</span></a></li>
							<li class="app-sidebar__heading">Management</li>
							<li onclick="navigateToPage('File_management.jsp')"><a><i class="fas fa-paperclip"></i> <span>Upload files</span></a></li>
							<li onclick="navigateToPage('Edit_Pats.jsp')"><a><i class="fas fa-user-cog"></i> <span>Edit patients</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="wrap_content" class="app-main__outer">
				
				<jsp:include page="HomePage.jsp"/>
			</div>
		</div>
	</div>
	
<script>
	$(function(){
		$("ul.vertical-nav-menu li a").click(function(){
            $(this).addClass("mm-active").parent().siblings().children().removeClass("mm-active");
            $(".mobile-toggle-nav").removeClass("is-active");
            $(".sidebar-mobile-open").removeClass("sidebar-mobile-open");
        });
        
        $("button.close-sidebar-btn").click(function(){
	        $('.app-container').toggleClass("closed-sidebar");   
	        $(this).toggleClass("is-active");   
	    });
        
        $("div.app-header__mobile-menu").click(function(){
	        $('.mobile-toggle-nav').toggleClass("is-active");   
	        $('.app-container').toggleClass("sidebar-mobile-open");  
	    });
	})
</script>	
	<%@ include file="Dialog.jsp"%>
	<link href="./assets/vendor/jquery-loading/jquery.loading.min.css" rel="stylesheet" type="text/css"/>
</body>
</html>