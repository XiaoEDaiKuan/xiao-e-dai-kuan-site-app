$(document).ready(
		function() {
			$("#pop_city").click(
					function() {
						tipsWindown("您可以选择以下地区：",
								"iframe:iframe:pop_city.html", "500", "200",
								"true", "", "false", "text", "");
					});
			$("#pop_question").click(
					function() {
						tipsWindown("我要提问：", "iframe:iframe:pop_question.html",
								"550", "465", "true", "", "false", "text", "");
					});

		});

setTimeout('_magicTimeout()', 20 * 1000);
function _magicTimeout() {
	$('.time_box').hide();
}