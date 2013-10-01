var msg=new Array();
msg[0] = "<span>您输入的邮箱/手机号码格式错误,</span><span>请重新输入</span>";
msg[1] = "请输入您在登录时使用的邮箱/手机号码/昵称";
msg[2] = "<span>您输入的邮箱/手机号码尚未注册,</span><span>请检查输入或<a href=\"register.php\">立即注册</a></span>";
msg[3] = "验证码输入有误,请重新输入";
msg[4] = "请输入邮箱/手机号码/昵称";
msg[5] = "请输入验证码";
msg[6] = "网络错误，请稍后重试";
msg[7] = "您今天的验证码发送次数已经超过限制,请明天再试";
msg[9] = "请输入下方图片中的字符,不区分大小写";
msg[10] = "为了你的账户安全，请输入验证码";
msg[11] = "<span>您输入的用户名不存在,</span><span>请检查输入或<a href=\"register.php\">立即注册</a></span>";

String.prototype.trim=function(){return this.replace(/(\s*$)|(^\s*)/g, '');};
function $(id){return document.getElementById(id);};
function $F(id){var o=$(id);if(o==null) return null;return o.value.trim();};

function Ajax(url)
{
	var m_xmlReq=null;
	if(window.ActiveXObject)
	{
	    try 
	    {
	        m_xmlReq = new ActiveXObject('Msxml2.XMLHTTP'); 
	    }
	    catch(e)
	    {
	        try{m_xmlReq = new ActiveXObject('Microsoft.XMLHTTP');}catch(e){}
	    }
	}
	else if(window.XMLHttpRequest)
	{
	    m_xmlReq = new XMLHttpRequest();
	}
	
	this.post=function(d)
	{
	    if(!m_xmlReq)  return;
	    m_xmlReq.open('POST',url,false);
	    m_xmlReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8');
	    m_xmlReq.send(d);
	    return eval(m_xmlReq.responseText);
	}
}

function lostpwd_keydown(e)
{   
    var ev = window.event || e;
    if(ev.keyCode == 13)
    {
       return checkemail();
    }
}

function verifyEmail_keydown(e)
{
    var ev = window.event || e;
    if(ev.keyCode == 13)
    {
       return checkemail();
    }
}

function Checkemailfocus(){
    alert("ddd");
	
    $('email_ok').style.display="none";
    $('DIVshowError').innerHTML=msg[1];
    $('DIVshowError').className="e9";
            $('DIVshowError').style.display = "inline-block";
    jQuery("#user_type").val("");
    $("txtEmail").className = "text";
     jQuery("#selusertypemail").attr("checked","");	
     jQuery("#selusertypemobile").attr("checked","");		
    jQuery("#txtEmail").css('border-color', '#FF8E42');
}

function mailisexistence()
{
         var username = $F('txtEmail');
         var email_checker_ajax = new Ajax("p/emailandmobile_check.php");
         var  user_loginname=username.replace('#', '%C').replace('+', '%C').replace('&','%C');
         var  result= email_checker_ajax.post('usermobile=' + user_loginname );
         var getdata=result;
             if(getdata=="1")
             {                 
                                 jQuery("#user_type").val("1");
                                return true;
             }
                if(getdata=="2")
             {                 
                                 jQuery("#user_type").val("2");
                                return true;
             }
              if(getdata=="3"){
                              ShowErrorMsg("DIVshowError",11, "txtEmail");
                              return false;
             } 
            if(getdata=="4"){
                   if(jQuery("#selusertypemail").attr("checked")||jQuery("#selusertypemobile").attr("checked")){
		 if(jQuery("#user_type").val()!=""){
                                     return   true;
                            }
                      }
                    showusertype();
                    return false;
             }
                ShowErrorMsg("DIVshowError",11, "txtEmail");
                return  false;
}

function show_vcode(img_id)
{
    $(img_id).src='p/tmp_proxy.php?t='+new Date().getTime();

}

