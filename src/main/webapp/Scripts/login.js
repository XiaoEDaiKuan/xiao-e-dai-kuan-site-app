var mobile_falg=false;
var cust_name_flag=false;
var passwd_flag=false;
var passwd2_flag=false;
var idno_flag=false;
var email_flag=false;
var captcha_flag=false;
var term_flag=true;


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
                                                                  if(data=="success"){
                                                                     $("#mobile_error").html("");
                                                                     $("#mobile_error").css('display','none');
                                                                     $("#mobile_error").removeClass("wrong_box clearfix");
                                                                     $("#mobile_ok").css('display','inline-block');      
                                                                     mobile_falg=true; 
                                                                  }else if(data=="fail2"){
                                                                     $("#mobile_error").html("此手机号码已经存在，如有问题请联系客服人员");
                                                                     $("#mobile_error").css('display','inline-block');
                                                                     $("#mobile_error").addClass("wrong_box clearfix");
                                                                     $("#mobile_ok").css('display', 'none');
                                                                     mobile_falg=false;
                                                                  }else {
                                                                     $("#mobile_error").html("请输入标准手机号");
                                                                     $("#mobile_error").css('display','inline-block');
                                                                     $("#mobile_error").addClass("wrong_box clearfix");
                                                                     $("#mobile_ok").css('display', 'none');
                                                                      mobile_falg=false;
                                                                  }             
                                                                 }
                                                           }
                                                     );
                                                     
                                                  
                                               }
                                   );
                                   
                                   
             $('#login_custname').blur(
                                      function(){
                                                  var flag1=false;
                                                  var len=$("#login_custname").val().replace(/[^\x00-\xff]/g,"**").length;
                                                  if(len>=4 && len<=10){
                                                    flag1=true;
                                                  }else {
                                                    flag1=false;
                                                  }
                                                  
                                                  var pattern = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi;
                                                  var flag2=pattern.test($("#login_custname").val());
                                                  if(flag1 && flag2){
                                                  	  $("#custname_ok").css('display','inline-block');      
                                                     $("#custname_error").css('display','none');
                                                     $("#custname_error").removeClass("wrong_box clearfix");
                                                     $("#custname_error").html("");
                                                     cust_name_flag=true;  
                                                  }else{
                                                     $("#custname_ok").css('display','none');
                                                     $("#custname_error").css('display','inline-block');
                                                     $("#custname_error").addClass("wrong_box clearfix");
                                                     $("#custname_error").html("请输入2-5个汉字");
                                                     cust_name_flag=false;  
                                                  }
                                                  
                                               }
                                   );
             $('#login_passwd').blur(
                                      function(){
                                                      var password = $("#login_passwd").val();
                                                      $("#passwd_error").html("密码为6-18个字符,可由英文、数字及符号组成");
                                                      $("#passwd_error").css("display","inline-block");
                                                     if (password == '') {
                                                                           $("#passwd_error").html("密码不能为空,请重新输入");
                                                                           $("#passwd_error").addClass("wrong_box clearfix");
                                                                           $('#passwd_ok').css("display","none");
                                                                           passwd_flag=false;
                                                                           return;
                                                      }
      
                                                     if (!/^(\S){1,}$/.test(password)) {
                                                                           $("#passwd_error").html("密码不能包含“空格”,请重新输入");
                                                                           $("#passwd_error").addClass("wrong_box clearfix");
                                                                           $('#passwd_ok').css("display","none");
                                                                           passwd_flag=false;
                                                                           return false;
                                                      }
              
                                                     if (password.length < 6 || password.length > 18) {
                                                                           $("#passwd_error").html("<span>密码长度6-18个字符,请重新输入</span>");
                                                                           $("#passwd_error").addClass("wrong_box clearfix");
                                                                           $('#passwd_ok').css("display","none");
                                                                           passwd_flag=false;
                                                                           return false;
                                                      }
                                                     if (!/^\S{1,18}$/.test(password)) {
                                                               $("#passwd_error").html("<span>密码长度6-18个字符,请重新输入</span>");
                                                               $("#passwd_error").addClass("wrong_box clearfix");
                                                               $('#passwd_ok').css("display","none");
                                                               passwd_flag=false;
                                                               return false;
                                                     }
                                                       $('#passwd_ok').css("display","inline-block");
                                                       $("#passwd_error").html("");
                                                       $("#passwd_error").removeClass("wrong_box clearfix");
                                                       passwd_flag=true;
                                                       return true;
                                                }
                                   );
             $('#login_passwd2').blur(
                                      function(){
                                                      var passwd1 = $("#login_passwd").val();
                                                      var passwd2 = $("#login_passwd2").val();
                                                      if(passwd1 != passwd2){
                                                               $("#passwd_error").html("<span>两次密码输入不一致,请重新输入</span>");
                                                               $("#passwd_error").addClass("wrong_box clearfix");
                                                               $('#passwd_ok').css("display","none");
                                                               passwd2_flag=false;
                                                               return false;
                                                      } 
                                                       $('#passwd_ok').css("display","inline-block");
                                                       $("#passwd_error").html("");
                                                       $("#passwd_error").removeClass("wrong_box clearfix");
                                                       passwd2_flag=true;
                                                       return true;
                                                 }
                                   );

           $('#login_idno').blur(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyIdNo',
                                                                  type:'post',
                                                                  data:{idNo:$("#login_idno").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                                    if(data=="success"){
                                                                        $("#idno_error").html("");
                                                                        $("#idno_error").css('display','none');
                                                                        $("#idno_error").removeClass("wrong_box clearfix");
                                                                        $("#idno_ok").css('display','inline-block');
                                                                        idno_flag=true;      
                                                                     }  else if(data=="fail2"){
                                                                        $("#idno_error").html("此身份证号已经存在，如有问题请联系客服人员");
                                                                        $("#idno_error").css('display','inline-block');
                                                                        $("#idno_error").addClass("wrong_box clearfix");
                                                                        $("#idno_ok").css('display', 'none');
                                                                        idno_flag=false;
                                                                     } else {
                                                                        $("#idno_error").html("请输入正确的身份证号");
                                                                        $("#idno_error").css('display','inline-block');
                                                                        $("#idno_error").addClass("wrong_box clearfix");
                                                                        $("#idno_ok").css('display', 'none');
                                                                        idno_flag=false;
                                                                     }           
                                                                 }
                                                           }
                                                     );
                                                     
                                                  
                                               }
                                   );
           $('#login_email').blur(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyEmail',
                                                                  type:'post',
                                                                  data:{email:$("#login_email").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                                  if(data=="success"){
                                                                     $("#email_error").html("");
                                                                     $("#email_error").css('display','none');
                                                                     $("#email_error").removeClass("wrong_box clearfix");
                                                                     $("#email_ok").css('display','inline-block');
                                                                     email_flag=true;      
                                                                  }else if(data=="fail2"){
                                                                     $("#email_error").html("此电子邮箱已经存在，如有问题请联系客服人员");
                                                                     $("#email_error").css('display','inline-block');
                                                                     $("#email_error").addClass("wrong_box clearfix");
                                                                     $("#email_ok").css('display', 'none');
                                                                     email_flag=false;
                                                                  } else {
                                                                     $("#email_error").html("请输入正确的电子邮箱");
                                                                     $("#email_error").css('display','inline-block');
                                                                     $("#email_error").addClass("wrong_box clearfix");
                                                                     $("#email_ok").css('display', 'none');
                                                                     email_flag=false;
                                                                  }             
                                                                 }
                                                           }
                                                     );
                                                     
                                                  
                                               }
                                   );

           $('#login_captcha').blur(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyCaptcha',
                                                                  type:'post',
                                                                  data:{captcha:$("#login_captcha").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                                  if(data=="fail"){
                                                                     $("#captcha_error").html("验证码错误");
                                                                     $("#captcha_error").css('display','inline-block');
                                                                     $("#captcha_error").addClass("wrong_box clearfix");
                                                                     $("#captcha_ok").css('display', 'none');
                                                                     $("#captchaimg").attr("src","handleCaptcha?time=" + (new Date()).getTime());
                                                                     captcha_flag=false;
                                                                  }else if(data=="success"){
                                                                     $("#captcha_error").html("");
                                                                     $("#captcha_error").css('display','none');
                                                                     $("#captcha_error").removeClass("wrong_box clearfix");
                                                                     $("#captcha_ok").css('display','inline-block');
                                                                     captcha_flag=true;      
                                                                  }             
                                                                 }
                                                           }
                                                     );
                                               }
                                   );
        
           $('#login_term').click(
                                      function(){
                                                 
                                                 if($("#login_term").is(":checked")==false){
                                                       $("#term_error").html("您必须同意该条款才能注册");
                                                       $("#term_error").css('display','inline-block');
                                                       $("#term_error").addClass("wrong_box clearfix");
                                                       term_flag=true;
                                                 }else {
                                                       $("#term_error").html("");
                                                       $("#term_error").css('display','none');
                                                       $("#term_error").removeClass("wrong_box clearfix");
                                                       term_flag=true;
                                                 }
                                                 
                                               }
                                   );
                                   
            $('#login_submit').click(
                                    function(){
                                        
                                                 if(mobile_falg && cust_name_flag &&  passwd_flag &&  passwd2_flag 
                                                     &&  idno_flag &&  email_flag &&  captcha_flag && term_flag)
                                                  {
                                                    $('#login_form').submit();

                                                 }
                                          
            
                                              }
                                  );        
           }
           
    )
    
    
    
