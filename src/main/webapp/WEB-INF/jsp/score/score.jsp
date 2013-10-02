<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人信用计算器</title>
<%@include file="../../inc/globalScript.jsp" %>
<script type="text/javascript">
var questions = [
    {question:"银行卡发放工资（月）",choice:[
        {content:"小于3500",down:5000,up:20000},
        {content:"3500~7000",down:10000,up:30000},
        {content:"7000~15000",down:15000,up:50000},
        {content:"15000以上",down:20000,up:60000}]},
    {question:"就职公司类型",choice:[
        {content:"公务员/事业单位",down:1.2,up:1.5},
        {content:"大型垄断企业",down:1.2,up:1.5},
        {content:"世界500强或上市企业",down:1.1,up:1.2},
        {content:"普通企业",down:1,up:1}]},
    {question:"职位",choice:[
        {content:"高层领导",down:1.1,up:1.25},
        {content:"中层管理人员",down:1.05,up:1.1},
        {content:"一般员工",down:0.95,up:1}]},
    {question:"房产",choice:[
        {content:"无房产",down:0.95,up:1},
        {content:"有房产（商品房）",down:1.2,up:1.3},
        {content:"有房产（非商品房）",down:1.1,up:1.2}]},
    {question:"户籍",choice:[
        {content:"本地户籍",down:1.1,up:1.25},
        {content:"外地户籍",down:0.9,up:1}]},
    {question:"实名认证（身份证，联系方式）",choice:[
        {content:"是",down:1.05,up:1.1},
        {content:"否",down:1,up:1}]},
    {question:"信用认证（信用报告）",choice:[
        {content:"是",down:1.4,up:1.8},
        {content:"否",down:1,up:1}]},
    {question:"流水认证（6个月银行流水）",choice:[
        {content:"是",down:1.05,up:1.2},
        {content:"否",down:1,up:1}]},
    {question:"访谈（15分钟内的电话访谈）",choice:[
        {content:"是",down:1.2,up:1.3},
        {content:"否",down:1,up:1}]}
];  
var questionIndex = 0;
$(document).ready(function(){
    showQuestion();
    $("#resultData").css("background","url('images/score_pic_10.jpg') no-repeat right bottom");
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
    if(questionIndex == 0){
        _down = parseInt(_data[0]);
        _up = parseInt(_data[1]);
    }else{
        _down *= parseFloat(_data[0]);
        _up *= parseFloat(_data[1]);
    }
    if(questionIndex < questions.length - 1){
        questionIndex++;
        showQuestion();
        $("#resultData").css("background","url('images/score_pic_" + (questionIndex + 1) + "0.jpg') no-repeat right bottom");
    }else{
        $("#nextBtn").hide();
        $("#shenqingBtn").show();
        $("#resultData").css("background","url('images/score_results.jpg') no-repeat right bottom");
        $("#strCreditMin").val((_down/10000).toFixed(0));
        $("#strCreditMax").val((_up/10000).toFixed(0));
        $("#resultData").html("<font>预计贷款额度</font><p>" + (_down/10000).toFixed(0) + " ~ " + (_up/10000).toFixed(0) + "</p>");
    }
};

var reset = function(){
    questionIndex = 0;
    $("#nextBtn").show();
    $("#resultData").html("");
    $("#shenqingBtn").hide();
    $("#resultData").css("background","url('images/score_pic_10.jpg') no-repeat right bottom");
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
        <input name="" type="button" id="nextBtn" value="" class="score_btn1" onClick="next()" />
        <form action="" method="post">
            <input type="hidden" id="strCreditMin" name="strCreditMin"/>
            <input type="hidden" id="strCreditMax" name="strCreditMax"/>
            <input name="" type="submit" id="shenqingBtn" value="" style="background:url('images/img21.jpg')" class="score_btn1" />
        </form>
        <input name="" type="button" value="" class="score_btn2" onClick="reset()"/>
      </div>
  </div>
</div>
<div class="score3"><a href="score_choose.html">返回重新选择评分器类型</a></div>
<div class="kong2"></div>

<!--===========页面内容部分 结束===========-->
<%@include file="../../inc/memberFooter.jsp" %>
</body>
</html>