<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>直接贷</title>
<link href="cssnew/publicise.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="Scripts/jquery-1.8.0.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
                 var cust_name_flag=false;
                 var mobile_falg=false;
                 var provinceList_flag=false;
                 var loan_issue_flag=false;
                 var loan_amt_flag=false;
                   
                 $("#applyName").click(
                                      function(){
                                          if($("#applyName").val()=="您的姓名"){
                                            $("#applyName").val("");
                                            }
                                      }
                  );                                         
                 
                 $("#applyTelephone").click(
                                      function(){
                                      if($("#applyTelephone").val()=="您的手机号"){
                                            $("#applyTelephone").val("");
                                          }  
                                      }
                  );                                         

                 $("#loan_amt").click(
                                      function(){
                                        if($("#loan_amt").val()=="申请额度（万元）"){
                                            $("#loan_amt").val("");
                                            }
                                      }
                  );         
                                                  
                 $("#loan_issue").click(
                                      function(){
                                      if($("#loan_issue").val()=="贷款期限（个月）"){
                                            $("#loan_issue").val("");
                                          }  
                                      }
                  );         

	             $("#applyName").blur(
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
                                                     $("#applyName_error").html("<font color='red'>请输入2-5个汉字</font>");
                                                     $("#applyName").val("");
                                                     cust_name_flag=false;
                                                     $("#applyName").val("您的姓名");  
                                                  }
                                                  
                                               }
                                   );

          $('#applyTelephone').blur(
                                      function(){
                                                   var pattern = /^1[3|4|5|8][0-9]\d{8}$/;
                                                  
                                                    mobile_falg=pattern.test($("#applyTelephone").val());
                                               
                                                    if(!mobile_falg){
                                                        $("#applyTelephone_error").html("<font color='red'>请输入正确的手机号码</font>");
                                                        $("#applyTelephone_error").css('display','inline-block');
                                                        $("#applyTelephone_error").addClass("wrong_box");
                                                        $("#applyTelephone").val("您的手机号");
                                                     }else {
                                                        $("#applyTelephone_error").html("");
                                                        $("#applyTelephone_error").css('display','none');
                                                        $("#applyTelephone_error").removeClass("wrong_box clearfix");
                                                        mobile_falg=true;
                                                     }
                                               }
                                   );

                 $('#loan_amt').blur(
                                     function(){   

                                                       
                                                   var pattern = /^(([1-9]\d*)|0)(\.\d{1,2})?$/;
                                                  
                                                  loan_amt_flag=pattern.test($("#loan_amt").val());
                                               
                                                    if(!loan_amt_flag){
                                                        $("#loan_amt_error").html("<font color='red'>请输入正确的贷款金额</font>");
                                                        $("#loan_amt_error").css('display','inline-block');
                                                        $("#loan_amt_error").addClass("wrong_box");
                                                        $("#loan_amt").val("申请额度（万元）");
                                                        loan_amt_flag=false;
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
                                                        $("#loan_issue_error").html("<font color='red'>请输入正确的贷款期限</font>");
                                                        $("#loan_issue_error").css('display','inline-block');
                                                        $("#loan_issue_error").addClass("wrong_box");
                                                        $("#loan_issue").val("贷款期限（个月）");
                                                        loan_issue_flag=false;
                                                     }else {
                                                        $("#loan_issue_error").html("");
                                                        $("#loan_issue_error").css('display','none');
                                                        $("#loan_issue_error").removeClass("wrong_box clearfix");
                                                        loan_issue_flag=true;
                                                     }
                                      
                                         }
                    );

             $('#provinceList').blur(
                                      function(){
                                      
                                                  if($("#provinceList").val()=='' || $("#cityList").val()==''  ){
                                                     $("#provinceList_ok").css('display','none');
                                                     $("#provinceList_error").css('display','inline-block');
                                                     $("#provinceList_error").addClass("wrong_box clearfix");
                                                     $("#provinceList_error").html("<font color='red'>请选择正确的省份及城市</font>");
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
                                                     $("#provinceList_error").html("<font color='red'>请选择正确的省份及城市</font>");
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


           $('#zhijiedai_submit').click(
                                    function(){
                                        
                                                 if(mobile_falg && cust_name_flag &&  provinceList_flag &&  loan_issue_flag 
                                                     &&  loan_amt_flag)

                                                  {
                                                    $('#directOrder').submit();
     
                                                 }
                                          
            
                                              }
                                  );        


		$("#provinceList").change(function(){
			var checkValue = $(this).val();
			if (checkValue) {
				$.ajax({
					url: 'loadCities',
					type: 'post',
					data: {
						provinceId: checkValue
					},
					dataType: "json",
					success: function (data) {
						$("#cityList").find("option").each(function(){
				            $(this).remove();
				    	});
						$("<option value=''>所在城市</option>").appendTo($("#cityList"));
						for (var i = 0; i < data.length; i++) {
							$("<option value='" + data[i].id +"'>" + data[i].name + "</option>").appendTo($("#cityList"));
						}
					}
				});
			}
		});
	  }
	);
	
	
	
	
</script>
</head>

<body>
<div class="header"> <span></span> <a href="index.html">9F首页</a> </div>
<div class="banner_box clear">
  <div class="banner float_l"><img src="images/banner.jpg" width="627" height="382" /></div>
  <div class="login float_r">
    <div class="login_title"><b>直接贷款</b>
      <p>Apply for a loan directly.</p>
    </div>
    <form action="directOrder" method="post" id="directOrder">
    <ul class="login_content">
      <li>
        <input name="applyName" type="text" value="您的姓名" id="applyName"/>
              <span id="applyName_ok" class="tip_yes" style="display:none;"></span>
              <span id="applyName_error" class="e9" style="display:none;"></span>
      </li>
      
      <li>
        <input name="applyTelephone" type="text" value="您的手机号"  id="applyTelephone" />
                <span id="applyTelephone_ok" class="tip_yes" style="display:none;"></span>
                <span id="applyTelephone_error" class="e9" style="display:none;"></span>
        
      </li>
      
      <li>
        <select name="provinceId" id="provinceList">
          <option value="">所在省份</option>
          <c:forEach var="prov" items="${provinces}">
	      <option value="${prov.id}">${prov.name}</option>
	      </c:forEach>
        </select>
        <select name="cityId" id="cityList">
          <option value="">所在城市</option>
        </select>
                <span id="provinceList_ok" class="tip_yes" style="display:none;"></span>
                <span id="provinceList_error" class="e9" style="display:none;"></span>
        
      </li>
      
      <li>
        <input name="applyAmt" type="text" value="申请额度（万元）" class="input1" id="loan_amt" />
             <span id="loan_amt_ok" class="tip_yes" style="display:none;"></span>
             <span id="loan_amt_error" class="e9" style="display:none;"></span>
      </li>
      
      <li>
        <input name="loanTime" type="text" value="贷款期限（个月）" class="input1" id="loan_issue" />
                <span id="loan_issue_ok" class="tip_yes" style="display:none;"></span>
                <span id="loan_issue_error" class="e9" style="display:none;"></span>
      </li>
      
      <li>
        <input type="button" class="btn"  id="zhijiedai_submit" />
      </li>
    </ul>
    </form>
  </div>
</div>
<div class="guild font_w"><b>网上申请：</b><span>1.  填写联系方式</span><span>2.  9F客服联系您</span><span class="bg">3.  提交资料，审批放款</span></div>
<div class="main clear">
  <div class="left float_l">
    <div class="bus mar_b">
      <h1>经营贷申请条件</h1>
      <ul>
        <li>有效证件</li>
        <li>年满18周岁</li>
        <li>现居住地居住时间满6个月</li>
        <li>提供营业证明</li>
        <li>营业时间满半年</li>
      </ul>
    </div>
    <div class="bus">
      <h1>消费贷申请条件</h1>
      <ul>
        <li>有效证件</li>
        <li>年满18周岁</li>
        <li>现单位工作证明</li>
        <li>提供收入证明</li>
        <li>月收入2000以上</li>
      </ul>
    </div>
  </div>
  <div class="right float_r">
    <h1 style="text-align: center">9大用户</h1>
    <div class="user_content">
      <div class="user1"><p><img src="images/user1.jpg" width="140" height="106" /></p>
      <font>私营业主用户</font></div>
      <div class="user1"><p><img src="images/user2.jpg" width="140" height="106" /></p>
      <font>工薪族用户</font></div>
      <div class="user1"><p><img src="images/user3.jpg" width="140" height="106" /></p>
      <font>房产业主用户</font></div>
      <div class="user1"><p><img src="images/user4.jpg" width="140" height="106" /></p>
      <font>小家庭用户</font></div>
      <div class="user1"><p><img src="images/user5.jpg" width="140" height="106" /></p>
      <font>购车用户</font></div>
      <div class="user1"><p><img src="images/user6.jpg" width="140" height="106" /></p>
      <font>信用卡用户 </font></div>
      <div class="user1"><p><img src="images/user7.jpg" width="140" height="106" /></p>
      <font>装修用户</font></div>
      <div class="user1"><p><img src="images/user8.jpg" width="140" height="106" /></p>
      <font>公务员用户</font></div>
      <div class="user1"><p><img src="images/user9.jpg" width="140" height="106" /></p>
      <font>POS商户</font></div>
    </div>
  </div>
</div>
<div class="footer2">
  <div class="footer2_1">
  	<img src="images/beida.png" width="121" height="44" />
  	<img src="images/itfusc.png" width="109" height="35" />
  	<img src="images/mm.png" width="84" height="40" />
  	<a href="http://www.9floan.com/Content/Help/credit.html" target="_blank"><img src="images/micro.png" width="174" height="26" /></a>
  	<a href="http://www.9floan.com/Content/Help/safe.html" target="_blank"><img src="images/anquan.png" width="84" height="40" /></a>
  	<a href="https://ss.knet.cn/verifyseal.dll?sn=e13091811010042535yjkx000000&comefrom=verify&trustKey=dn&trustValue=www.9fbank.com" target="_blank"><img src="images/kexin.png" width="109" height="35" /></a>
  </div>
  <div class="footer2_2"><font>版权所有：北京玖富时代投资顾问有限公司 copyright&copy;2012　 京ICP备07003840</font><br />技术服务商：北京九富科技有限公司<br />公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000</div>
</div>

</body>
</html>
