    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
        obj.src =captchaURL ;
        
    }  


function Onfocus(){
	
    $('DIVshowError').innerHTML=msg[1];
    $('DIVshowError').className="e9";
    $('DIVshowError').style.display = "inline-block";
   
    jQuery("#logonName").addClass("label_focus");
}

function  OnBlur(obj,HTMLid,msgnum)
{

      $(HTMLid).style.display = "none";
      jQuery("#logonName").removeClass("label_focus");
      
    jQuery.ajax(
    {
       url:'verifyAccount',
       type:'post',
       data:{logonName:jQuery("#logonName").val()},
       dataType:"text",
       success: function(data){
       if(data=="fail"){
             $(HTMLid).innerHTML=msg[0];
             $(HTMLid).style.display = "inline-block";
             $(HTMLid).className = "wrong_box clearfix";
             $('email_ok').style.display = "none";
             
         }else if(data=="success"){
             $('email_ok').className = "tip_yes";
             $('email_ok').style.display = "inline-block";
             $(HTMLid).style.display = "none";
             jQuery("#txtVerifyCode").removeClass("label_focus");     
         }             
        }
    });

}

function OnVcodeFocus(){
    	
    $('DIVshowError_code').innerHTML=msg[9];
    $('DIVshowError_code').className="e9";
    $('DIVshowError_code').style.display = "inline-block";
   
    jQuery("#txtVerifyCode").addClass("label_focus");
    
    if($('vcode_ok').style.display != "none")
    {   
        reloadCaptcha(); 
        $('vcode_ok').style.display = "none";
     }
}


function  OnVcodeBlur(obj,HTMLid,msgnum)
{
/* 
  jQuery.ajax(
    {
       url:'verifyCaptcha',
       type:'post',
       data:{captcha:jQuery("#txtVerifyCode").val()},
       dataType:"text",
       success: function(data){
       if(data=="fail"){
             $(HTMLid).innerHTML=msg[3];
             $(HTMLid).style.display = "inline-block";
             $(HTMLid).className = "wrong_box clearfix";
             $('vcode_ok').style.display = "none";
             reloadCaptcha();
         }else if(data=="success"){
             $(HTMLid).style.display = "none";
             jQuery("#txtVerifyCode").removeClass("label_focus");     
             $('vcode_ok').className = "tip_yes";
             $('vcode_ok').style.display = "inline-block";
                      
         }             
        }
    });
*/
 }

function $(id){return document.getElementById(id);};
function $F(id){
           
           var o=$(id);
           if(o==null) return null;
           return o.value.trim();
       };


 function     SubmitCheck(){
    var email = $F("logonName");
    var vcode = $F('txtVerifyCode');
    if(email == ""||vcode == ''){
       if(email == "")
       {
           ShowErrorMsg("DIVshowError", 4, "logonName");
       }
        
       if(vcode == ''){
           ShowErrorMsg("DIVshowError_code", 5, "txtVerifyCode");
       }
       return  false;
    }
    
     return  true;
}

function ShowErrorMsg(HTMLid, msgnum, inputTxtId) {

    if (inputTxtId != "") {
        jQuery("#" + inputTxtId).attr("style", "");
        jQuery("#" + inputTxtId).addClass("wrong");
    }
    $(HTMLid).className = "wrong_box clearfix";
    $(HTMLid).innerHTML="<i></i>"+msg[msgnum];
    $(HTMLid).style.display="inline-block";
}

