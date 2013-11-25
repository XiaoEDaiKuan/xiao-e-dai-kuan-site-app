<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信用码</title>
<link href="cssnew/publlc.css" type="text/css" rel="stylesheet" />
<link href="cssnew/credit.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="Scripts/pop.js"></script>
</head>

<body>
<div class="cre_code">
  <div class="cre_top">
    <div class="cre_logo font_f"><a href="index.html"></a>
      <p></p>
    </div>
  </div>
</div>

<!--中心内容-->
<div class="cre_main">
  <div class="cre_msg">
    <div class="cre_qr_code">
      <div class="cre_qr_code_left"></div>
      <div class="cre_qr_code_right font_f">扫一扫，就能贷</div>
    </div>
    <div class="cre_message_title font_f">没有微信怎么办？
      <p>留下信息我帮您！</p>
    </div>
    <div class="cre_message">
      <div class="cre_message_left">
        <p><font>姓名</font>
          <input id="custName" name="custName" type="text" />
              
              <span id="custName_ok" class="tip_yes" style="display:none;"></span>
              <span id="custName_error" class="e9" style="display:none;"></span>
          
        </p>
        <br>
        <p><font>手机号</font>
          <input id="mobileNO" name="mobileNO" type="text" />
                <span id="mobileNO_ok" class="tip_yes" style="display:none;"></span>
                <span id="mobileNO_error" class="e9" style="display:none;"></span>
        </p>
      </div>
      <div class="cre_message_right">
        <input type="button" onclick="javascript:saveCreditCust()" />
      </div>
    </div>
  </div>
</div>

<!--底部-->
<div class="cre_footer">
  <div class="cre_footer_logo"></div>
  <div class="cre_footer_content">
    <div class="cre_footer_link"><a><img src="images/credit/credit_beida.png" width="121" height="44" /></a><a><img src="images/credit/credit_itfusc.png" width="109" height="35" /></a><a><img src="images/credit/credit_mm.png" width="84" height="40" /></a><a><img src="images/credit/credit_micro.png" width="174" height="26" /></a><a><img src="images/credit/credit_anquan.png" width="84" height="40" /></a><a><img src="images/credit/credit_kexin.png" width="109" height="35" /></a></div>
    <div class="cre_footer_add font_f">北京玖富时代投资顾问有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备07003840号<br />
      技术服务商：北京九富科技有限公司<br />
      公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
      传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp; 邮编：100000</div>
  </div>
</div>

<!--弹出框-->
<div id="popDiv" class="mydiv2" style="display:none;">
  <div class="pop">
    <div class="pop_right"><a href="javascript:closeDiv()"><img src="images/credit/credit_closed.png" width="10" height="10" /></a></div>
  </div>
  <div class="pop2"> <font id="myPopFont">提交成功！</font>
    <p id="myPopPrg">9F云金融客服代表会尽快联系您。</p>
    <input name="" type="button" value="确定" onclick="javascript:closeDiv()" />
  </div>
</div>
<div id="bg" class="bg" style="display:none;"></div>
<iframe id='popIframe' class='popIframe' frameborder='0' ></iframe>
<!--弹出框 end-->
</body>
</html>