function CheckVcodeFocus(){
    $('vcode_ok').style.display="none";
    $('DIVshowError_code').innerHTML=msg[9];
    $('DIVshowError_code').className="e9";
    $('DIVshowError_code').style.display = "inline-block";
     jQuery("#txtVerifyCode").removeClass("wrong");
     jQuery("#txtVerifyCode").css('border-color', '#FF8E42');
}

function checkCode()
{   
    var vcode = $F('txtVerifyCode'); 
    
    $('vcode_ok').style.display = "none";
    if( !/(\W{2}|\W{4}|\w{2}|\w{4})/.test(vcode)) {
        show_vcode("imgVcode");
        ShowErrorMsg("DIVshowError_code", 3, "txtVerifyCode");
        return false;
    }
    var vcode_checker_ajax = new Ajax("p/vcode_checker.php");
    if(!vcode_checker_ajax.post('vcode='+vcode+'&type=0')) {
        show_vcode("imgVcode");
        ShowErrorMsg("DIVshowError_code", 3, "txtVerifyCode");
        return false;
    }
    $('DIVshowError_code').style.display = "none";
    $('DIVshowError_code').innerHTML = "";
    $('vcode_ok').className = "tip_yes";
    $('vcode_ok').style.display = "inline-block";
    return true;
}

function  CheckBlue(obj,HTMLid,msgnum)
{
	alert("sassasasasasasa"+obj.id);
    if(obj.id != "txtVerifyCode")
    {
        var email = $F("txtEmail");
        if(email == "")
        {
            $(HTMLid).style.display = "none";
            return;
        }
        if(mailisexistence())
        {  
            $(HTMLid).style.display = "none";
            $(HTMLid).innerHTML = "";
            $('email_ok').className = "tip_yes";
            $('email_ok').style.display = "inline-block";
        }
    }
    else
    {
        var vcode = $F('txtVerifyCode');
        if(vcode == "")
        {
            $(HTMLid).style.display = "none";
            return;
        }
        checkCode();
    }
}


function showusertype(){
    jQuery("#txtVerifyCode").blur();
    jQuery("#txtEmail").attr("readonly","readonly");   
    jQuery("#lostuser_verified").addClass("winerror");
    jQuery("#selusertype").css("display","");
    jQuery("#DIVshowError").hide(); 
      
}

function hideusertype(num){
    jQuery("#user_type").val(num);
    jQuery("#lostuser_verified").removeClass("winerror");
    jQuery("#selusertype").css("display","none");
    jQuery("#txtEmail").removeAttr("readonly");   
    $('email_ok').className = "tip_yes";
    $('email_ok').style.display = "inline-block";
}


  function     SubmitCheck(){
    var email = $F("txtEmail");
    var vcode = $F('txtVerifyCode');
    if(email == ""||vcode == ''){
       if(email == "")
       {
           ShowErrorMsg("DIVshowError", 4, "txtEmail");
       }
        
       if(vcode == ''){
           ShowErrorMsg("DIVshowError_code", 5, "txtVerifyCode");
       }
       return  false;
    }
    if(!checkCode()){
        return false;
    }
    jQuery("#txtVerifyCode").blur();
    if(!mailisexistence()){
        return false;
    }   
    HideErrorMsg('DIVshowError');
    $('email_ok').style.display="inline-block";
    var   fusertype="";
        if(email.length < 40 &&  /^[.\-_a-zA-Z0-9]+@[\-_a-zA-Z0-9]+[.a-zA-Z0-9]{1,}$/.test(email))
        { 
               fusertype="1";
        }
        else
       {
              if(/^1[3,4,5,8][0-9]{9}$/.test(email))
              {
                       if(jQuery("#user_type").val()=="1")
                       {
                              fusertype="3";
                       }
                       else
                       {
                              fusertype="2";
                       }
               }
               else
               {
                      fusertype="3";
               }
        }
    Authentication.init("find_password_confirm.php", "basic", email, fusertype);
    return  true;
}



