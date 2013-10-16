

$(document).ready(
    function(){

          var cust_edit_tel_falg=false;
          var cust_edit_email_flag=false;

          $('#cust_edit_tel').blur(
                                      function(){

                                                   var pattern = /^1[3|4|5|8][0-9]\d{8}$/;
                                                  
                                                    cust_edit_tel_flag=pattern.test($("#cust_edit_tel").val());
                                               
                                                    if(!cust_edit_tel_flag){
                                                        $("#cust_edit_tel_error").html("请输入正确的手机号码");
                                                        $("#cust_edit_tel_error").css('display','inline-block');
                                                        $("#cust_edit_tel_error").addClass("wrong_box");
                                                     }else {
                                                        $("#cust_edit_tel_error").html("");
                                                        $("#cust_edit_tel_error").css('display','none');
                                                        $("#cust_edit_tel_error").removeClass("wrong_box clearfix");
                                                        cust_edit_tel_falg=true;
                                                     }
                                               }
                                   );
                                   
                                   
           $('#cust_edit_email').blur(
                                      function(){

                                                  var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                  
                                                  cust_edit_email_flag=pattern.test($("#cust_edit_email").val());
                                                    
                                                    if(!cust_edit_email_flag){
                                                        $("#cust_edit_email_error").html("请输入正确的邮箱");
                                                        $("#cust_edit_email_error").css('display','inline-block');
                                                        $("#cust_edit_email_error").addClass("wrong_box clearfix");
                                                     }else {
                                                        $("#cust_edit_email_error").html("");
                                                        $("#cust_edit_email_error").css('display','none');
                                                        $("#cust_edit_email_error").removeClass("wrong_box clearfix");
                                                        cust_edit_email_flag=true;
                                                     }
                                                  
                                               }
                                   );

            $('#cust_edit_submit').click(
                                    function(){
                                                 $('#cust_edit_tel').blur();
                                                 $('#cust_edit_email').blur();
                                        
                                                 if(cust_edit_tel_falg && cust_edit_email_flag )
                                                  {
                                                    $('#cust_edit_form').submit();

                                                 }
                                          
            
                                              }
                                  );        
           }
           
    )
    
    
    
