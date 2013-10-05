
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/find_pwd.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/find_pwd.js"></script>

</head>

<body>
     <div class="find_wrap">
         <div class="title clearfix">
            <span class="bold">重置密码</span>
        </div>
        <div class="content">
            <div class="progress p_2"> </div>
            <form id="form1"   action="forgetPasswdConfirm"  method="POST"   >
             <div class="line">
                <label><span class="tit s_tit">电子邮箱：</span><input  type="text" id="email" name="email"  value="${email}"
                        TextMode="Password" size="10"  Class="text" readonly /></label>
                       <span class="e9" >验证码已经发到邮箱</span>
            </div>
            
            <div class="line">
                <label><span class="tit s_tit">设置新密码：</span><input  type="password" id="NewPassword" name="NewPassword"  value=""
                        TextMode="Password" size="10"  Class="text" TabIndex="2"  onfocus="checkfocusnew_confirm();" onblur="checkbluenew_confirm();"/></label>
                       <span class="e9" id="password_error_newpass" style="display: none;"></span>
            </div>
            <div class="line">
                <label><span class="tit s_tit">确认新密码：</span><input   type="password" id="ReNewPassword"  name="ReNewPassword" value=""
                        TextMode="Password" size="10"  Class="text"  onfocus="checkfocusrenew_confirm();" onblur="checkbluerenew_confirm();" TabIndex="3" /></label>
               <span class="tip_yes" id="input_password_renewpass_ok" style="display: none"></span><span class="e9" id="password_error_renewpass" style="display: none;"></span>              
            </div>
            <div class="line">
                <label><span class="tit s_tit">接收到的验证码：</span><input   type="text" id="verifyCode"  name="verifyCode" value=""
                        TextMode="text" size="10"  Class="text"    TabIndex="4" /></label>
               </span>              
            </div>
                <div>
                    <span class="tit"></span>
                    <input id="btnCheck" type="submit"  class="btn btn_next" value="" tabindex="5"/>
                </div>
            
            </form>
        </div>
    </div>
                    <script language="javascript">
                
       
                
                </script>
    
    
</body>
</html>