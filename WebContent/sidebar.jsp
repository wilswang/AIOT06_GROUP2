<script>
$(function(){
	$(".close-sidebar-btn").click(function(){
        $('.app-container').toggleClass("closed-sidebar");   
        $(this).toggleClass("is-active");   
    })
})
</script>
<div class="app-sidebar sidebar-shadow">
				<div class="app-header__logo">
					<img alt="Brand" src="./assets/images/HCLogo.png" style="width:auto; height:56px; max-width: 600px;">
					<div class="header__pane ml-auto">
						<div>
							<button type="button"
								class="hamburger close-sidebar-btn hamburger--elastic"
								data-class="closed-sidebar">
								<span class="hamburger-box"> <span
									class="hamburger-inner"></span>
								</span>
							</button>
						</div>
					</div>
				</div>
				<div class="app-header__mobile-menu">
					<div>
						<button type="button"
							class="hamburger hamburger--elastic mobile-toggle-nav">
							<span class="hamburger-box"> <span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
				<div class="app-header__menu">
					<span>
						<button type="button"
							class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
							<span class="btn-icon-wrapper"> <i
								class="fa fa-ellipsis-v fa-w-6"></i>
							</span>
						</button>
					</span>
				</div>
				<div class="scrollbar-sidebar">
					<div class="app-sidebar__inner">
						<ul class="vertical-nav-menu">
							<li class="app-sidebar__heading">Dashboard</li>
							<li><a href="./Getabnormal_detect" > 
								<i class="metismenu-icon pe-7s-culture"></i> HomePage</a></li>
							<li class="app-sidebar__heading">Information</li>
							<li><a href="./GetPatients"> 
								<i class="metismenu-icon pe-7s-users"></i> Members</a></li>
							<li><a href="./Statistics.jsp"> 
								<i	class="metismenu-icon pe-7s-graph2"> </i>Statistics</a></li>
							<li class="app-sidebar__heading">Management</li>
							<li><a href="./File_management.jsp"> 
								<i	class="metismenu-icon pe-7s-paperclip"></i> Upload files</a></li>
							<li><a href="./Edit_Pats.jsp"> 
								<i	class="metismenu-icon pe-7s-magic-wand"> </i>Edit members</a></li>
						
							
						</ul>
					</div>
				</div>
			</div>
	 
    