
$(document).ready(

    function(){

     var mobile_falg=false;
     var cust_name_flag=false;
     var provinceList_flag=false;
     var loan_issue_flag=false;
     var loan_amt_flag=false;
 

          $('#applyTelephone').blur(
                                      function(){
                                                   var pattern = /^1[3|4|5|8][0-9]\d{8}$/;
                                                  
                                                    mobile_falg=pattern.test($("#applyTelephone").val());
                                               
                                                    if(!mobile_falg){
                                                        $("#applyTelephone_error").html("请输入正确的手机号码");
                                                        $("#applyTelephone_error").css('display','inline-block');
                                                        $("#applyTelephone_error").addClass("wrong_box");
                                                     }else {
                                                        $("#applyTelephone_error").html("");
                                                        $("#applyTelephone_error").css('display','none');
                                                        $("#applyTelephone_error").removeClass("wrong_box clearfix");
                                                        mobile_falg=true;
                                                     }
                                               }
                                   );
                                   
                                   
             $('#applyName').blur(
                                      function(){
                                                  var flag1=false;
                                                  var len=$("#applyName").val().replace(/[^\x00-\xff]/g,"**").length;
                                                  if(len>=4 && len<=10){
                                                    flag1=true;
                                                  }else {
                                                    flag1=false;
                                                  }
                                                  
                                                  var pattern = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi;
                                                  var flag2=pattern.test($("#applyName").val());
                                                  if(flag1 && flag2){
                                                  	  $("#applyName_ok").css('display','inline-block');      
                                                     $("#applyName_error").css('display','none');
                                                     $("#applyName_error").removeClass("wrong_box clearfix");
                                                     $("#applyName_error").html("");
                                                     cust_name_flag=true;  
                                                  }else{
                                                     $("#applyName_ok").css('display','none');
                                                     $("#applyName_error").css('display','inline-block');
                                                     $("#applyName_error").addClass("wrong_box clearfix");
                                                     $("#applyName_error").html("请输入2-5个汉字");
                                                     cust_name_flag=false;  
                                                  }
                                                  
                                               }
                                   );
                                   
             $('#provinceList').blur(
                                      function(){
                                                  if($("#provinceList").val()=='' || $("#cityList").val()==''  ){
                                                     $("#provinceList_ok").css('display','none');
                                                     $("#provinceList_error").css('display','inline-block');
                                                     $("#provinceList_error").addClass("wrong_box clearfix");
                                                     $("#provinceList_error").html("请选择正确的省份及城市");
                                                     provinceList_flag=false;  
                                                      return;
                                                  }else{
                                                     $("#provinceList_ok").css('display','inline-block');
                                                     $("#provinceList_error").css('display','none');
                                                     $("#provinceList_error").removeClass("wrong_box clearfix");
                                                     $("#provinceList_error").html("");
                                                      provinceList_flag=true;  
                                                  }
                                                  
                                               }
                                   );

             $('#cityList').blur(
                                      function(){
                                                  if($("#provinceList").val()=='' || $("#cityList").val()==''  ){
                                                     $("#provinceList_ok").css('display','none');
                                                     $("#provinceList_error").css('display','inline-block');
                                                     $("#provinceList_error").addClass("wrong_box clearfix");
                                                     $("#provinceList_error").html("请选择正确的省份及城市");
                                                     provinceList_flag=false;  
                                                      return;
                                                  }else{
                                                     $("#provinceList_ok").css('display','inline-block');
                                                     $("#provinceList_error").css('display','none');
                                                     $("#provinceList_error").removeClass("wrong_box clearfix");
                                                     $("#provinceList_error").html("");
                                                      provinceList_flag=true;  
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

                                   
                                   
           $('#zhijiedai_submit').click(
                                    function(){
                                        
                                                 if(mobile_falg && cust_name_flag &&  provinceList_flag &&  loan_issue_flag 
                                                     &&  loan_amt_flag)

                                                  {
                                                    $('#directOrder').submit();
     
                                                 }
                                          
            
                                              }
                                  );        
     
           }
           
    )
    
    
    
