function addComma(value){
	return Number(value).toLocaleString();
}
function removeKorSc(value){
	return parseInt(value.replace(/,/g, "").replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ));
}