/// @description Insert description here
// You can write your code in this editor

vel = 2;
espera_tiro = 10;
timer_tiro = 0;

vidas = 3;

escudos = 5;

meu_escudo = noone;

level_tiro = 1;

tempo_invencivel = 60;
timer_invencivel = 0;


controla_player = function(){
	
	timer_invencivel--;

	//show_debug_message(timer_tiro);
	
	com_escudo();
	
	if(keyboard_check_pressed(ord("E"))) usa_escudo(); 
	
	var _cima, _dir, _baixo, _esq, _atirar, _perder, _escudo;
	
	_cima = keyboard_check(ord("W"));
	_dir = keyboard_check(ord("D"));
	_baixo = keyboard_check(ord("S"));
	_esq = keyboard_check(ord("A"));
	_atirar = keyboard_check(vk_space);
	_perder = keyboard_check_pressed(vk_enter);
	_escudo = keyboard_check_pressed(ord("E"));
	
	var _velh = (_dir - _esq) * vel;
	x += _velh;
	var _velv = (_baixo - _cima) * vel;
	y += _velv;
	
	
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
	
	
	//if(_cima) show_debug_message("Para cima");
	//if(_dir) show_debug_message("direita");
	//if(_baixo) show_debug_message("baixo");
	//if(_esq) show_debug_message("esquerda");
	timer_tiro--;
	
	if(_atirar && timer_tiro<=0) {
		
		if(level_tiro == 1) tiro_1();
		else if(level_tiro ==2) tiro_2()
		else if(level_tiro ==3) tiro_3()
		
		timer_tiro = espera_tiro;
	
	}
	
	

}

tiro_1 = function(){
	var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro);
	_tiro.vspeed = -5;
}

tiro_2 = function(){
	var _tiro = instance_create_layer(x - 10, y, "Tiro", obj_tiro);
	_tiro.vspeed = -5;
	
	_tiro = instance_create_layer(x + 10, y, "Tiro", obj_tiro);
	_tiro.vspeed = -5;
}

tiro_3 = function(){
	
	var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro);
	_tiro.vspeed = -5;
	
	_tiro = instance_create_layer(x - 10, y, "Tiro", obj_tiro);
	_tiro.vspeed = -5;
	
	_tiro = instance_create_layer(x + 10, y, "Tiro", obj_tiro);
	_tiro.vspeed = -5;
}

ganhar_level = function(){
	if(level_tiro >= 3){
		level_tiro = 3;
	}else level_tiro++;
}

desenha_icone = function(_sprite = spr_vida, _num_rep = 3, _y=0){
	
	var _x = 20;

	//draw_text(20, _y - 40, "Vida");


	repeat(_num_rep){
		draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, c_white, .5);
		_x += 25;
	}

}

perder_vida = function(){
	
	
	if(timer_invencivel > 0) exit;
	
	screenshake(20);
	if(vidas > 0){
		vidas--;
		timer_invencivel = tempo_invencivel;
	} 
	else{ 
		instance_destroy();
		screenshake(50);
		
		}	
}

usa_escudo = function(){
	if(escudos>0 && !instance_exists(meu_escudo)){
		meu_escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
		escudos--;
	}
	
}

com_escudo = function(){
	if(instance_exists(meu_escudo)){
		meu_escudo.x = x;
		meu_escudo.y = y;
		timer_invencivel = 10;
	}
}

