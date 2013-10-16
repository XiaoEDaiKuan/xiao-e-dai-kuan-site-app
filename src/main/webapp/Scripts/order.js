$(document).ready(function(){

           
           var loan_amt_flag=false;
           var order_cust_name_flag=false;
           var order_cust_tel_flag=false;
           
           $('#loan_submit_button').click(
                                      function(){
                                                  $('#loan_amt').blur();
                                                  $('#loan_issue').blur();
                                               
                                                if( loan_amt_flag &&  loan_issue_flag){

                                                     $("#loan_form").submit();
                                                     
                                                }
                                                                                          
                                     }
                    );
                    
                    
             $('#loan_amt').blur(
                                     function(){   

                                                       
                                                   var pattern = /^(([1-9]\d*)|0)(\.\d{1,2})?$/;
                                                  
                                                  loan_amt_flag=pattern.test($("#loan_amt").val());
                                               
                                                    if(!loan_amt_flag){
                                                        $("#loan_amt_error").html("请输入正确的贷款金额");
                                                        $("#loan_amt_error").css('display','inline-block');
                                                        $("#loan_amt_error").addClass("wrong_box");
                                                     }else {
                                                        $("#loan_amt_error").html("");
                                                        $("#loan_amt_error").css('display','none');
                                                        $("#loan_amt_error").removeClass("wrong_box clearfix");
                                                        loan_amt_flag=true;
                                                     }

                                     }
                    );

             $('#loan_issue').blur(
                                     function(){   
                                                   var pattern = /^[1-9]\d*$/;
                                                  
                                                  loan_issue_flag=pattern.test($("#loan_issue").val());
                                               
                                                    if(!loan_issue_flag){
                                                        $("#loan_issue_error").html("请输入正确的贷款期限");
                                                        $("#loan_issue_error").css('display','inline-block');
                                                        $("#loan_issue_error").addClass("wrong_box");
                                                     }else {
                                                        $("#loan_issue_error").html("");
                                                        $("#loan_issue_error").css('display','none');
                                                        $("#loan_issue_error").removeClass("wrong_box clearfix");
                                                        loan_issue_flag=true;
                                                     }
                                      
                                         }
                    );

             $('#order_cust_name').blur(
                                     function(){   
                                                   
                                                   
                                                  var flag1=false;
                                                  var len=$("#order_cust_name").val().replace(/[^\x00-\xff]/g,"**").length;
                                                  if(len>=4 && len<=10){
                                                    flag1=true;
                                                  }else {
                                                    flag1=false;
                                                  }
                                                  
                                                  var pattern = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi;
                                                  var flag2=pattern.test($("#order_cust_name").val());
                                                  if(flag1 && flag2){
                                                        $("#order_cust_name_error").html("");
                                                        $("#order_cust_name_error").css('display','none');
                                                        $("#order_cust_name_error").removeClass("wrong_box clearfix");
                                                        order_cust_name_flag=true;
                                                  }else{
                                                        $("#order_cust_name_error").html("请输入2-5个汉字");
                                                        $("#order_cust_name_error").css('display','inline-block');
                                                        $("#order_cust_name_error").addClass("wrong_box");
                                                        order_cust_name_flag=false;
                                                  }
                                                  
                                         }
                    );
             $('#order_cust_tel').blur(
                                     function(){   

                                                   var pattern = /^1[3|4|5|8][0-9]\d{4,8}$/;
                                                  
                                                  order_cust_tel_flag=pattern.test($("#order_cust_tel").val());
                                               
                                                    if(!order_cust_tel_flag){
                                                        $("#order_cust_tel_error").html("请输入正确的手机号码");
                                                        $("#order_cust_tel_error").css('display','inline-block');
                                                        $("#order_cust_tel_error").addClass("wrong_box");
                                                     }else {
                                                        $("#order_cust_tel_error").html("");
                                                        $("#order_cust_tel_error").css('display','none');
                                                        $("#order_cust_tel_error").removeClass("wrong_box clearfix");
                                                        order_cust_tel_flag=true;
                                                     }
                                      
                                         }
                    );
           $('#order_submit_button').click(
                                      function(){
                                                  $('#order_cust_name').blur();
                                                  $('#order_cust_tel').blur();
                                               
                                                if( order_cust_name_flag &&  order_cust_tel_flag){

                                                     $("#order_form").submit();
                                                     
                                                }
                                                                                          
                                     }
                    );
  
                  }
                  )