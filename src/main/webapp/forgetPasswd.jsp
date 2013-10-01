<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/find_pwd.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>

</head>

<body>


    <div class="find_wrap">
        <div class="title clearfix">

            <span class="bold">找回密码</span>
        </div>

        <div class="content">
            <div class="progress p_1">
            </div>
            <form id="form_findpwd"  action=""  method="POST"  onsubmit="return false;">
                <div  id="lostuser_verified" class="line">
                    <label>
                    	<span class="tit s_tit">用户名:</span><input  type="text" id="txtEmail"  name="txtEmail" value=""  Class="text"  MaxLength="40" onfocus="Onfocus();" onblur="OnBlur(this,'DIVshowError',1);"  tabindex="1"  />
                    </label>
                    <span id="email_ok" class="tip_yes" style="display: none"></span>
                    <span id="DIVshowError" class="e9" style="display:none;"></span>
                </div>
                <div class="line">
                    <label>
                    	<span class="tit  s_tit">图形验证码:</span><input  type="text" id="txtVerifyCode"  name="txtVerifyCode"  Class="text"  value="" onfocus="OnVcodeFocus()" onblur="OnVcodeBlur(this,'DIVshowError_code',1);"   tabindex="2"/>
                    </label>
                    <span id="vcode_ok" class="tip_yes" style="display: none"></span>
                    <span id="DIVshowError_code" class="e9" style="display: none;"></span>
                </div>
                <div>
                    <span class="tit"></span>
                 <img id="captchaimg" src="handleCaptcha" alt="captcha"  onclick="reloadCaptcha()" style="cursor:pointer;"/>
                </div>

                <div>
                    <span class="tit"></span>
                    <input id="btnCheck" type="button" onclick="SubmitCheck()" class="btn btn_next" value="" tabindex="5"/>
                    <input id="btnConfirm"  type="submit" value="" style="display:none" />
                </div>
                
            </form>
        </div>
    </div>


<script type="text/javascript" language="JavaScript">
 
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
        obj.src =captchaURL ;
        
    }  


function Onfocus(){
	
    $('DIVshowError').innerHTML=msg[1];
    $('DIVshowError').className="e9";
    $('DIVshowError').style.display = "inline-block";
   
    jQuery("#txtEmail").addClass("label_focus");
}

function  OnBlur(obj,HTMLid,msgnum)
{

      $(HTMLid).style.display = "none";
      jQuery("#txtEmail").removeClass("label_focus");
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
}

function $(id){return document.getElementById(id);};
function $F(id){
           
           var o=$(id);
           if(o==null) return null;
           return o.value.trim();
       };


var msg=new Array();
msg[0] = "<span>您输入的邮箱/手机号码格式错误,</span><span>请重新输入</span>";
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

  </script>

</body>
</html>
