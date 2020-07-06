<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="app-main__inner">
     <div class="app-page-title">
         <div class="page-title-wrapper">
             <div class="page-title-heading">
                 <div class="page-title-icon">
                     <i class="fas fa-paperclip"></i>
                 </div>
                 <div>Upload Files
                     <div class="page-title-subheading">the uploaded files should follow specific format</div>
                 </div>
             </div>
         </div>
     </div>
     <div class="row">
         <div class="col-md-12 ">
             <div class="main-card mb-3 card add_container1">
                 <!-- 上傳健檢資料程式碼 -->
                 <form enctype="multipart/form-data" id="form_upload" method="post" action="" style="margin-top:15px;">
                 	<div class="container">
                     	<h2 style="text-align:center" id="upload_result"></h2>
                     	<label for="healthcheck"><b>Healthcheck File</b></label><br>
                     	<input type="file" id="upload_file" placeholder="Please upload .csv file" name="healthcheck" required="required" accept=".csv" onchange="checkfile(this);"><br>
                     	<button type="submit">Submit</button>
                    	<button type="reset" class="cancelbtn"  onclick="navigateToPage('File_management.jsp')">Clear</button>
					</div>
					<div class="add_container" style="background-color:#f1f1f1"></div>
                 </form> 
             </div>
         </div>                                
     </div>
 </div>


<script type="text/javascript">
	CommonLib.destroyAllBlock(); // 清除loading頁面    

	function checkfile(sender){
      // 可接受的附檔名
      var validExts = new Array(".csv");
      var fileExt = sender.value;
      fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
      if (validExts.indexOf(fileExt) < 0) {
        alert("檔案類型錯誤，可接受的副檔名有：" + validExts.toString());
        sender.value = null;
        return false;
      }
      else return true;
    };
</script>
<script type="text/javascript">
$(function(){
	$("#form_upload").submit(function(event) {  
		event.preventDefault();
		let fd = new FormData($("#form_upload")[0]);
		$.ajax({  
	            type:"post", 
	            url:"UploadFile",
	            processData: false, // important
	            contentType: false, // important
	            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
	            data : fd,
	            success:
	                function(data){              			
		            	$("#upload_result").text("Upload Successfully!");	
		            	console.log(data);
	            	},  
	            error:
	                function(xhr, ajaxOptions, thrownError){
	            	$("#upload_result").text("Upload Fail!");    
	            	alert("Upload Fail!"+xhr.status+"\n"+thrownError);
	                }
	        });  
	    });
});
</script>
   