/// @description Insert description here
// You can write your code in this editor

atirando = function(){
	var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo_1);
	_tiro.vspeed = 4;
}

alarm[0] = 120;

criado_sequencia = in_sequence;


morrendo = function(){
	sendo_destruido(obj_inimigo_part);
	
	var _chance = random(100)
	if(_chance > 90){
		instance_create_layer(x, y, layer, obj_power_up);
	}
	
}