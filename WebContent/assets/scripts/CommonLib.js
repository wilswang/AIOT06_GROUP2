var CommonLib = {

	block: function (elementID,type) {
		var content="";
        switch(type){
            case "load":
                content = "<i class='fa fa-spinner fa-pulse fa-lg'></i> "+ "Loading";
                break;
            case "wait":
                content = "<i class='fa fa-spinner fa-pulse fa-lg'></i> "+ "Please Wait";
                break;
            default:
                content = "<i class='fa fa-spinner fa-pulse fa-lg'></i> "+ "Loading";
                break;
        }
        $('#'+elementID).loading({message:content});
    },
    
    udblock: function (elementID,msg) {
    	var content="";
        content = "<i class='fa fa-spinner fa-pulse fa-lg'></i> "+ msg;
        $('#'+elementID).loading({message:content});
    },
    
    unblock: function (elementID) {
    	$('#'+elementID).loading('destroy');
    },
    
    destroyAllBlock: function () {
    	setTimeout(function(){
            $("#div_patient_dashboard").each(function(index,entry){
                $(entry).remove();
            });

            $("#div_patient_dashboard").each(function(index,entry){
                $(entry).remove();
            });
        },300);
    },
}