<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贷款攻略</title>
<%@include file="../../inc/globalScript.jsp" %>
</head>

<body>
<jsp:include page="../../inc/globalHeader.jsp">
	<jsp:param name="index" value="5" />
</jsp:include>
<%@include file="../../inc/zhuanquMenu.jsp" %>

<script type="text/javascript" language="JavaScript">
 document.getElementById('xinshou').className="curr";
 
</script>

<div class="Fuzzysearch">
	<div class="top Fuzzysearch1">
    	<div class="application ClearFix">
        	<div class="applicationright">
               <!-- 贷款助手 -->
			<%@include file="../../inc/daikuanTools.jsp"%>
			<!-- 我要贷款查询 -->
			<%@include file="../../inc/daikuanQuickSearch.jsp"%>
    </div>
    <div class="applicationleft">
            <div class="ask ground Loansquiz10">
                	<div class="Theloanright9">
            
                         <h1>抵押物价值以及存管问题</h1>
                        <h2>时间:2013-9-29&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源:9F整理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>

                        <p>9F带着大家一起来了解抵押贷款的额度以及抵押物存管问题。</p>
                        <p>1.限额问题</p>
                        <p>抵押贷款限额是指贷款的最高额度，它是依据抵押物的估价值与抵押率测算出来的。</p>
                        <p>2.贷款限额计算</p>
                        <p>其公式为；贷款限额=抵押物的估计值×抵押率</p>
                        <p>借款人的贷款金额须在测算的贷款限额之内，否则会形成超值贷款，给贷款归还带来隐蔽风险。因此，抵押贷款金额的多少取决于抵押物价值的多少和抵押率的高低。</p>
                        <p>3.抵押物被征用、灭失或被毁损了该怎么办</p>
                        <p>关于抵押物灭失、毁损的情况下，抵押权是否存在可以分为三种情况分别对待。第一种情况，抵押物的灭失、毁损是由于抵押人的行为所致，抵押权人有权要求抵押人提供与抵押物价值相应的担保。第二种情况，抵押物的灭失、毁损非抵押人的行为所致，其抵押物的价值转化为其他形态时，因抵押权设定在抵押物上，其他形态的价值应当为抵押物的代位物，抵押权人可以就代位物行使抵押权。抵押权的效力及于因抵押物灭失、毁损所得的赔偿金、保险金等代位物，抵押权人有权以赔偿金、保险金作为实现债权的担保。第三种情况，抵押物的灭失、毁损非因抵押人的行为所致，又没有得到赔偿金、保险金的，抵押权因抵押物的灭失、毁损而消灭。征用是指国家为社会公共利益依法有偿地、强制性地将公民、法人或者其他组织的财产征为国家所有的行为。例如，国家征用土地，应当依法按照被征用土地的原用途给予补偿；被征用土地上的建筑物和青苗补偿费，按照省、自治区、直辖市规定的标准给予补偿。因此，抵押物被征用的，抵押人将得到补偿费，适用上述第二种情况，补偿费应当作为债权的担保，抵押权仍然存在于抵押物的补偿费上。</p>

                    <div>
                </div>
            </div>
            

    </div>
</div>
</div>
</div>

<%@include file="../../inc/globalFooterMenu.jsp" %>
<%@include file="../../inc/globalFooter.jsp" %>
</body>
</html>
