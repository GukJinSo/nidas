function cateFade(){
	let target = $('.hCateDiv');
	$('.hCateWrap').css('display', 'block');
	target.fadeIn();
}
function cateFadeOut(){
	let reset = $('.hCateWrap').children();
	reset.fadeOut();
}
/*
$(function() {
    let isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
    let thisPage = document.location.href;
    
    if (isMobile && thisPage.indexOf("http://m") == -1 ){
    	location.href='http://m.nidas.shop';
    } else if (!isMobile && thisPage.indexOf("http://www") == -1){
    	location.href='http://www.nidas.shop';
    }
});
*/