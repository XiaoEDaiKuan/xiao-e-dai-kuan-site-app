
$(document).ready(function(){


           $('#login_form_submit').click(
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
                                                                  }else if(data=="success"){
                                                                     $("#login_form_captcha_error").html("");
                                                                     $("#login_form_captcha_error").css('display','none');
                                                                     $("#login_form_captcha_error").removeClass("wrong_box clearfix");
             
                                                                     $("#login_form_2").submit();

                                                                  }             
                                                                 }
                                                           }
                                                     );
                                               }
                                   );



})