var msg=new Array();
msg[0] = "<span>您输入的邮箱/手机号码/身份证/客户号/格式错误,</span><span>请重新输入</span>";
msg[1] = "请输入您在登录时使用的邮箱/手机号码/身份证/客户号";
msg[2] = "<span>您输入的邮箱/手机号码尚未注册,</span><span>请检查输入或<a href=\"\">立即注册</a></span>";
msg[3] = "验证码输入有误,请重新输入";
msg[4] = "请输入邮箱/手机号码/昵称";
msg[5] = "请输入验证码";
msg[6] = "网络错误，请稍后重试";
msg[7] = "您今天的验证码发送次数已经超过限制,请明天再试";
msg[9] = "请输入下方图片中的字符,不区分大小写";
msg[10] = "为了你的账户安全，请输入验证码";
msg[11] = "<span>您输入的用户名不存在,</span><span>请检查输入或<a href=\"register.php\">立即注册</a></span>";


                  function checkfocusnew_confirm() {
                          $("password_error_newpass").className = "e9";
                          $("password_error_newpass").innerHTML = msg_error[3];
                          $("password_error_newpass").style.display = "inline-block";
                          $("NewPassword").className = "text";
                          
                   }
       
                  function checkbluenew_confirm() {
                      if (!txtnewPassword_check()) {
                          $('spPwdStrongTips').style.display = "none";      
                       return false;
                      }
                       return true;
                     }
       
      function txtnewPassword_check() {
              var password = jQuery('#NewPassword').val();
              $('password_error_newpass').innerHTML = msg_error[3];
              $('password_error_newpass').style.display = "inline-block";
              checkpassword = false;
             if (password == '') {
                  $("password_error_newpass").innerHTML = "";
                  return true;
                }
      
              if (!/^(\S){1,}$/.test(password)) {
                  ShowConfirmErrorMsg("password_error_newpass", 18, "NewPassword");
                  return false;
              }
              
              if (password.length < 6 || password.length > 18) {
                  ShowConfirmErrorMsg("password_error_newpass", 4, "NewPassword");
                  return false;
              }
          
              if (!/^\S{1,18}$/.test(password)) {
                  ShowConfirmErrorMsg("password_error_newpass", 4, "NewPassword");
                  return false;
              }
              password = Trim(password);
              $('password_error_newpass').style.display = "none";
              $('password_error_newpass').innerHTML = '';
              jQuery("#NewPassword").attr("style", "");
              jQuery("#NewPassword").attr("class", "text");
              checkpassword = true;
              return true;
          }
          
          function ShowConfirmErrorMsg(HTMLid, msgnum, inputTxtId) {

           if (inputTxtId != "") {
                 jQuery("#" + inputTxtId).attr("style", "");
                 jQuery("#" + inputTxtId).addClass("wrong");
            }
            $(HTMLid).className = "wrong_box clearfix";
            $(HTMLid).innerHTML = "<i></i>" + msg_error[msgnum];
            $(HTMLid).style.display = "inline-block";
         }
          
       
        function LTrim(str) {
           var i;
           for (i = 0; i < str.length; i++) {
                 if (str.charAt(i) != " " && str.charAt(i) != " ") break;
           }
           str = str.substring(i, str.length);
           return str;
        }

       function RTrim(str) {
          var i;
         for (i = str.length - 1; i >= 0; i--) {
             if (str.charAt(i) != " " && str.charAt(i) != " ") break;
          }
        str = str.substring(0, i + 1);
        return str;
       }

       function Trim(str) {
          return LTrim(RTrim(str));
       }
        
         function checkfocusrenew_confirm() {
              focusInit(8, "input_password_renewpass_ok", "password_error_renewpass", "ReNewPassword");
        }

       function focusInit(msgnum, okLbl, errorLbl, txtInput) {
           $(okLbl).style.display = "none";
           $(errorLbl).className = "e9";
           $(errorLbl).innerHTML = msg_error[msgnum];
           $(errorLbl).style.display = "inline-block";
           $(txtInput).className = "text";
        }
       
       function checkbluerenew_confirm() {
         if (!txtRepeatPass_check()) {
             return false;
         }
        return true;
       } 

     function txtRepeatPass_check() {
         var rep_password = jQuery('#ReNewPassword').val();
         $('password_error_renewpass').innerHTML = '';
         $('password_error_renewpass').style.display = "inline-block";
         $('input_password_renewpass_ok').style.display = "none";
         checkRepassword = false;
        if (rep_password == '') {
           $('password_error_renewpass').innerHTML = "";
            $('password_error_renewpass').style.display = "none";
           return true;
      }

     if (rep_password != jQuery('#NewPassword').val()) {
        ShowConfirmErrorMsg("password_error_renewpass", 9, "ReNewPassword");
        return false;
     }
     $('password_error_renewpass').style.display = "none";
     $('password_error_renewpass').innerHTML = '';
     jQuery("#ReNewPassword").attr("style", "");
     $('ReNewPassword').className = "text";
     $('input_password_renewpass_ok').className = "tip_yes";
     if (txtnewPassword_check()) {
         $('input_password_renewpass_ok').style.display = "inline-block";
         checkRepassword = true;
     } else {
         $('input_password_renewpass_ok').style.display = "none";
     }
     return true;
     }
     
       
                  var msg_error=new Array();
                      msg_error[0] = "请输入您邮件中收到的验证码";
                      msg_error[2] = "验证码输入有误,请重新输入";
                      msg_error[3] = "密码为6-18个字符,可由英文、数字及符号组成";
                      msg_error[4] = "<span>密码长度6-18个字符,请重新输入</span>";
                      msg_error[5] = "验证码已过期,<a href=\"lostpassword.php\">重新收取邮件</a>"
                      msg_error[6] = "您今天的验证码发送次数已经超过限制,请明天再试";
                      msg_error[7] = "还是没有收到短信？请检查您的手机明天再试";
                      msg_error[8] = "请再次输入您设置的新密码";
                      msg_error[9] = "<span>两次输入的密码不一致,</span><span>请重新输入</span>";
                      msg_error[10] = "请输入您手机中收到的验证码";
                      msg_error[12] = "请输入新密码";
                      msg_error[13] = "请再次输入新密码";
                      msg_error[14] = "发送验证码成功";
                      msg_error[15] = "发送验证码失败";
                      msg_error[16] = "请输入验证码";
                      msg_error[17] = "新登录密码不能与支付密码相同,请重新输入";
                      msg_error[18] = "密码不能包含“空格”,请重新输入";




