function cateFade(){
	let target = $('.hCateDiv');
	$('.hCateWrap').css('display', 'block');
	target.fadeIn();
}
function cateFadeOut(){
	let reset = $('.hCateWrap').children();
	reset.fadeOut();
}