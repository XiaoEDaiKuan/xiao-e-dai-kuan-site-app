$(document).ready(
		function() {
			$("#pop_city").click(
					function() {
						tipsWindown("您可以选择以下地区：",
								"iframe:iframe:pop_city.jsp", "500", "200",
								"true", "", "false", "text", "");
					});
			$("#pop_question").click(
					function() {
						tipsWindown("我要提问：", "iframe:iframe:postQuestionForm",
								"550", "465", "true", "", "false", "text", function(){location.reload();});
					});

		});

setTimeout('_magicTimeout()', 20 * 1000);
function _magicTimeout() {
	$('.time_box').hide();
}