

$(document).ready(
    function(){

          var modify_passwd_cur_flag=false;
          var modify_passwd_new_one_flag=false;
          var modify_passwd_new_two_flag=false;

          $('#modify_passwd_cur').blur(
                                      function(){
                                                      var modify_passwd_cur = $("#modify_passwd_cur").val();
    
                                                     if (modify_passwd_cur == '') {
                                                                           $("#modify_passwd_cur_error").html("当前密码不能为空,请重新输入");
                                                                           $("#modify_passwd_cur_error").addClass("wrong_box clearfix");
                                                                           $("#modify_passwd_cur_error").css('display','inline-block');
                                                                          
                                                                           modify_passwd_cur_flag=false;
                                                                           return;
                                                      }
      
                                                     if (!/^(\S){1,}$/.test(modify_passwd_cur)) {
                                                                           $("#modify_passwd_cur_error").html("当前密码不能包含“空格”,请重新输入");
                                                                           $("#modify_passwd_cur_error").addClass("wrong_box clearfix");
                                                                           $("#modify_passwd_cur_error").css('display','inline-block');
                                                                           modify_passwd_cur_flag=false;
                                                                           return;
                                                      }
              
                                                     if (modify_passwd_cur.length < 6 || modify_passwd_cur.length > 18) {
                                                                           $("#modify_passwd_cur_error").html("<span>当前密码长度6-18个字符,请重新输入</span>");
                                                                           $("#modify_passwd_cur_error").addClass("wrong_box clearfix")
                                                                            $("#modify_passwd_cur_error").css('display','inline-block');;
                                                                           modify_passwd_cur_flag=false;
                                                                           return;
                                                      }
                                                     if (!/^\S{1,18}$/.test(modify_passwd_cur)) {
                                                               $("#modify_passwd_cur_error").html("<span>当前密码长度6-18个字符,请重新输入</span>");
                                                               $("#modify_passwd_cur_error").addClass("wrong_box clearfix");
                                                                $("#modify_passwd_cur_error").css('display','inline-block');
                                                               modify_passwd_cur_flag=false;
                                                               return;
                                                     }
                                                     
                                                               $("#modify_passwd_cur_error").html("");
                                                               $("#modify_passwd_cur_error").removeClass("wrong_box clearfix");
                                                                $("#modify_passwd_cur_error").css('display','none');
                                                     
                                                               modify_passwd_cur_flag=true;
                                                               return;
                                               
                                               }
                                   );
                                   
                                   
           $('#modify_passwd_new_one').blur(
                                      function(){
                                                  var modify_passwd_new_one = $("#modify_passwd_new_one").val();
    
                                                     if (modify_passwd_new_one == '') {
                                                                           $("#modify_passwd_new_one_error").html("新密码不能为空,请重新输入");
                                                                           $("#modify_passwd_new_one_error").addClass("wrong_box clearfix");
                                                                           $("#modify_passwd_new_one_error").css('display','inline-block');
                                                                           modify_passwd_new_one_flag=false;
                                                                           return;
                                                      }
      
                                                     if (!/^(\S){1,}$/.test(modify_passwd_new_one)) {
                                                                           $("#modify_passwd_new_one_error").html("新密码不能包含“空格”,请重新输入");
                                                                           $("#modify_passwd_new_one_error").addClass("wrong_box clearfix");
                                                                          $("#modify_passwd_new_one_error").css('display','inline-block');
                                                                           modify_passwd_new_one_flag=false;
                                                                           return;
                                                      }
              
                                                     if (modify_passwd_new_one.length < 6 || modify_passwd_new_one.length > 18) {
                                                                           $("#modify_passwd_new_one_error").html("<span>新密码长度6-18个字符,请重新输入</span>");
                                                                           $("#modify_passwd_new_one_error").addClass("wrong_box clearfix");
                                                                           $("#modify_passwd_new_one_error").css('display','inline-block');
                                                                           modify_passwd_new_one_flag=false;
                                                                           return;
                                                      }
                                                     if (!/^\S{1,18}$/.test(modify_passwd_new_one)) {
                                                               $("#modify_passwd_new_one_error").html("<span>新密码长度6-18个字符,请重新输入</span>");
                                                               $("#modify_passwd_new_one_error").addClass("wrong_box clearfix");
                                                               $("#modify_passwd_new_one_error").css('display','inline-block');
                                                               modify_passwd_new_one_flag=false;
                                                               return;
                                                     }
                                                               $("#modify_passwd_new_one_error").html("");
                                                               $("#modify_passwd_new_one_error").removeClass("wrong_box clearfix");
                                                                $("#modify_passwd_new_one_error").css('display','none');
                                                     
                                                               modify_passwd_new_one_flag=true;
                                                               return;
                                               
                                                  
                                               }
                                   );

           $('#modify_passwd_new_two').blur(
                                      function(){
                                                      var passwd1 = $("#modify_passwd_new_one").val();
                                                      var passwd2 = $("#modify_passwd_new_two").val();
                                                      if(passwd1 != passwd2){
                                                               $("#modify_passwd_new_one_error").html("<span>两次密码输入不一致,请重新输入</span>");
                                                               $("#modify_passwd_new_one_error").addClass("wrong_box clearfix");
                                                               $("#modify_passwd_new_one_error").css('display','inline-block');
                                                               modify_passwd_new_two_flag=false;
                                                               return 
                                                      } 
                                                               $("#modify_passwd_new_two_error").html("");
                                                               $("#modify_passwd_new_two_error").removeClass("wrong_box clearfix");
                                                                $("#modify_passwd_new_two_error").css('display','none');


                                                               modify_passwd_new_two_flag=true;
                                               }
                                   );



            $('#modify_passwd_submit').click(
                                    function(){
                                                 $('#modify_passwd_cur').blur();
                                                 $('#modify_passwd_new_one').blur();
                                                 $('#modify_passwd_new_two').blur();
                                        
                                                 if(modify_passwd_cur_flag && modify_passwd_new_one_flag && modify_passwd_new_two_flag )
                                                  {
                                                    $('#modify_passwd_form').submit();

                                                 }
                                          
            
                                              }
                                  );        
           }
           
    )
    
    
    
