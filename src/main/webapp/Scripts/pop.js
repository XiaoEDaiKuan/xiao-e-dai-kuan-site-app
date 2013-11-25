function showDiv(){
	document.getElementById('popDiv').style.display='block';
	document.getElementById('popIframe').style.display='block';
	document.getElementById('bg').style.display='block';
}
function closeDiv(){
	document.getElementById('popDiv').style.display='none';
	document.getElementById('bg').style.display='none';
	document.getElementById('popIframe').style.display='none';
}

var   cust_name_flag=false;  
var   mobile_falg=false;

$(document).ready(

    function(){
              $('#custName').blur(
                                      function(){
                                                  var flag1=false;
                                                  var len=$("#custName").val().replace(/[^\x00-\xff]/g,"**").length;
                                                  if(len>=4 && len<=10){
                                                    flag1=true;
                                                  }else {
                                                    flag1=false;
                                                  }
                                                  
                                                  
                                                  var pattern = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi;
                                                  var flag2=pattern.test($("#custName").val());
                                                  if(flag1 && flag2){
                                                  	  $("#custName_ok").css('display','inline-block');      
                                                     $("#custName_error").css('display','none');
                                                     $("#custName_error").removeClass("wrong_box clearfix");
                                                     $("#custName_error").html("");
                                                     cust_name_flag=true;  
                                                  }else{
                                                     $("#custName_ok").css('display','none');
                                                     $("#custName_error").css('display','inline-block');
                                                     $("#custName_error").addClass("wrong_box clearfix");
                                                     $("#custName_error").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请输入2-5个汉字 ");
                                                     cust_name_flag=false;
                                                     
                                                  }
                
                                      }
              );                        
              $('#mobileNO').blur(
                                      function(){
                                                  var   pattern = /^1[3|4|5|8][0-9]\d{8}$/;
                                      
                                                    mobile_falg=pattern.test($("#mobileNO").val());
                                               
                                                    if(!mobile_falg){
                                               
                                                        $("#mobileNO_error").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入正确的手机号码");
                                                        $("#mobileNO_error").css('display','inline-block');
                                                        $("#mobileNO_error").addClass("wrong_box");
                                                        mobile_falg=false;
                                                     }else {
                                                        $("#mobileNO_error").html("");
                                                        $("#mobileNO_error").css('display','none');
                                                        $("#mobileNO_error").removeClass("wrong_box clearfix");
                                                        mobile_falg=true;
                                                     }
                                      
                                      }
             );                           

    }
  )

function saveCreditCust() {

                                                  
                                               if( !mobile_falg || !cust_name_flag){
                                                  return;
                                               }


	$.ajax({
		url :'createCreditCust',
		type :'post',
		data: {
			custName: $("#custName").val(), 
			mobileNO: $("#mobileNO").val()
		},
		dataType: "text",
		success: function (data) {
			if (data == "success") {
				$("#myPopFont").html("提交成功！");
				$("#myPopPrg").html("9F云金融客服代表会尽快联系您。");
				showDiv();
			} else {
				$("#myPopFont").html("提交失败！");
				$("#myPopPrg").html(" ");
				showDiv();
			}
		}
	});
}
