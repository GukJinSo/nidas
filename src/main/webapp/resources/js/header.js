function cateFade(target){
	let reset = $('.hCateWrap').children();
	reset.css('display', 'none');
	let targetFade = $('.'+target);
	$('.hCateWrap').css('display', 'block');
	targetFade.fadeIn();
}
function cateFadeOut(){
	let reset = $('.hCateWrap').children();
	reset.fadeOut();
}