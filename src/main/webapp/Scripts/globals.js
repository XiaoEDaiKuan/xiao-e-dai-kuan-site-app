(function($){
    $.getUrlParam = function(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }
})(jQuery);


function reloadCaptcha() {  
    var obj = document.getElementById('captchaimg');  
    var captchaURL = obj.src+"?nocache=" + Math.floor(Math.random()*100000000 + 100000000);  
    obj.src =captchaURL ;
}
$(document).ready(function(){  
	$("#pop_save").click(function(){
		tipsWindown("产品信息保存到邮箱","iframe:iframe:popSave?productId="
						                          + $(this).attr("data"),"580","215","true","","false","text","");
	});
	$("#pop_city").click(function(){
		tipsWindown("您可以选择以下地区：","iframe:iframe:pop_city.jsp","500","200","true","","false","text","");
	});
	$("#pop_question").click(function(){
		tipsWindown("我要提问：", "iframe:iframe:postQuestionForm",
				"550", "465", "true", "", "false", "text", "");
	});
});

setTimeout('_magicTimeout()',20*1000);
function _magicTimeout(){
   $('.time_box').hide();
}

var searchProduct = function(){
		var url = "queryProduct?";
		$(".proSearch").each(function(){
    	var val = $(this).attr("value");
    	if (val) {
    		url += $(this).attr("id") + "=" + val + "&";
    	}
    });
		document.location.href = url;
};
