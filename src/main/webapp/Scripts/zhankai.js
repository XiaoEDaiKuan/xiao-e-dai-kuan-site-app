function showmenu(id) {
	var list = document.getElementById("list"+id);
	var menu = document.getElementById("menu"+id)
	if (list.style.display=="none") {
		document.getElementById("list"+id).style.display="block";
		menu.className = "title1";
	}else {
		document.getElementById("list"+id).style.display="none";
		menu.className = "title";
	}
} 

function n_showmenu(id) {
	var n_list = document.getElementById("n_list"+id);
	var n_menu = document.getElementById("n_menu"+id)
	if (n_list.style.display=="none") {
		document.getElementById("n_list"+id).style.display="block";
		n_menu.className = "mes_tit1";
	}else {
		document.getElementById("n_list"+id).style.display="none";
		n_menu.className = "mes_tit";
	}
} 

(function($){
    $.getUrlParam = function(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }
})(jQuery);