
$(document).ready(function(){

                             var flag=false;
                             
                             $('#login_form_captcha').blur(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyCaptcha',
                                                                  type:'post',
                                                                  data:{captcha:$("#login_form_captcha").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                            
                                                                  if(data=="fail"){
                                                                     $("#login_form_captcha_error").html("验证码错误");
                                                                     $("#login_form_captcha_error").css('display','inline-block');
                                                                     $("#login_form_captcha_error").addClass("wrong_box clearfix");
                                                                     $("#captchaimg").attr("src","handleCaptcha?time=" + (new Date()).getTime());
                                                                     flag=false;
                                                                  }else if(data=="success"){
                                                                     flag=true;  
                                                                     $("#login_form_captcha_error").html("");
                                                                     $("#login_form_captcha_error").css('display','none');
                                                                     $("#login_form_captcha_error").removeClass("wrong_box clearfix");

                                                                  }             
                                                                 }
                                                           }
                                                     );
                                           }
                                     );

            $('#login_form_submit').click(
                                       function(){
                                
                                            
                                                if( $("#login_form_captcha").val()==''  ){
                                                    $("#login_form_captcha_error").html("验证码错误");
                                                    $("#login_form_captcha_error").css('display','inline-block');
                                                    $("#login_form_captcha_error").addClass("wrong_box clearfix");
                                                    $("#captchaimg").attr("src","handleCaptcha?time=" + (new Date()).getTime());
 
                                                   return;
                                                }

                                                if( $("#logonName").val()=='' || $("#passwd").val()=='' ){
                                                    $("#logonName_error").html("账号或密码错误");
                                                    $("#logonName_error").css('display','inline-block');
                                                    $("#logonName_error").addClass("wrong_box clearfix");
 
                                                   return;
                                                }
                                                     
                                                     if(flag){
                                                         $("#login_form_2").submit();
                                                     }
                                               }
                                   );



})