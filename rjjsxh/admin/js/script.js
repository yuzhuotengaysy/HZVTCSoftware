$("document").ready(function(e) {
	delDo();
	Modal();
});


/* 基本新增判断 */
function customerAdd(fm){
	var reemail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	var retel = /^1\d{10}$/;
	if(fm.cusname.value == ""){
		swal("请输入用户名");
		fm.cusname.focus();
		return false;
	} else if(fm.cusname.value.length != 10){
		swal("请输入10位学号作为用户名");
		fm.cusname.focus();
		return false;
	} else if(fm.cuspassword.value == ""){
		swal("请输入密码");
		fm.cuspassword.focus();
		return false;
	} else if(fm.cuspassword.value.length < 6){
		swal("密码长度不得小于6位");
		fm.cuspassword.focus();
		return false;
	} else if(fm.cusnickname.value == ""){
		swal("请输入昵称");
		fm.cusnickname.focus();
		return false;
	} else if(!reemail.test(fm.cusemail.value)){
		swal("请输入正确的邮箱格式");
		fm.cusemail.focus();
		return false;
	}  else if(!retel.test(fm.custel.value)){
		swal("请输入正确的电话");
		fm.custel.focus();
		return false;
	} else{
		return true;
	}
}

function dataAdd(fm){
	if(fm.dataname.value == ""){
		swal("请输入资源名");
		fm.dataname.focus();
		return false;
	} else if(fm.datalink.value == ""){
		swal("请添加附件");
		fm.datalink.focus();
		return false;
	}  else{
		return true;
	}
}

function noticeAdd(fm){
	var content = CKEDITOR.instances.notcontent.document.getBody().getText();
	if(fm.nottitle.value == ""){
		swal("请输入标题");
		fm.nottitle.focus();
		return false;
	} else if(content.length <= 15){
		swal("内容不能少于15字");
		return false;
	} else{
		return true;
	}
}

/* 全选和反选 */
function checked(){			
	var checked = document.getElementsByName("id");
	for(var i = 0; i < checked.length; i++){
		if(checked[i].checked == false){
			checked[i].checked=checked;
		} else{
			checked[i].checked=false;
		}
	}
}

/* 删除判断 */
function judgeDel(n){			
	var checked = document.getElementsByName("id");
	for(var i = 0; i < checked.length; i++){
		if(checked[i].checked == true){
			swal({
		        title: "您确定要删除吗",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {
		    	switch(n){
		    		case 1: $("#customer_del").submit();break;
		    		case 2: $("#notice_del").submit();break;
		    		case 3: $("#data_del").submit();break;
		    		case 4: $("#message_del").submit();break;
		    		default: break;
		    	}
		    });
		    return;
		}
	}
	swal("您没有选中任何一条记录!");
}


function delDo(){
	$(".customer_del").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		swal({
	        title: "您确定要删除吗",
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#DD6B55",
	        confirmButtonText: "删除",
	        closeOnConfirm: false
	    }, function () {
	        window.location.href="main/customer_del.jsp?id="+id;
	    });
	    return;
	});
	$(".notice_del").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		swal({
	        title: "您确定要删除吗",
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#DD6B55",
	        confirmButtonText: "删除",
	        closeOnConfirm: false
	    }, function () {
	        window.location.href="main/notice_del.jsp?id="+id;
	    });
	    return;
	});
	$(".data_del").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		swal({
	        title: "您确定要删除吗",
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#DD6B55",
	        confirmButtonText: "删除",
	        closeOnConfirm: false
	    }, function () {
	        window.location.href="main/data_del.jsp?id="+id;
	    });
	    return;
	});
	$(".message_del").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		swal({
	        title: "您确定要删除吗",
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#DD6B55",
	        confirmButtonText: "删除",
	        closeOnConfirm: false
	    }, function () {
	        window.location.href="main/message_del.jsp?id="+id;
	    });
	    return;
	});
}


/* 修改模态框 */
function Modal(){
	$(".customer_modify").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		var table=document.getElementById('table');
            for(var i=1;i<table.rows[id].cells.length-1;i++){
            	var res = table.rows[id].cells[i].innerHTML;
            	switch(i){
            		case 1: document.getElementById("cusid1").value = res;break;
            		case 2: document.getElementById("cusname1").value = res;break;
            		case 3: document.getElementById("cuspassword1").value = res;break;
            		case 4: document.getElementById("cusnickname1").value = res;break;
            		case 5: if(res == "男")document.getElementById("man1").checked = true; 
            				else document.getElementById("woman1").checked = true;
            				break;
            		case 6:	document.getElementById("cusemail1").value = res;break;			
            		case 7:	document.getElementById("custel1").value = res;break;
            		case 8: var index = res.indexOf("省")+1;
            				if(index == 0) index = res.indexOf("市")+1;
            				document.getElementById("province1")[0] = new Option(res.substring(0,index),res.substring(0,index));
            				document.getElementById("province1")[0].selected = true;
            				document.getElementById("city1")[0]=new Option(res.substring(index,res.length),res.substring(index,res.length));
            				document.getElementById("city1")[0].selected = true;
            				break;
            		default: break;
            	}
            }             
		$("#modal_modify").modal();
	});

	$(".data_modify").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		var table=document.getElementById('table');
            for(var i=1;i<table.rows[id].cells.length-1;i++){
            	var res = table.rows[id].cells[i].innerHTML;
            	switch(i){
            		case 1: document.getElementById("dataid1").value = res;break;
            		case 2: document.getElementById("dataname1").value = res;break;
            		case 3: document.getElementById("datafile1").value = res;break;
            		default: break;
            	}
            }             
		$("#modal_modify").modal();
	});

	$(".notice_modify").click(function(e){
		var id = $(this).parent().parent().find(".tc").find("input").val();
		var content = CKEDITOR.instances.notcontent1;
		var table=document.getElementById('table');
            for(var i=1;i<table.rows[id].cells.length-1;i++){
            	var res = table.rows[id].cells[i].innerHTML;
            	switch(i){
            		case 1: document.getElementById("notid1").value = res;break;
            		case 2: document.getElementById("nottitle1").value = res;break;
            		case 3: document.getElementById("notauthor1").value = res;break;
            		case 4: content.setData(res);break;
            		default: break;
            	}
            }             
		$("#modal_modify").modal();
	});
}
