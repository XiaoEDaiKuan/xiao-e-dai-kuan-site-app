$(document).ready(function(){

           
           var email_flag=false;
           var captcha_flag=false;
           
           $('#question_submit').click(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyCaptcha',
                                                                  type:'post',
                                                                  data:{captcha:$("#question_captcha").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                                    if(data=="fail"){
                                                                        $("#question_captcha_error").html("验证码错误");
                                                                        $("#question_captcha_error").css('display','inline-block');
                                                                        $("#question_captcha_error").addClass("wrong_box clearfix");
                                                                        $("#captchaimg").attr("src","handleCaptcha?time=" + (new Date()).getTime());
                                                                        captcha_flag=false;
                                                                    }else if(data=="success"){
                                                                        $("#question_captcha_error").html("");
                                                                        $("#question_captcha_error").css('display','none');
                                                                        $("#question_captcha_error").removeClass("wrong_box clearfix");
             
                                                                        captcha_flag=true;
                                                                        

                                                                    }             
                                                                  }
                                                            }
                                                     );

                                                  $('#question_email').blur();
                                               
                                                if( email_flag &&  captcha_flag){

                                                     $("#question_form").submit();
                                                     
                                                }
                                                                                          
                                     }
                    )
                    
                    
             $('#question_email').blur(
                                     function(){   
                                                    
                                                    
                                                  
                                                  var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                  
                                                  email_flag=pattern.test($("#question_email").val());
                                                    alert(email_flag);
                                                    if(!email_flag){
                                                        $("#question_email_error").html("请输入正确的邮箱");
                                                        $("#question_email_error").css('display','inline-block');
                                                        $("#question_email_error").addClass("wrong_box clearfix");
                                                     }else {
                                                        $("#question_email_error").html("");
                                                        $("#question_email_error").css('display','none');
                                                        $("#question_email_error").removeClass("wrong_box clearfix");
                                                        email_flag=true;
                                                     }


                                     }
                    )

                  }
                  )