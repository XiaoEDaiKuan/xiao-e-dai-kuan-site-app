/*#############################################################
Name: Select to CSS
Version: 0.2
Author: Utom
URL: http://utombox.com/
#############################################################*/
var selects = document.getElementsByTagName('select');

var isIE = (document.all && window.ActiveXObject && !window.opera) ? true : false;

function $id(id) {
	return document.getElementById(id);
}

function stopBubbling (ev) {	
	ev.stopPropagation();
}

function rSelects() {
	for (i=0;i<selects.length;i++){
		selects[i].style.display = 'none';
		select_tag = document.createElement('div');
			select_tag.id = 'select_' + selects[i].name;
			select_tag.className = 'select_box';
		selects[i].parentNode.insertBefore(select_tag,selects[i]);

		select_info = document.createElement('div');	
			select_info.id = 'select_info_' + selects[i].name;
			select_info.className='tag_select';
			select_info.style.cursor='pointer';
		select_tag.appendChild(select_info);

		select_ul = document.createElement('ul');	
			select_ul.id = 'options_' + selects[i].name;
			select_ul.className = 'tag_options';
			select_ul.style.position='absolute';
			select_ul.style.display='none';
			select_ul.style.zIndex='999';
		select_tag.appendChild(select_ul);

		rOptions(i,selects[i].name);
		
		mouseSelects(selects[i].name);

		if (isIE){
			selects[i].onclick = new Function("clickLabels3('"+selects[i].name+"');window.event.cancelBubble = true;");
		}
		else if(!isIE){
			selects[i].onclick = new Function("clickLabels3('"+selects[i].name+"')");
			selects[i].addEventListener("click", stopBubbling, false);
		}		
	}
}


function rOptions(i, name) {
	var options = selects[i].getElementsByTagName('option');
	var options_ul = 'options_' + name;
	for (n=0;n<selects[i].options.length;n++){	
		option_li = document.createElement('li');
			option_li.style.cursor='pointer';
			option_li.className='open';
		$id(options_ul).appendChild(option_li);

		option_text = document.createTextNode(selects[i].options[n].text);
		option_li.appendChild(option_text);

		option_selected = selects[i].options[n].selected;

		if(option_selected){
			option_li.className='open_selected';
			option_li.id='selected_' + name;
			$id('select_info_' + name).appendChild(document.createTextNode(option_li.innerHTML));
		}
		
		option_li.onmouseover = function(){	this.className='open_hover';}
		option_li.onmouseout = function(){
			if(this.id=='selected_' + name){
				this.className='open_selected';
			}
			else {
				this.className='open';
			}
		} 
	
		option_li.onclick = new Function("clickOptions("+i+","+n+",'"+selects[i].name+"')");
	}
}

function mouseSelects(name){
	var sincn = 'select_info_' + name;

	$id(sincn).onmouseover = function(){ if(this.className=='tag_select') this.className='tag_select_hover'; }
	$id(sincn).onmouseout = function(){ if(this.className=='tag_select_hover') this.className='tag_select'; }

	if (isIE){
		$id(sincn).onclick = new Function("clickSelects('"+name+"');window.event.cancelBubble = true;");
	}
	else if(!isIE){
		$id(sincn).onclick = new Function("clickSelects('"+name+"');");
		$id('select_info_' +name).addEventListener("click", stopBubbling, false);
	}

}

function clickSelects(name){
	var sincn = 'select_info_' + name;
	var sinul = 'options_' + name;	

	for (i=0;i<selects.length;i++){	
		if(selects[i].name == name){				
			if( $id(sincn).className =='tag_select_hover'){
				$id(sincn).className ='tag_select_open';
				$id(sinul).style.display = '';
			}
			else if( $id(sincn).className =='tag_select_open'){
				$id(sincn).className = 'tag_select_hover';
				$id(sinul).style.display = 'none';
			}
		}
		else{
			$id('select_info_' + selects[i].name).className = 'tag_select';
			$id('options_' + selects[i].name).style.display = 'none';
		}
	}

}

function clickOptions(i, n, name){		
	var li = $id('options_' + name).getElementsByTagName('li');

	$id('selected_' + name).className='open';
	$id('selected_' + name).id='';
	li[n].id='selected_' + name;
	li[n].className='open_hover';
	$id('select_' + name).removeChild($id('select_info_' + name));

	select_info = document.createElement('div');
		select_info.id = 'select_info_' + name;
		select_info.className='tag_select';
		select_info.style.cursor='pointer';
	$id('options_' + name).parentNode.insertBefore(select_info,$id('options_' + name));

	mouseSelects(name);

	$id('select_info_' + name).appendChild(document.createTextNode(li[n].innerHTML));
	$id( 'options_' + name ).style.display = 'none' ;
	$id( 'select_info_' + name ).className = 'tag_select';
	selects[i].options[n].selected = 'selected';

	var evt = document.createEvent('Event');
	evt.initEvent('onchange',true,true);
	selects[i].dispatchEvent(evt);
	if(selects[i].dispatchEvent){
		selects[i].dispatchEvent(evt);}
	else{
		selects[i].fireEvent('onchange');
	}
}

window.onload = function(e) {
	bodyclick = document.getElementsByTagName('body').item(0);
	rSelects();
	bodyclick.onclick = function(){
		for (i=0;i<selects.length;i++){	
			$id('select_info_' + selects[i].name).className = 'tag_select';
			$id('options_' + selects[i].name).style.display = 'none';
		}
	}
}