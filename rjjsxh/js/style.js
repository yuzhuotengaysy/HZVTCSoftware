var username;
var password;

$("document").ready(function(e) {
	show();
});

//登录按钮
function show(){
	$("#sign").click(function(){
		$('#signModal').modal();
		signEnter();
	});
        $("#modifyPsw").click(function(){
		$('#modifyModal').modal();
		signEnter();
	});
}

//登陆框回车键
function signEnter() {
	$("#username").keydown(function(e){ 
		if(e.keyCode==13){ 
			document.getElementById("password").select();
		}
	});
	$("#password").keydown(function(e){ 
		if(e.keyCode==13){ 
			document.getElementById("signIn").click();
		}
	});
}