/* activate scrollspy menu */
$('body').scrollspy({
    target: '#navbar-collapsible',
    offset: 52
});
$(document).ready(function(){
    $('.bxslider').bxSlider({
    slideWidth: 400,
    minSlides: 1,
    maxSlides: 3,
    slideMargin: 10
    });
});
/* smooth scrolling sections */
$('a[href*=#]').click(function() {
    if (typeof this.hash !== "string" || (this.hash !== "#top" && this.hash.substr(0, 8) !== "#section")) {
        return;
    }
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
            $('html,body').animate({
                scrollTop: target.offset().top
            }, 800);

            if (this.hash=="#top") {
                $('.scroll-up').hide();
            }
            else {
                $('.scroll-up').show();
            }


            // activte animations in this section
            target.find('.animate').delay(1200).addClass("animated");
            setTimeout(function(){
                target.find('.animated').removeClass("animated");
            },2000);

            return false;
        }
    }
});

$(window).load(function(){
		$('ul li div').hover(
				function(){
					  var a = $(this).attr('alt');
					  $(".default").text(function () {
						    return $(this).text().replace("Pfandkredite erhalten Sie für viele Wertgegenstände.", a);
					  });
				},
				function(){
					  var a = $(this).attr('alt');
					  $(".default").text(function () {
						    return $(this).text().replace(a, "Pfandkredite erhalten Sie für viele Wertgegenstände.");
					  });
				}
		);
});

function googleAnalyticsOptOut() {
    var disableStr = 'ga-disable-UA-68154042-1';
    document.cookie = disableStr + '=true; expires=Thu, 31 Dec 2099 23:59:59 UTC; path=/';
    window[disableStr] = true;
}
