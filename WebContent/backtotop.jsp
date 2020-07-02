<a href="" >
	<div class="backtotop">
		<button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
			
			<i class="fas fa-caret-up" style="font-size: 48px"></i>
		</button>
		<div class="theme-settings__inner">
			<div class="scrollbar-container"></div>
		</div>
	</div>
</a>
<script type="text/javascript">
$(function(){
	if($('.backtotop').length) {
	    var scrollTrigger = 150, // px
	        backToTop = function () {
	            var scrollTop = $(window).scrollTop();
	            if (scrollTop > scrollTrigger) {
	                $('.backtotop').show();
	            } else {
	                $('.backtotop').hide();
	            }
	        };
	    backToTop();
	    $(window).on('scroll', function () {
	        backToTop();
	    });
	    $('.backtotop').on('click', function (e) {
	        e.preventDefault();
	        $('html,body').animate({
	            scrollTop: 0
	        }, 700);
	    });
	}

})
</script>