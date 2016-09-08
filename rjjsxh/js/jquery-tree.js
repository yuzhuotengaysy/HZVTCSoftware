// JavaScript Document
$.extend({
	paddingsign: function(obj){
		var label = obj.html();
		var start = label.lastIndexOf(">");
		if(start != -1) label = label.substring(start+1);
		//if (children.is(":visible")) {
		obj.html("<span style='border:0;' class='glyphicon glyphicon-minus-sign'></span>" + label);
		//} else {
			//$(this).html("<span style='border:0;margin-right:8px;' class='glyphicon glyphicon-minus-sign'></span>" + label);
		//}
	}
});

$(document).ready(function(){
    $(function () {
      $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '收起分支');
      $('.tree li.parent_li > div > div > span').each(function(index, item){
      	  var children = $(this).parent().parent().parent('li.parent_li').find(' > div > div > ul > li');
      	  if(children != null){
      	  	$.paddingsign($(this));
      	  }
      });
      $('.tree li.parent_li > div > div > span').on('click', function (e) {
          var children = $(this).parent().parent().parent('li.parent_li').find(' > div > div > ul > li');
          var label = $(this).html();
          var start = label.lastIndexOf(">");
          if(start != -1) label = label.substring(start+1);
          if (children.is(":visible")) {
              children.hide('fast');
              $(this).attr('title', '展开分支');
              $(this).html("<span style='border:0;margin-right:8px;' class='glyphicon glyphicon-plus-sign'></span>" + label);
          } else {
              children.show('fast');
              $(this).attr('title', '收起分支');
              $(this).html("<span style='border:0;margin-right:8px;' class='glyphicon glyphicon-minus-sign'></span>" + label);
          }
          e.stopPropagation();
      });
  });

 $('#checkModal').on('hidden.bs.modal', function (e) {
      // do something...
      $("#pass").removeAttr("checked");
      $("#unpass").removeAttr("checked");
      $("#checkbak").addClass("hide");
    });
    $("#pass").change(function(){
      if($("#pass").val() == "pass"){
        $("#checkbak").addClass("hide");
      }else{
        $("#checkbak").removeClass("hide");
      }
    });
    $("#unpass").change(function(){
      if($("#unpass").val() == "unpass"){
        $("#checkbak").removeClass("hide");
      }else{
        $("#checkbak").addClass("hide");
      }
    });
  });
