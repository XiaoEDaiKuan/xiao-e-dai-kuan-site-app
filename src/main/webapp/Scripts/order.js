$(document).ready(function(){

           
           var loan_amt_flag=false;
           
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

  
                  }
                  )