function CheckdoSubmit(e)
{
    var ev = window.event || e;
    if(ev.keyCode == 13)
    {  
        SubmitCheck();
    }
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

function HideErrorMsg(HTMLid)
{
    $(HTMLid).style.display="none";
}

function SendPassword(S_email,S_vcode){
    var email_checker_ajax = new Ajax("p/SendPassword.php");
    if(!email_checker_ajax.post('email='+S_email)){
        $("SendisTrue").style.display="inline-block";
        $("waitpost").style.display="none";
    }
}

function showErrorCode(code){
    switch (code){
        case 0:
            return;
        case 1:
            ShowErrorMsg("DIVshowError", 2, "txtEmail");
            break;
        case 2:
            ShowErrorMsg("DIVshowError_code", 3, "txtVerifyCode");
            break;
        case 3:
            ShowErrorMsg("DIVshowError", 6, "txtEmail");
            break;
        case 4:
            ShowErrorMsg("DIVshowError", 2, "txtEmail");
            break;
        case 5:
            $('email_ok').style.display = "none";
            ShowErrorMsg("DIVshowError", 7, "txtEmail");
            break;
        case 6:
            $('email_ok').style.display = "none";
            ShowErrorMsg("DIVshowError", 7, "txtEmail");
            break;
        default:
            break;
    }
}

/*----------------------------------------*/
var msg_error=new Array();
msg_error[0] = "请输入您邮件中收到的验证码";
msg_error[2] = "验证码输入有误,请重新输入";
msg_error[3] = "密码为6-20个字符,可由英文、数字及符号组成";
msg_error[4] = "<span>密码长度6-20个字符,请重新输入</span>";
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

function focusInit(msgnum, okLbl, errorLbl, txtInput) {
    $(okLbl).style.display = "none";
    $(errorLbl).className = "e9";
    $(errorLbl).innerHTML = msg_error[msgnum];
    $(errorLbl).style.display = "inline-block";
    $(txtInput).className = "text";
}

function checkfocus_confirm() {
    var username = $("Emailhid").value;
    if (/^1[3,4,5,8][0-9]{9}$/.test(username)) {
        focusInit(10, "input_password_ok", "password_error", "txtPassword");
    } else {
        focusInit(0, "input_password_ok", "password_error", "txtPassword");
    }
    jQuery("#txtPassword").css('border-color', '#FF8E42');
}

function checkfocusnew_confirm() {
    $("password_error_newpass").className = "e9";
    $("password_error_newpass").innerHTML = msg_error[3];
    $("password_error_newpass").style.display = "inline-block";
    $("NewPassword").className = "text";
    $('spPwdStrongTips').style.display = "none";  
    $('divPwdStrong1').style.display = "none";
    $('divPwdStrong2').style.display = "none";
    $('divPwdStrong3').style.display = "none";
}

function checkbluenew_confirm() {
    if (!txtnewPassword_check()) {
        $('spPwdStrongTips').style.display = "none";      
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "none";
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
        $('spPwdStrongTips').style.display = "none";
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "none";
        $("password_error_newpass").style.display = "none";
        $("password_error_newpass").innerHTML = "";
        return true;
    }
    
    if (!/^(\S){1,}$/.test(password)) {
        ShowConfirmErrorMsg("password_error_newpass", 18, "NewPassword");
        return false;
    }
    
    if (password.length < 6 || password.length > 20) {
        ShowConfirmErrorMsg("password_error_newpass", 4, "NewPassword");
        return false;
    }

    if (!/^\S{1,20}$/.test(password)) {
        ShowConfirmErrorMsg("password_error_newpass", 4, "NewPassword");
        return false;
    }
    password = Trim(password);
    $('password_error_newpass').style.display = "none";
    $('password_error_newpass').innerHTML = '';
    jQuery("#NewPassword").attr("style", "");
    jQuery("#NewPassword").attr("class", "text");
    $('spPwdStrongTips').style.display = "inline";

    var chenum = checkStrong();
    if (chenum == 0) {
        $('password_error_newpass').style.display = "inline";
        $('password_error_newpass').innerHTML = msg_error[3];
        return;
    } else if (chenum == 1) {
        $('divPwdStrong1').style.display = "inline";
        jQuery('#divPwdStrong1').css("zoom", "1");
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "none";
    } else if (chenum == 2) {
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "inline";
        jQuery('#divPwdStrong2').css("zoom", "1");
        $('divPwdStrong3').style.display = "none";
    } else if (chenum >= 3) {
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "inline";
        jQuery('#divPwdStrong3').css("zoom", "1");
    }
    checkpassword = true;
    return true;
}

function checkfocusrenew_confirm() {
    focusInit(8, "input_password_renewpass_ok", "password_error_renewpass", "ReNewPassword");
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

function Check_password() {
    var newpass = jQuery("#NewPassword").val();
    var renewpass = jQuery("#ReNewPassword").val();
    var showstyle =document.getElementById("div_vcode").style.display; 
    if ( newpass == "" || renewpass == "" ) {
        if (newpass == "") {
            $('spPwdStrongTips').style.display = "none";
            $('divPwdStrong1').style.display = "none";
            $('divPwdStrong2').style.display = "none";
            $('divPwdStrong3').style.display = "none";
            ShowConfirmErrorMsg("password_error_newpass", 12, "NewPassword");
        }
        if (renewpass == "") {
            ShowConfirmErrorMsg("password_error_renewpass", 13, "ReNewPassword");
            $("input_password_renewpass_ok").style.display = "none";
        }        
          if(showstyle == "block"){ 
          var txtvcode = $F('txtVerifyCode');
            if(txtvcode==""){
              ShowConfirmErrorMsg("DIVshowError_code", 16, "txtVerifyCode");
              $("vcode_ok").style.display = "none";
             }
           }
         return  false;
    }

    if (!checkbluenew_confirm()) {
        return false;
    }

    if (!checkbluerenew_confirm()) {
        return false;
    }
    if(showstyle == "block"){
        var txtvcode = $F('txtVerifyCode');
        if(txtvcode==""){
          ShowConfirmErrorMsg("DIVshowError_code", 16, "txtVerifyCode");
          $("vcode_ok").style.display = "none";
          return  false;
        }
       if (!checkVerifyCode()) {
           return false;
       }
    }
    $("form1").onsubmit=function (){return  update_pwd("updatepwd");}
    $("submit_password").click();
    return true;
}

function   update_pwd(buttonflag){
    if(buttonflag=="updatepwd"){
        return  true;
    }else{
        return  false;
    }
    
    
}

function checkVerifyCode()
{   
    var vcode = $F('txtVerifyCode'); 
    $('vcode_ok').style.display = "none";
    if( !/(\W{2}|\W{4}|\w{2}|\w{4})/.test(vcode)) {
        show_vcode("imgVcode");
        //$('txtVerifyCode').value = '';
        ShowErrorMsg("DIVshowError_code", 3, "txtVerifyCode");
        return false;
    }
    var vcode_checker_ajax = new Ajax("p/vcode_checker.php");
    if(!vcode_checker_ajax.post('vcode='+vcode+'&type=0')) {
        show_vcode("imgVcode");
        //$('txtVerifyCode').value = '';
        ShowErrorMsg("DIVshowError_code", 3, "txtVerifyCode");
        return false;
    }

    $('DIVshowError_code').style.display = "none";
    $('DIVshowError_code').innerHTML = "";
    $('vcode_ok').className = "tip_yes";
    $('vcode_ok').style.display = "inline-block";
    return true;
}

function CheckdoSubmit_confirm(e) {
    var ev = window.event || e;
    if (ev.keyCode == 13) {
        Check_password(1);
    }
}

function txtPassword_strong_check() {
    var password = jQuery('#NewPassword').val();
    if (password.length == 0) {
        return;
    }
    if (password.length < 6) {
        $('password_error_newpass').style.display = "none";
        $('spPwdStrongTips').style.display = "inline";
        $('divPwdStrong1').style.display = "inline";
        jQuery('#divPwdStrong1').css("zoom", "1");
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "none";
        return;
    }
    if (password.length > 20){    
        $('password_error_newpass').innerHTML = msg_error[3];
        $('password_error_newpass').style.display = "inline-block";
        $('spPwdStrongTips').style.display = "none";
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "none";
        ShowConfirmErrorMsg("password_error_newpass", 4, "NewPassword");
        return ;
    }
    var chenum = checkStrong();
    $('password_error_newpass').style.display = "none";
    $('spPwdStrongTips').style.display = "inline";
    if (chenum == 0) {
        return;
    } else if (chenum == 1) {
        $('divPwdStrong1').style.display = "inline";
        jQuery('#divPwdStrong1').css("zoom", "1");
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "none";
    } else if (chenum == 2) {
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "inline";
        jQuery('#divPwdStrong2').css("zoom", "1");
        $('divPwdStrong3').style.display = "none";
    } else if (chenum >= 3) {
        $('divPwdStrong1').style.display = "none";
        $('divPwdStrong2').style.display = "none";
        $('divPwdStrong3').style.display = "inline";
        jQuery('#divPwdStrong3').css("zoom", "1");
    }
}

function  CheckvcodeBlue(obj,HTMLid,msgnum)
{

        var vcode = $F('txtVerifyCode');
        jQuery("#txtVerifyCode").attr("style", "");
       $('txtVerifyCode').className = "text";
        if(vcode == "")
        {
            $(HTMLid).style.display = "none";
            return;
        }
        checkVerifyCode();

}


function checkStrong() {
    var sPW = jQuery('#NewPassword').val();
    if (sPW.length < 1)
        return 0;
    Modes = 0;
    for (i = 0; i < sPW.length; i++) {
        Modes |= Evaluate(sPW.charCodeAt(i));
    }
    var num = bitTotal(Modes);
    return num;
}
function Evaluate(character) {
    if (character >= 48 && character <= 57)
        return 1;
    if (character >= 65 && character <= 90)
        return 2;
    if (character >= 97 && character <= 122)
        return 4;
    else
        return 8;
}

function bitTotal(num) {
    modes = 0;
    for (i = 0; i < 4; i++) {
        if (num & 1) modes++;
        num >>>= 1;
    }
    return modes;
}

function showConfirmErrorCode(code) {

    switch (code) {
        case 0:
            return;
        case 1:
            ShowConfirmErrorMsg("password_error", 5, "txtPassword");
            break;
        case 2:
            $("input_password_ok").style.display = "none";
            ShowConfirmErrorMsg("password_error", 2, "txtPassword");
            break;
         case 3:
            ShowConfirmErrorMsg("password_error_newpass", 17, "NewPassword");
            break;
        case 4:
            ShowErrorMsg("DIVshowError_code", 3, "txtVerifyCode");
            break;
        case 5:
            ShowErrorMsg("DIVshowError_code", 10, "txtVerifyCode");
            break;
        case 8:
            ShowErrorMsg("password_error_newpass", 6, "NewPassword");
            break;
        default:
            break;
    }
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

function resend_email_vcode() {
    var resend_ajax = new Ajax("p/resend_findpwd_email.php?t="+new Date().getTime());
    var resendissucc = Number(resend_ajax.post('email=' + $F('Emailhid') + '&submit_type=5'));
    switch (resendissucc) {
        case 10:
            alert(msg_error[14]);
            break;
        case 16:
            alert(msg_error[6]);
            break;
        default:
            alert(msg_error[15]);
            break;
    }
}