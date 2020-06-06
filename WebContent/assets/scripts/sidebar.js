$(function(){
            $(".vertical-nav-menu li a").click(function(){ 
                $(this).addClass("mm-active").parent().siblings().children().removeClass();
                
            });
        });