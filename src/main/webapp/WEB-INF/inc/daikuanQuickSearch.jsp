<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="assistant ground">
    <div class="credit_title"> <span class="credit_title1 font_f">我要贷款</span></div>
    <table width="100%" border="1" class="Loansearch1 Loansquiz9">
    	<tr>
        <td width="31%" align="right" valign="middle">职业身份：</td>
        <td width="69%" align="left" valign="middle"><div id="tm2008style">
	<select name="identity" id="identity" class="proSearch" readonly="true">
		<option value="0" >不限职业</option>
		<option value="1">企业主</option>
		<option value="2" >个体户</option>
		<option value="3" >上班族</option>
	</select>
</div></td>
      </tr>
      <tr>
        <td width="31%" align="right" valign="middle">贷款用途：</td>
        <td width="69%" align="left" valign="middle"><div id="tm2008style">
	<select name="loanUse" id="loanUse" class="proSearch" readonly="true">
		<option value="0">不限</option>
		<option value="1" >经营贷款</option>
		<option value="2" >消费贷款</option>
		<option value="3" >购车贷款</option>
		<option value="4" >购房贷款</option>
	</select>
</div></td>
      </tr>
      <tr>
        <td align="right" valign="middle">贷款金额：</td>
         <td width="69%" align="left" valign="middle"><div id="tm2008style">
	<select name="loanAmt" id="loanAmt" class="proSearch">
		<option value="3" >3万元</option>
		<option value="5" >5万元</option>
		<option value="10" >10万元</option>
		<option value="20" >20万元</option>
		<option value="50" >50万元</option>
		<option value="100" >100万元</option>
		<option value="" >其他</option>
	</select>
</div></td>
      </tr>
      <tr>
        <td align="right" valign="middle">贷款期限：</td>
         <td width="69%" align="left" valign="middle"><div id="tm2008style">
	<select name="loanIssue" id="loanIssue" class="proSearch" readonly="true">
		<option value="3">3个月</option>
		<option value="6" >6个月</option>
		<option value="12">12个月</option>
		<option value="24" >2年</option>
		<option value="36" >3年</option>
		<option value="60" >5年</option>
		<option value="120" >10年</option>
	</select>
</div></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="left" valign="middle"><a style="cursor: pointer;" onclick="searchProduct()" ><img src="images/img34.jpg" width="94" height="29" /></a></td>
      </tr>
    </table>
  </div>