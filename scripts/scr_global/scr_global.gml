// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function sendo_destruido(_particula = obj_tiro_part){
	
	instance_destroy();
	
	instance_create_layer(x, y, "Particulas", _particula)
}


function screenshake(_theme = 1){
	if(instance_exists(obj_screenshake)){
		obj_screenshake.theme = _theme;
	}
}

