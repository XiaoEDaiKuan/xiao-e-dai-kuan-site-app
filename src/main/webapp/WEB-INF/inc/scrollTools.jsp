<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function(){  
	$("div.ranklist").myScroll({
		speed:40,
		rowHeight:24
	});
});
</script>

<style type="text/css">
/* ranklist */
.ranklist{height:80px;overflow:hidden;}
.ranklist li{height:14px;line-height:14px;overflow:hidden;position:relative;padding:0px;margin:0 0 10px 0;}
.ranklist li em{background:url(images/mun.gif) no-repeat;width:20px;height:16px;overflow:hidden;display:block;position:absolute;left:0;top:0;text-align:center;font-style:normal;color:#333;}
.ranklist li em{background-position:0 -16px;}
.ranklist li.top em{background-position:0 0;color:#fff;}
.ranklist li .num{position:absolute;right:0;top:0;color:#999;}
</style>
<div class="assistant ground">
	<div class="credit_title">
		<span class="credit_title1 font_f">最新公告</span>
	</div>
	<div class="assistant1 ranklist">
		<ul>
			<li class="top">
				XX银行入驻9F云金融平台
			</li>
			<li class="top">
				XX机构XX信贷经理入驻9F云金融平台
			</li>
			<li class="top">
				XX机构XX信贷经理入驻9F云金融平台
			</li>
			<li class="top">
				XX机构XX信贷经理入驻9F云金融平台
			</li>
			<li class="top">
				XX机构XX信贷经理入驻9F云金融平台
			</li>
		</ul>
	</div>

</div>