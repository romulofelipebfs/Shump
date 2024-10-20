/// @description Insert description here
// You can write your code in this editor

if(theme > 0.1){
	
	var _x = random_range(-theme, theme);
	var _y = random_range(-theme, theme);
	
	view_set_xport(view_current, _x);
	
	view_set_yport(view_current, _y);
	
}else{
	theme = 0;
	
	view_set_xport(view_current, 0);
	
	view_set_yport(view_current, 0);
}


theme = lerp(theme, 0, .1);