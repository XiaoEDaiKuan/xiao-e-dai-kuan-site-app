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
 document.getElementById('xiaofei').className="curr";
 
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
                	<div class="Theloanright10">
                    	<div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=21" name="" target="_blank">消费贷款注意事项</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>消费贷款需要准备的资料,1）借款人夫妻双方、产权人(共有人)夫妻双方的身份证、户口本、婚姻证原件及复印件(借款人如离异提供离婚证及离婚协议；丧偶提供丧偶证明及继承公证书) 2）收入证明和近3个月工资单、单位营业执照副本复印件加盖公章，且经过年检；3）所抵押房屋的产权证及原购房合同原件（购房发票原件）及复印件，央产房需提供房屋上市证明；4) 贷款消费用途；5）外省市居民需提供暂住证及长期居住证明；7）借款人学历为大专以上的提供学历证明；     
                            </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=22" target="_blank">消费贷款最新情况</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>利率普遍上浮 ,2012年10月，个人消费类贷款利率普遍上浮。包括车贷、房屋装修贷款，工行、农行、中行、建行等国有银行利率普遍上浮10%至15%，股份制银行则大多上浮20%到30%；甚至传出首套房贷优惠也可能要取消的消息。至于个人经营类贷款利率上浮更加厉害，将达30%-40%，而个人信用消费贷款在基准利率基础上上浮最高的达到50%。
                            </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=23" target="_blank">消费贷款申请过程</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>申请资料,（1） 借款人的有效身份证件原件和复印件；（2） 当地常住户口或有效居住的证明材料；（3） 借款人贷款偿还能力证明材料。如借款人所在单位出具的收入证明、借款人纳税单、保险单。（4） 借款人获得质押、抵押额度所需的质押权利、抵押物清单及权属证明文件，权属人及财产共有人同意质押、抵押的书面文件；（5） 借款人获得保证额度所需的保证人同意提供担保的书面文件；（6） 保证人的资信证明材料；（7） 社会认可的评估部门出具的抵押物评估报告；（8） 商业银行规定的其他文件和资料。 </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=24" target="_blank">消费贷款基本介绍</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>1.定义   消费贷款也叫消费者贷款，主要指的是用于留学贷款、房屋装修、购买耐用品乃至买车等方面的个人贷款，从种类上看，消费贷款包括住宅抵押贷款、非住房贷款和信用卡贷款。具有消费用途广泛、贷款额度较高、贷款期限较长等特点。
                            </p>
                        </div>
                        <div class="Theloanright9 Theloanright11">
                        	<h1><a href="gonglueDT?gonglueID=25" target="_blank">消费贷款动态</a></h1>
                            <h2>来源：9F整理        时间：2013/10/10</h2>
                            <p>银行回应    农业银行、工商银行、中信银行、天津农商行在本市的首套房贷眼下仍然延续基准利率7.05%基础上再八五折的标准。而招商银行、建设银行的首套房贷则是基准利率的九折。在北京多家银行调查发现，原来众多银行上浮个人消费贷款利率并非新闻――早已上浮了1至2年了，而且上浮比例落差很大，也有个别银行比如天津银行仍然维持基准利率按兵未动。至于首套房贷，目前各行在本市最高的首套房商贷利率也不过是与房贷基准利率持平，即7.05%，远未到网上一些人所惊呼的上浮至基准利率的1.05-1.10倍，不过近半月来的确有银行房贷利率较前阶段小有上浮。</p>
                        </div>
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
