$(document).ready(function(){

           
           var email_flag=false;
           
           $('#product_email_submit').click(
                                      function(){
                                                  $('#product_email').blur();
                                               
                                                if( email_flag){

                                                     $("#product_email_form").submit();
                                                     
                                                }
                                                                                          
                                     }
                    )
                    
                    
             $('#product_email').blur(
                                     function(){   
                                                    
                                                  var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                  
                                                  email_flag=pattern.test($("#product_email").val());
                                               
                                                    if(!email_flag){
                                                        $("#product_email_error").html("请输入正确的邮箱");
                                                        $("#product_email_error").css('display','inline-block');
                                                        $("#product_email_error").addClass("wrong_box");
                                                     }else {
                                                        $("#product_email_error").html("");
                                                        $("#product_email_error").css('display','none');
                                                        $("#product_email_error").removeClass("wrong_box clearfix");
                                                        email_flag=true;
                                                     }


                                     }
                    )

                  }
                  )