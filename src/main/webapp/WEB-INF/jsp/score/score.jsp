<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人信用计算器</title>
<%@include file="../../inc/globalScript.jsp" %>
<script type="text/javascript">
var questions = [
    {question:"您的月收入是多少？",choice:[
        {content:"小于3500",down:5000,up:20000},
        {content:"3500~7000",down:10000,up:30000},
        {content:"7000~15000",down:15000,up:50000},
        {content:"15000以上",down:20000,up:60000}]},
    {question:"您就职的公司类型？",choice:[
        {content:"公务员/事业单位",down:1.5,up:1.2},
        {content:"大型垄断企业",down:1.5,up:1.2},
        {content:"世界500强或上市企业",down:1.2,up:1.1},
        {content:"普通企业",down:1,up:1}]},
    {question:"您的职位？",choice:[
        {content:"高层领导",down:1.25,up:1.1},
        {content:"中层管理人员",down:1.1,up:1.05},
        {content:"一般员工",down:1,up:0.95}]},
    {question:"您是否有房产?",choice:[
        {content:"无房产",down:1,up:0.95},
        {content:"有房产（商品房）",down:1.3,up:1.2},
        {content:"有房产（非商品房）",down:1.2,up:1.1}]},
    {question:"您是否是本地户籍?",choice:[
        {content:"本地户籍",down:1.25,up:1.1},
        {content:"外地户籍",down:1,up:0.9}]},
    {question:"您是否愿意提供实名认证（身份证，联系方式）?",choice:[
        {content:"是",down:1.1,up:1.05},
        {content:"否",down:1,up:1}]},
    {question:"您是否愿意提供信用认证（信用报告）?",choice:[
        {content:"是",down:1.8,up:1.4},
        {content:"否",down:1,up:1}]},
    {question:"您是否愿意提供流水认证（6个月银行流水）?",choice:[
        {content:"是",down:1.2,up:1.05},
        {content:"否",down:1,up:1}]},
    {question:"您是否愿意接受访谈（15分钟内的电话访谈）?",choice:[
        {content:"是",down:1.3,up:1.2},
        {content:"否",down:1,up:1}]}
];  
var questionIndex = 0;
$(document).ready(function(){
    showQuestion();
    $("#resultData").css("background","url('images/images/score_pic_0.png') no-repeat right bottom");
    $("#shenqingBtn").hide();
});
var _down = 0;
var _up = 0;
var showQuestion = function(){
    $("#question").html(questions[questionIndex].question);
    $("#QIndex").html("问题" + (questionIndex + 1 )+ "/共" + questions.length + "题");
    var choice = "<ul>";
    for(var i = 0; i < questions[questionIndex].choice.length; i++){
        choice += "<li><input type='radio' style='width:16px;margin-right:8px' name='CheckboxGroup' ";
        if(i == 0)
           choice += "checked = 'true' " 
        choice += "value='" + questions[questionIndex].choice[i].down + "|" + questions[questionIndex].choice[i].up + "' />" + questions[questionIndex].choice[i].content + "</li>"; 
    }
    choice += "</ul>";
    $("#scoreContent").html(choice);
};
var next = function(){
    var _data = $('input[type="radio"][name="CheckboxGroup"]:checked').val().split("|");
    //alert(_data);
    if(questionIndex == 0){
        _down = Number(_data[0]);
        _up = Number(_data[1]);
    }else{
        _down = _down * Number(_data[0]);
        _up = _up * Number(_data[1]);
        //alert(_down + " , "+ _up);
    }
   
    
    if(questionIndex < questions.length - 1){
        questionIndex++;
        showQuestion();
        $("#resultData").css("background","url('images/images/score_pic_9-" + questionIndex+ ".png') no-repeat right bottom");
    }else{
        $("#nextBtn").hide();
        $("#shenqingBtn").show();
        $("#resultData").css("background","url('images/images/score_pic_9.png') no-repeat right bottom");
        $("#strCreditMin").val((_down/10000).toFixed(1));
        $("#strCreditMax").val((_up/10000).toFixed(1));
        $("#resultData").html("<font>预计贷款额度</font><p style='line-height:30px;margin-top:10px'>" + (_down/10000).toFixed(1) + " ~ " + (_up/10000).toFixed(1) + "<br><span style='font-size:18px'>万元</span></p>");
        $("#resultProduct").show();
        $("#resultTitle").show();
        $("#resultProduct").attr("src","queryForScore?creditType=0&maxLoanAmt=" + (_up/10000).toFixed(1) + "&minLoanAmt=" + (_down/10000).toFixed(1));
    }
};

var reset = function(){
    questionIndex = 0;
    $("#nextBtn").show();
    $("#resultData").html("");
    $("#shenqingBtn").hide();
    $("#resultData").css("background","url('images/images/score_pic_9.png') no-repeat right bottom");
    showQuestion();
}
</script>
</head>

<body>
<%@include file="../../inc/scoreHeader.jsp" %>
<!--===========页面内容部分 开始===========-->
<div class="score"></div>
<div class="score1 font_f clear"><b>9F云信用评分器<em>（回答9个问题&nbsp;看看您能贷多少）</em></b><span>已有<font>54555</font>人使用9F云信用信用评分器评估信用</span></div>
<div class="score2 ground clear">
  <div class="score2_left font_f" id="resultData"></div>
  <div class="score2_right">
    <p><b><span id="question"></span></b><br /><font><span id="QIndex"></span></font></p> 
    <div class="score_right1" id="scoreContent">
      
    </div>
    <div class="kong2"></div>
    <div class="score_right2">
        <input name="" type="button" id="nextBtn" value="" class="score_btn1" onclick="next()" />
        <form action="scoreSave" target="_top" method="post">
            <input type="hidden" id="strCreditMin" name="minLoanAmt"/>
            <input type="hidden" id="strCreditMax" name="maxLoanAmt"/>
            <input type="hidden" id="strCreditType" name="creditType" value="0"/>
            <!--input name="" type="submit" id="shenqingBtn" value="" style="background:url('images/img21.jpg')" class="score_btn1" /-->
        </form>
        <input name="" type="button" value="" class="score_btn2" onclick="reset()"/>
      </div>
  </div>
</div>
<div class="score3"><a href="scoreChoose">返回重新选择评分器类型</a></div>
<div>
<div class="main3 ground"  style="background:#FFFFFF;padding-top:10px; padding-bottom:10px">
<h3 id="resultTitle" style="display:none">&nbsp;&nbsp;根据您的信用额度，适合您的贷款产品如下：</h3>
</div>
<iframe id="resultProduct" name="resultProduct" style="display:none" width="100%" height="850px" src="" frameborder="no" 
				border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes">

</iframe>
</div>
<div class="kong2"></div>
<div class="score4"><a href="queryProduct" target="_blank">点击查看更多产品</a></div>
<div class="score5">如果您需要更高的信用额度，请查看抵押贷款产品&nbsp;&nbsp;<a href="queryProduct" target="_blank">进入产品搜索&gt;&gt;</a></div>
<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp" %>
</body>
</html>
