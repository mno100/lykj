$(function(){
	
});

function funAddDiv(e){
	var divid=e.firstChild.getAttribute('data-id');
	var divName=e.firstChild.getAttribute('data-name');
	//alert($("#"+divid).html());
	console.log(divid);
	console.log(divName);
	var list = document.getElementById('viewList').getElementsByTagName('div');
	var flag=false;
	for (var i = 0; i < list.length;i++)
	{
	    if(divid==list[i].id){
	    	list[i].setAttribute("class","right-list");
	    	flag=true;
	    }else{
	    	list[i].setAttribute("class","right-list-close");
	    }
	}
	console.log(flag);
	if(!flag){
		var text="<div class='right-list' id='"+divid+"'><a href='#' class='a01'>新页面</a>&nbsp;&nbsp;<a href='javascript:void(0)' class='a01' onclick='closeDiv(this)'>x</a></div>";
		$("#viewList").append(text);
	}
	
	//$("#viewList div").each(function(i){this.attr("class","right-list-close")}) 
	//alert(divid);
}

function closeDiv(e){
	 var my = e.parentNode;
	 if (my != null){
		 var mybo=$(this).parent().prev();
		 if(mybo != null){
			 console.log(mybo.innerHTML);
			 mybo.click();
		 }
		 
		 my.parentNode.removeChild(my);
	 }
}

function onDiv(e){
	e.parentNode.setAttribute("class","right-list");
	
}

