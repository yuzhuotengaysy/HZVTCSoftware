$("document").ready(function(e) {
	searchFor();
	BindEnter();
});

//查找题目
function searchFor(){
	$("#searchBtn").click(function(){
		if(document.getElementById("nums").value>=1001 && document.getElementById("nums").value<=1213){
			location.href = "answer/"+document.getElementById("nums").value+".html";
		} else{
			alert("查询失败,没有该题目！");
		}
	});	
}

//回车键绑定
function BindEnter() {
	$("#nums").keydown(function(e){ 
		if(e.keyCode==13){ 
			document.getElementById("searchBtn").click();
		}
	});
}