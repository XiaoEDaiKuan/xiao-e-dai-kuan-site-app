
$(document).ready(
    function(){
          $('#login_mobile_no').blur(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyMobile',
                                                                  type:'post',
                                                                  data:{mobileNo:$("#login_mobile_no").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                                  if(data=="fail1"){
                                                                  alert(data);
                                                                   $("#mobile_error").html("请输入标准手机号");
                                                                   $("#mobile_error").css('display','inline-block');
                                                                   //$(HTMLid).className = "wrong_box clearfix";
                                                                  // $('vcode_ok').style.display = "none";
                                                                
                                                                  }else if(data=="success"){
                                                                     // $(HTMLid).style.display = "none";
                                                                     // jQuery("#txtVerifyCode").removeClass("label_focus");     
                                                                     // $('vcode_ok').className = "tip_yes";
                                                                     // $('vcode_ok').style.display = "inline-block";
                                                                         
                                                                  }             
                                                                 }
                                                           }
                                                     );
                                                  
                                               }
                                   );
           }
    )
    
    
    
