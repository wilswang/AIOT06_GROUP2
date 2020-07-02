
<!-- 最上面的header bar -->
<div class="app-header header-shadow">
	<div class="app-header__logo">
<!-- 		<div class="logo-src"></div> -->
			<img src="./assets/images/HCLogo.png" style="width:auto; height:56px;">
		<div class="header__pane ml-auto">
			<div>
				<button type="button" 
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> 
						<span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box"> 
					<span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__menu">
		<span>
			<button type="button"
				class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
				<span class="btn-icon-wrapper"> 
					<i class="fa fa-ellipsis-v fa-w-6"></i>
				</span>
			</button>
		</span>
	</div>
	<div class="app-header__content">
		
		<div class="app-header-right">
			<div class="header-btn-lg pr-0">
				<div class="widget-content p-0">
					<div class="widget-content-wrapper">
						<div class="widget-content-left">
							<div class="btn-group">
								<a data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" class="p-0 btn"> 
									<i class="fa fa-angle-down ml-2 opacity-8"></i>
								</a>
								<div tabindex="-1" role="menu" aria-hidden="true"
									class="dropdown-menu dropdown-menu-right">

									<button type="button" tabindex="0" class="dropdown-item"
										onclick="location.href='./user_account.jsp'">User
										Account</button>

									<div tabindex="-1" class="dropdown-divider"></div>

									<button type="button" tabindex="0" class="dropdown-item"
										onclick="location.href='./Logout.jsp'">
										Logout</button>
								</div>
							</div>
						</div>
						<div class="widget-content-left  ml-3 header-user-info">
							<jsp:useBean id="emp" scope="session" class="com.userinfo.Empbean" />
							<%
								String name = emp.getEname(), title = emp.getTitle();
							%>
							<div class="widget-heading">
								<%=name%>
							</div>
							<div class="widget-subheading">
								<%=title%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script  src="https://code.jquery.com/jquery-3.5.1.js"  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="  crossorigin="anonymous"></script>
<script>
$(function(){             
    $("div.btn-group").click(function(){
    	$("div.btn-group, div.dropdown-menu").toggleClass("show");
    	
    });            
});
</script>
		