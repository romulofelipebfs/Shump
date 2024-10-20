/// @description Insert description here
// You can write your code in this editor

vida = 10;
estado = "chegando"

tempo_carregando = game_get_speed(fps) * .5;
timer_carregando = 0;

contador = 0;

maquina_de_estado = function(){
	
	
	switch(estado){
		case "chegando":
			if(y < 160){
				vspeed = 1;
			}else{
				estado = "carregando";		
			}
			break;
		case "carregando": 
			vspeed = 0;
			timer_carregando++;
			
			if(timer_carregando>=tempo_carregando){ 
				
				
				estado = choose("atirando", "atirando2");
				timer_carregando = 0;	
				
				contador++;
			}
			
			break;
		case "atirando":
			
			
			
			if(instance_exists(obj_player)){
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo_3);
				_tiro.speed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir + 90;
			
				if(contador<3)
					estado = "carregando";
				else estado = "fugindo";
			}
			break;
		
		case "atirando2":
			
			var _ang = 255;
			
			repeat(3){
				
				var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo_3b);
				_tiro.speed = 4;
				_tiro.direction = _ang;
				
				_ang += 15;
				
			}
			
			if(contador<3)
				estado = "carregando";
			else estado = "fugindo";
			
			break;
		
		case "fugindo":
			vspeed = -1;
			if(y < -64){
				instance_destroy();
			}
			break;
	}
	
}



morrendo = function(){
	if(vida>1){
		vida--;
	}else{
		instance_destroy();
		instance_create_layer(x, y, "Particulas",obj_inimigo_part);
		screenshake(20);
	}
}