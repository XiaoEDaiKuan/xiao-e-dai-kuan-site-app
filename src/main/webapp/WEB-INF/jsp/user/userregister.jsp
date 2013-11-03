<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户注册</title>
<%@include file="../../inc/globalScript.jsp" %>
<link href="css/login.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div class="top">
  <div class="logo"><a href="index.html"></a></div>
  <div class="registered font_f">会员注册</div>
</div>
<div class="registered_title">
  <div class="registered_title1"></div>
</div>
<div class="registered_title2">
  <div class="registered_title3"> <font>欢迎注册玖富云金融平台</font> <span>已有账号，点此<a href="loginView">登录</a></span> </div>
</div>
<form  action="createUser"   autocomplete="off" id="login_form" >
<div class="registered_main">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
    <tr><td width="12%"></td><td width="88%">带<span style="color:red;padding-right:8px">*</span>项为必填</td></tr>
    <tr>
      <th width="12%"><span style="color:red;padding-right:8px">*</span>手机：</th>
      <td width="88%">
          <input name="mobileNO" type="text" value="" class="input" id="login_mobile_no" />  
          <span id="mobile_ok" class="tip_yes" style="display:none;"></span>
          <span id="mobile_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>姓名：</th>
      <td>
          <input name="custName" type="text" value="" class="input input1" id="login_custname" />
          <span id="custname_ok" class="tip_yes" style="display:none;"></span>
          <span id="custname_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>密码：</th>
      <td>
           <input name="logonPasswd" type="password" class="input" MaxLength="18" id="login_passwd" />
          <span id="passwd_ok" class="tip_yes" style="display:none;"></span>
          <span id="passwd_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>确认密码：</th>
      <td>
          <input name="logonPasswd2" type="password" class="input" MaxLength="18" id="login_passwd2"  />
          <span id="passwd_ok" class="tip_yes" style="display:none;"></span>
          <span id="passwd_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>证件类型：</th>
      <td><div id="tm2008style">
      	<select name="idType" id="idType">
			<option value="0">身份证</option>
		</select></div></td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>证件号码：</th>
      <td>
          <input name="idNO" type="text" value="" class="input" id="login_idno" />
          <span id="idno_ok" class="tip_yes" style="display:none;"></span>
          <span id="idno_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th><span style="color:red;padding-right:8px">*</span>电子邮件：</th>
      <td>
           <input name="email" type="text" value="" class="input" id="login_email" />
           <span id="email_ok" class="tip_yes" style="display:none;"></span>
           <span id="email_error" class="e9" style="display:none;"></span>
      </td>
    </tr>
    <tr>
      <th>邮编：</th>
      <td><input name="postCode" type="text" value="" class="input" id="login_postcode" /></td>
    </tr>
    <tr>
      <th>住址：</th>
      <td><input name="address" type="text" value="" class="input"  id="login_address" /></td>
    </tr>
    
    <tr>
    	<th><span style="color:red;padding-right:8px">*</span>验证码：</th>
       	<td>
       	      <input type="text" name="captcha"  class="input" style="width:90px" id="login_captcha"/>
       	      <img style="width:107px;height:28px" id="captchaimg" src="handleCaptcha" alt="captcha" onclick="javascript:reloadCaptcha()"/>
           <span id="captcha_ok" class="tip_yes" style="display:none;"></span>
           <span id="captcha_error" class="e9" style="display:none;"></span>
       </td>
	</tr> 
	
	<tr>
    	<th></th>
       	<td>
       	<div style="vertical-align: middle;">
       	<input type="checkbox" style="width:22px; height:22px;vertical-align: middle;" name="CheckboxGroup1" value="复选框" id="login_term" checked="checked" />
    	<font>我同意以下服务条款</font>           
    	<span id="term_error" class="e9" style="display:none;"></span>
    	</div><br />
  		
  		<div class="terms" style="display:block;">
  		
  		      <p>北京玖富时代投资顾问有限公司依照本服务条款向您提供9F(www.9fbank.com)的服务。请您使用9F之前敬请仔细阅本服务条款及法律声明和隐私政策 。通过访问或使用9F，您即明确同意遵守本服务条款以及经参引而并入其中的所有条款、政策以及指南，并受前述规则的约束（"本服务条款"）。如果您不接受本服务条款的全部规定，则请勿使用9F。</p>
      <p>您只有完全同意所有服务条款并完成注册程序，才能成为本服务的用户（"用户"）并使用相应服务。您在注册程序过程中点击"同意9F服务条款"按钮即表示您与9F达成协议，完全接受本服务条款。您一旦使用9F的服务，即视为您已了解并完全同意本服务条款各项内容，包括9F对服务条款随时做的任何修改。除非另有规定，否则任何变更或修改将在修订内容于9F发布之时立即生效，您对9F的使用、继续使用将表明您接受此等变更或修改。如您不同意本服务协议及/或随时对其的修改、及/或法律声明，您可以主动取消9F提供的服务。
