function showCategory(category_name){
	var http = new XMLHttpRequest();
	
	http.onreadystatechange = function(){
		if(http.readyState === 4 && http.status === 200){
			document.getElementById("div-prod").innerHTML = http.responseText;

		}
	};
	
	http.open("POST", "categoryAjax.jsp", true);
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	http.send("param="+category_name);
};
