/*!
 * jQuery Simple Cookie Notice Plugin v1.2
 *  *
 * Copyright 2014, Periscopix
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */

(function( $ ) {
    $.fn.simpleCookieNotice = function(options) {

        var settings = $.extend( {
		        setImpDate: 'Mar 22, 2016',
		        setURL : /#/,
		        cookieText: 'Ich bin mit dem Einsatz von Cookies entsprechend Ziffer 5. der <a href="https://www.bonaval.de/infos/Einwilligung">Datenschutzerklärung</a> einverstanden. <a style="text-decoration:underline;" href="javascript:closeCookieInfo()">OK</a>',
            setCSS: {'width':'100%','padding':'4px', 'background': '#2b2b35', 'color': '#aaa',
                     'z-index': '99', 'text-align': 'center', 'font-size': '13px'
                    },
		        cookiePageURL: '#'
		    }, options);

	      var firstPageCheck = settings.setURL.test(document.referrer);
	      var impDate = parseFloat(Date.parse(settings.setImpDate).toString().slice(0,10));
	      var nowDate = new Date();
	      nowDate = parseFloat(Date.parse(nowDate).toString().slice(0,10));
	      var prevSession;

	      if($.cookie('__utma') != null){
		        var arrCookie = $.cookie('__utma').split('.');
		        if(arrCookie[5] == 1 && nowDate - arrCookie[3] < 5){
			          prevSession = 0;
		        } else{prevSession = arrCookie[3];}
	      }
	      else{prevSession = 0;}


	      if(firstPageCheck === false){
		        if(impDate > prevSession){
				        cookInfo();
				    }
	      }

	      function cookInfo(){
		        $('#top').prepend('<div id="cookieInfo">' + settings.cookieText + '</div>');
		        $('#cookieInfo').css(settings.setCSS);
	      }
    };
})( jQuery );
function closeCookieInfo() {
    $("#cookieInfo").hide();
    $('#top').css({'top': '0'});
}
