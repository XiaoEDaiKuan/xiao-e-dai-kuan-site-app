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