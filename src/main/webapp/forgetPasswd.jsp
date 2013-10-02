<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/find_pwd.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
<script type="text/javascript" src="Scripts/find_pwd.js"></script>

</head>

<body>


    <div class="find_wrap">
        <div class="title clearfix">

            <span class="bold">找回密码</span>
        </div>

        <div class="content">
            <div class="progress p_1">
            </div>
            <form id="form_findpwd"  action="verifyPasswd"  method="POST" >
                <div  id="lostuser_verified" class="line">
                    <label>
                    	<span class="tit s_tit">用户名:</span><input  type="text" id="logonName"  name="logonName" value=""  Class="text"  MaxLength="40" onfocus="Onfocus();" onblur="OnBlur(this,'DIVshowError',1);"  tabindex="1"  />
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
                    <input id="btnCheck" type="submit"  class="btn btn_next" value="" tabindex="5"/>
                </div>
                
            </form>
        </div>
    </div>


<script type="text/javascript" language="JavaScript">
  


  </script>


</body>
</html>
