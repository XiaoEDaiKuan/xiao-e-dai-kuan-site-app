$(document).ready(function(){

           var name_flag=false;
           var email_flag=false;
           var content_flag=false;
           var captcha_flag=false;
           
           $('#opinion_submit').click(
                                      function(){
                                                  $.ajax(
                                                            {
                                                                  url:'verifyCaptcha',
                                                                  type:'post',
                                                                  data:{captcha:$("#opinion_captcha").val()},
                                                                  dataType:"text",
                                                                  success: function(data){
                                                                    if(data=="fail"){
                                                                        $("#opinion_captcha_error").html("验证码错误");
                                                                        $("#opinion_captcha_error").css('display','inline-block');
                                                                        $("#opinion_captcha_error").addClass("wrong_box clearfix");
                                                                        $("#captchaimg").attr("src","handleCaptcha?time=" + (new Date()).getTime());
                                                                        captcha_flag=false;
                                                                    }else if(data=="success"){
                                                                        $("#opinion_captcha_error").html("");
                                                                        $("#opinion_captcha_error").css('display','none');
                                                                        $("#opinion_captcha_error").removeClass("wrong_box clearfix");
             
                                                                        captcha_flag=true;
                                                                        

                                                                    }             
                                                                  }
                                                            }
                                                     );

                                                  $('#opinion_name').blur();
                                                  $('#opinion_email').blur();
                                                  $('#opinion_content').blur();                                                                         
                                               
                                                if(name_flag && email_flag && content_flag && captcha_flag){

                                                     $("#opinion_form").submit();
                                                     
                                                }
                                                                                          
                                     }
                    )
                    
             $('#opinion_name').blur(
                                     function(){   
                                                    
                                                    if($.trim($("#opinion_name").val())==""){
                                                        $("#opinion_name_error").html("姓名不能为空");
                                                        $("#opinion_name_error").css('display','inline-block');
                                                        $("#opinion_name_error").addClass("wrong_box clearfix");
                                                        name_flag=false;
                                                     }else {
                                                        $("#opinion_name_error").html("");
                                                        $("#opinion_name_error").css('display','none');
                                                        $("#opinion_name_error").removeClass("wrong_box clearfix");
                                                        name_flag=true; 
                                                     }


                                     }
                    )
                    
             $('#opinion_email').blur(
                                     function(){   
                                                    
                                                    
                                                  
                                                  var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                  
                                                  email_flag=pattern.test($("#opinion_email").val());
                                                    
                                                    if(!email_flag){
                                                        $("#opinion_email_error").html("请输入正确的邮箱");
                                                        $("#opinion_email_error").css('display','inline-block');
                                                        $("#opinion_email_error").addClass("wrong_box clearfix");
                                                     }else {
                                                        $("#opinion_email_error").html("");
                                                        $("#opinion_email_error").css('display','none');
                                                        $("#opinion_email_error").removeClass("wrong_box clearfix");
                                                        email_flag=true;
                                                     }


                                     }
                    )
                    
             $('#opinion_content').blur(
                                     function(){   
                                                    
                                                    if($.trim($("#opinion_content").val())==""){
                                                        $("#opinion_content_error").html("反馈意见不能为空");
                                                        $("#opinion_content_error").css('display','inline-block');
                                                        $("#opinion_content_error").addClass("wrong_box clearfix");
                                                        content_flag=false;
                                                     }else {
                                                        $("#opinion_content_error").html("");
                                                        $("#opinion_content_error").css('display','none');
                                                        $("#opinion_content_error").removeClass("wrong_box clearfix");
                                                        content_flag=true;
                                                     }


                                     }
                    )






                  }
                  )