为了了解适用于您使用9F的条款和条件，您应不时地审阅本服务条款以及经参引而并入其中的政策与文件。
</p>
<p>一．服务内容</p>
<p>1.1 9F的具体服务内容由9F根据实际情况提供，例如图片、文章、评论、积分抽奖活动等，并定期或不定期根据用户的意愿以电子邮件的方式为用户提供活动信息，供广大网民朋友学习、交流平台。9F对提供的服务拥有最终解释权。</p>
<p>1.2 9F保留根据实际情况随时调整9F平台提供的服务种类、形式。9F不承担因业务调整给用户造成的损失。9F保留变更、中断或终止部分网络服务的权利。</p>
<p>1.3 9F在9F上向其用户提供相关网络服务，与相关网络服务有关的设备（如个人电脑及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费）均由用户自行负担。</p>
<p>二．内容使用权</p>
<p>2.1 我们鼓励用户充分利用9F平台自由地张贴和共享他们自己的信息。您可以自由张贴从9F个人主页或其他网站复制的图片等内容，但这些内容必须属于公共领域或者您拥有这些内容的所有权或使用权。</p>
<p>2.2 用户不得在自己的个人主页或社区中张贴他人享有版权保护的内容。</p>
<p>2.3 9F对用户提供内容使用权参见第七条知识产权的相关约定。</p>
<p>三．注册信息和隐私保护</p>
<p>3.1 用户在申请使用9F服务时，必须提供真实的个人资料，并不断更新注册资料。如果因注册信息不真实而引起的问题及其后果，9F不承担任何责任。倘若9F发现用户的注册资料是虚假、不准确或不完整的，则可自行决定终止该用户的帐号。</p>
<p>3.2 用户注册成功后，9F将提供用户一个用户帐号及相应的密码，该用户帐号和密码由用户自行负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。</p>
<p>3.3 因黑客行为、计算机病毒侵入或发作或您保管疏忽致使帐号、密码被他人非法使用、盗用、篡改的或丢失的，9F不承担责任。如您发现任何非法使用用户帐号或安全漏洞的情况，请立即与9F联系。</p>
<p>3.4 保护用户隐私是9F的重点原则，9F通过技术手段、提供隐私保护服务功能、强化内部管理等办法充分保护用户的个人资料安全。</p>
<p>3.5 用户不可以通过自动方式创建帐户，也不可以对帐户使用自动系统执行操作，否则，9F可自行决定终止该用户的帐号。</p>
<p>3.6 9F保证不对外公开或向第三方提供用户注册的个人资料，及用户在使用服务时存储的非公开内容，但下列情况除外：</p>
<p>（1）事先获得用户的明确授权；</p>
<p>（2）按照相关司法机构或政府主管部门的要求；</p>
<p>（3）只有透露你的个人资料，才能提供你所要求的产品和服务；</p> 
<p>（4）以维护9F合法权益之目的；</p>
<p>（5）维护社会公众利益；</p>
<p>（6）符合其他合法要求；</p>
<p>（7）由于与本网站链接的其它网站所造成用户资料泄露及由此而导致的任何法律争议和后果。</p>
<p>3.7 6个月未登录的帐号，9F保留关闭的权利。</p>
<p>四．社区准则</p>
<p>4.1 用户在使用9F服务过程中，必须遵循国家的相关法律法规，不通过本网站发布、上传、散播、分发、存储、创建或以其它方式公开以下各项：</p>
<p>（1）反对宪法所确定的基本原则的；</p>　　　 
<p>（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p>　　　 
<p>（3）损害国家荣誉和利益的；</p>　　　 
<p>（4）煽动民族仇恨、民族歧视，破坏民族团结的；</p>　　　 
<p>（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</p>　　　 
<p>（6）散布谣言，扰乱社会秩序，破坏社会稳定的；</p>　　　 
<p>（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的、欺诈性的或以其它令人反感的讯息、数据、信息、文本、音乐、声音、照片、图形、代码或其它材料（"内容"）；</p>　　　 
<p>（8）侮辱或者诽谤他人，侵害他人合法权益的；</p>　　　 
<p>（9）其他违反宪法和法律、行政法规或规章制度的；</p>
<p>（10）可能侵犯他人的专利、商标、商业秘密、版权或其它知识产权或专有权利的内容；</p> 
<p>（11）假冒任何人或实体或以其它方式歪曲您与任何人或实体之关联性的内容；</p>
<p>（12）未经请求而擅自提供的促销信息、政治活动、广告或意见征集； </p>
<p>（13）任何第三方的私人信息，包括但不限于地址、电话号码、电子邮件地址、身份证号以及信用卡卡号；</p> 
<p>（14）病毒、不可靠数据或其它有害的、破坏性的或危害性的文件；</p> 
<p>（15）与内容所在的互动区域的话题不相关的内容； </p>
<p>（16）依9F的自行判断，足以令人反感的内容，或者限制或妨碍他人使用或享受互动区域或本网站的内容，或者可能使9F或其关联方或用户遭致任何类型损害或责任的内容；</p> 
<p>（17）包含法律或行政法规禁止内容的内容。 </p>
<p>4.2 用户不得利用本站的服务从事下列危害计算机信息网络安全的活动：</p>
<p>（1）未经允许，进入计算机信息网络或者使用计算机信息网络资源；</p> 　　　
<p>（2）未经允许，对计算机信息网络功能进行删除、修改或者增加；</p> 　　　 
<p>（3）未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加；</p>
<p>（4）故意制作、传播计算机病毒等破坏性程序； </p>
<p>（5）其他危害计算机信息网络安全的行为。</p>
<p>4.3 9F保留经自行裁决和判断而过滤、编辑或移除任何上述内容的权利。</p> 
<p>4.4 9F对用户或任何第三方发布、存储或上传的任何内容或其任何损失或损害，均不负责也不承担责任，对用户可能遇到的任何错误、中伤、诽谤、诬蔑、不作为、谬误、淫秽、色情或亵渎，9F也不承担责任。作为网络服务的提供者，9F对其用户在任何论坛、个人主页或其它互动区域提供的任何陈述、声明或内容均不承担责任。9F保留在任何时候为任何理由而不经通知地移除、筛查或编辑本网站上发布或存储的任何内容的权利，且其具有绝对的裁量权如此行为，您须自行负责备份和替换在本网站发布或存储的任何内容，成本和费用自理。</p>
<p>4.5 违反上述规定使用互动区域或本网站其它部分的，将构成对本网站条款的违反，并且除其它结果外，还可能导致您使用互动区域和／或本网站的权利的终止或中止。为了配合政府的合法要求、传票或法院指令，为了保护9F的系统和客户，或者为了确保9F业务和系统的完整与操作，9F可能获取和披露其认为必要或恰当的任何信息，包括但不限于用户的个人信息（即：姓名、电子邮箱地址，等等）、IP地址和流量信息、使用历史以及发布内容。9F对任何此等信息的披露权应优先于9F隐私政策的任何规定。</p> 
<p>4.6 除非与9F单独签订合同，否则不得将9F上的任何信息用于商业目的。</p>
<p>4.7 9F仅供个人用户使用。</p>
<p>4.8 用户须对自己在使用9F服务过程中的行为承担法律责任。若用户为限制行为能力或无行为能力者，用户的法定监护人应承担相应的法律责任。</p>
<p>4.9 用户影响系统总体稳定性或完整性的操作可能会被暂停或终止，直到问题得到解决。</p>
<p>五．免责声明</p>
<p>5.1 互联网是一个开放平台，用户将文章或照片等个人资料上传到互联网上，有可能会被其他组织或个人复制、转载、擅改或做其它非法用途，用户必须充分意识此类风险的存在。用户明确同意，其使用9F服务所存在的风险将完全由其自己承担；因其使用9F服务而产生的一切后果也由其自己承担，9F对用户不承担任何责任。</p>
<p>5.2 9F对任何他人的违反道德的或非法的内容或行为或对他人权利（包括但不限于知识产权）的侵犯不承担责任；并对任何第三方通过9F发送服务或在服务中包含的任何内容不承担责任。</p>
<p>5.3 9F对用户不提供以下保证：包括但不限于不保证服务一定能满足用户的要求；也不保证服务不会中断；对服务的及时性、安全性、准确性也都不作保证。对于因不可抗力或任何非9F原因造成的网络服务中断或其他缺陷，9F不承担任何责任。</p> 
<p>5.4 用户明确同意，其使用9F服务所存在的风险及产生的一切后果由其自己承担。</p>
<p>5.5 任何情况下，因使用9F而引起或与使用9F有关的9F的责任总额，无论是基于合同、保证、侵权（包括主动、被动或推定过失）、产品责任、严格责任或其它理论，均不得超过您因访问或使用本网站而向9F支付的任何报酬（如果有的话）。</p>
<p>六．服务变更、中断或终止</p>
<p>6.1 如因系统维护或升级的需要而需暂停网络服务、服务功能的调整，9F将尽可能在网站上进行通告。由于用户未能及时流量通告信息而造成的损失，9F不承担任何责任。</p>
<p>6.2 用户同意，9F可自行决定变更提供服务的内容，9F可自行决定授权第三方向用户提供原本由9F提供的服务，不需向用户承担任何因变更服务所产生的责任。</p>
<p>6.3 如发生下列任何一种情形，9F有权单方面中断或终止向用户提供服务而无需通知用户，无需对用户或第三方承担任何责任：</p>
<p>◇ 用户提供的个人资料不真实；</p>
<p>◇ 用户违反本服务条款；</p>
<p>◇ 未经9F同意，将9F平台用于商业目的。</p>
<p>6.4 用户可随时根据需要通知9F终止提供服务，用户服务终止后，用户使用服务的权利同时终止。自用户终止之日起，9F不再向用户承担任何责任。</p>
<p>七．知识产权</p>
<p>7.1 用户作如下声明和保证：</p>
<p>（i）对于发布或以其它方式传播的内容，拥有并掌控着所有的权利，或者您以其它方式拥有在9F发布和传播此等内容的合法权利；</p>
<p>（ii）此等内容是合法的、真实的、准确的、非误导性的；</p>
<p>（iii）使用和发布此等内容或以其它方式传播此等内容不违反本服务条款，也不侵犯任何人或实体的任何权利或造成对任何人或实体的伤害。</p>
<p>7.2 除权利人外，其他任何人未经权利人事先书面同意，不能擅自复制、传播这些内容，或用于其他任何商业目的，所有这些资料或资料的任何部分仅可作为个人或非商业用途而保存在某台计算机内。否则，9F及或权利人将追究侵权者法律责任。</p>
<p>7.3 若用户向9F发布或传播内容，或通过本网站发布或传播内容，用户在保留精神权利情况下，用户特此同意：</p>
<p>（1）向9F及其关联方在免转让费的基础上转让如下权利，即：可使用、复制、修改、改编、翻译、传播、发表此等内容，从此等内容创建派生作品，以及在全世界范围内通过任何媒介（现在已知的或今后发明的）公开展示和表演此等内容；</p>
<p>（2）授予9F及其关联方和再许可人一项权利，可依他们的选择而使用用户有关此等内容而提交的名称；</p>
<p>（3）用户进一步授予9F以下权利，即：对因违反本服务条款而侵犯您，或者9F就内容享有的权利的任何人或实体，将按法律追究其责任。 </p>
<p>7.4 用户提交的内容、图片等将被视为非保密的，9F无义务将此等内容作为专有信息对待。在不限制前述规定的前提下，9F保留以其认为适当的方式使用内容的权利，包括但不限于删除、编辑、更改、不予采纳或拒绝发布。9F无义务就您提交的内容而向您付款；一旦内容已向9F提交，9F也不向您提供对在9F展示内容进行编辑、删除或作其它修改的机会。</p>
<p>7.5 如有著作权人发现用户在9F发表的内容侵犯其著作权，并依相关法律、行政法规的规定向9F发出书面通知的，9F有权在不事先通知用户的情况下自行移除相关内容，并依法保留相关数据。用户不得就该种移除行为向9F主张任何赔偿。</p>
<p>7.6 若用户对7.5条指向内容依法享有发表权，可以向9F及7.5条指向之著作权人一并发出说明被移除内容不侵犯其著作权的书面通知，通知包含如下内容：明确的身份证明、住址、联系方式；被移除内容的合法性证明；被移除内容在互联网上的位置；通知内容的真实性声明。9F收到该通知后，9F有权决定是否恢复被移除内容。</p>
<p>7.7 9F在此提示用户及著作权人：7.5、7.6书面通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。</p>
<p>八．服务条款的完善和修改</p>
<p>8.1 9F有权根据互联网的发展和中华人民共和国有关法律、法规的变化，不时地完善和修改9F服务条款。</p>
<p>8.2 9F保留随时修改服务条款的权利，用户在使用9F平台服务时，有必要对最新的9F服务条款进行仔细阅读和重新确认，当发生有关争议时，请以最新的服务条款为准。</p>
<p>九．特别约定</p>
<p>9.1 用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方的合法权益的情形时，9F有权直接删除该等违反规定之信息，并可以暂停或终止向该用户提供服务。</p>
<p>9.2 若用户利用本服务从事任何违法或侵权行为，由用户自行承担全部责任，因此给9F或任何第三方造成任何损失，用户应负责全额赔偿。并尽力使9F免受损害。</p>
<p>9.3 所有发给用户的通告或通知都可以通过重要页面的公告、通告、电子邮件以及常规信件的形式传送。</p>
<p>9.4 本服务条款之效力、解释、执行均适用中华人民共和国法律。</p>
<p>9.5 如发生争议，如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向9F所在地的人民法院提起诉讼。</p>
<p>9.6 本服务条款中的标题仅为方便而设，在解释本服务条款时应被忽略。本服务条款最终解释权归9F所有。</p>
  		
  		
  		</div>
       	</td>
	</tr> 
	<tr>
    	<th></th>
       	<td>
       	<input name="" type="submit" value="" class="reg_btn" style="width:100px;height:30px"  id="login_submit"   /></td>
	</tr>  
  </table>
</div>
</form>
<div class="footer2">
  <div class="footer2_2"><font>版权所有：北京玖富时代投资顾问有限公司 copyright 2012</font><br />
    公司总部地址：北京朝阳区麦子店街37号盛福大厦2580<br />
    传真：010-85276916&nbsp;&nbsp;&nbsp;&nbsp;邮编：100000</div>
</div>

<script type="text/javascript" language="JavaScript">
    function reloadCaptcha() {  
        var obj = document.getElementById('captchaimg');  
        obj.src = "handleCaptcha?time=" + (new Date()).getTime();
    }  
  </script>
</body>
</html>
