$("document").ready(function(e) {
	signIn();
	checkss();
});

//验证码
function changeCode(){
	var image = document.getElementsByTagName("img");
	var myDate = new Date();
	image.src = "main/image.jsp?time="+myDate.getTime();
}

//登录按钮
function signIn(){
	$("#signIn").click(function(){
		$('#signModal').modal();
	});
    $("#modifyPsw").click(function(){
		$('#modifyModal').modal();
	});
	$("#modifyPic").click(function(){
		$('#picModal').modal();
	});
	$("#register").click(function(){
		$('#registerModal').modal();
	});
}


//基本登录验证
function signCheck(){
	var username = document.getElementById("username").value;
	var psw = document.getElementById("password").value;
	var code = document.getElementById("code").value;
	if(username == ""){
		alert("请输入用户名");
		document.getElementById("username").focus();
		return false;
	} else if(psw == ""){
		alert("请输入密码");
		document.getElementById("password").focus();
		return false;
	} else if(code == ""){
		alert("请输入验证码");
		document.getElementById("code").focus();
		return false;
	} else{
		return true;
	}
}
function signAdminCheck(){
	var adminName = document.getElementById("adminName").value;
	var adminPassword = document.getElementById("adminPassword").value;
	var adminCode = document.getElementById("adminCode").value;
	if(adminName == ""){
		alert("请输入用户名");
		document.getElementById("adminName").focus();
		return false;
	} else if(adminPassword == ""){
		alert("请输入密码");
		document.getElementById("adminPassword").focus();
		return false;
	} else if(adminCode == ""){
		alert("请输入验证码");
		document.getElementById("adminCode").focus();
		return false;
	} else{
		return true;
	}
}

//修改密码验证
function modifyCheck(){
	var psw1 = document.getElementById("password1").value;
	var psw2 = document.getElementById("password2").value;
	if(psw1 == ""){
		alert("密码不能为空");
		document.getElementById("password1").focus();
		return false;
	} else if(psw2 == ""){
		alert("密码不能为空");
		document.getElementById("password2").focus();
		return false;
	}
	if(psw1 == psw2){
		return true;
	} else {
		alert("两次密码输入不一致");
		return false;
	}
}

function checkss(){
	$(".checkinfo").click(function(){
		if(document.getElementById("nickname").value == ""){
			alert("姓名不能为空");
			document.getElementById("nickname").focus();
			return;
		} else if(document.getElementById("classess").value == ""){
			alert("班级不能为空");
			document.getElementById("classess").focus();
			return;
		} else if(document.getElementById("tel").value == ""){
			alert("电话不能为空");
			document.getElementById("tel").focus();
			return;
		}  else if(document.getElementById("dormitory").value == ""){
			alert("寝室不能为空");
			document.getElementById("dormitory").focus();
			return;
		} else{
			document.getElementById("nickname1").value = document.getElementById("nickname").value;
			if( document.getElementById("man").checked == true) document.getElementById("man1").checked = true; 
			else document.getElementById("woman1").checked = true;
			document.getElementById("classess1").value = document.getElementById("classess").value;	
			document.getElementById("tel1").value = document.getElementById("tel").value;	
			document.getElementById("dormitory1").value = document.getElementById("dormitory").value;        
			$("#checkit").modal();
		}
	});
}