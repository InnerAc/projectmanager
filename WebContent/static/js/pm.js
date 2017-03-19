function timeChange(){
	var times = $('time');
	var tn = times.length;
	for(var i=0;i<tn;i++){
		var time = $(times[i]);
		console.log('time = '+time.html());
		var nd = new Date(time.html()*1000).toLocaleString().replace(/:\d{1,2}$/,' ').replace(/..午/,' ');
		console.log(nd);
		time.html(nd);
	}
}
function login(){
	$(".divLoginPop").show();
}
function unLogin(){
	$(".divLoginPop").hide();
}