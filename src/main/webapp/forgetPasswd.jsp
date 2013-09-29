<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/publlc.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/lihover.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jslides.js"></script>
</head>

<body>
<form action="login" method="post">
<div class="login">
  <div class="login1">
    <div class="login2">
      <div class="login2_1 font_f">玖富云金融平台</div>
  
      <div class="login2_2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th>账&nbsp;&nbsp;&nbsp;号：</th>
            <td><input name="logonName" type="text" class="input" /><br/><br/>
            	<em style="color:#CCC">Email/手机/身份证/客户号</em>
            </td>
          </tr>
          <tr>
            <th>验&nbsp;证&nbsp;码：</th>
            <td><input name="logonName" type="text" class="input" /><br/><br/>
            </td>
          </tr>
          <tr>
          <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
           <td><img id="captchaimg" src="handleCaptcha" alt="captcha"   onclick="javascript:reloadCaptcha()" /></td> 
          </tr>
           <tr>
              <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
             <td> <input name="ok" type="submit" value="下一步" /> </td>
           </tr>

        </table>
      </div>
      <div class="login5"></div>
    </div>
  </div>
</div>
</form>
<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
        obj.src =captchaURL ;
        
    }  
  </script>

</body>
</html>
